from django.db import models
from django.contrib.auth.models import User
# Create your models here.


from asgiref.sync import sync_to_async, async_to_sync
from channels.layers import get_channel_layer
import json

from django.db.models.fields import BooleanField

class Notification(models.Model):
    to_user=models.ForeignKey(User,on_delete=models.CASCADE, related_name='notifications')
    from_user=models.ForeignKey(User,on_delete=models.SET_NULL, blank=True, null= True, related_name='generated_notification')
    text=models.CharField(max_length=250)
    created_at=models.DateTimeField(auto_now_add=True)
    url=models.URLField(blank=True, null= True)
    is_read=models.BooleanField(default=False)

    def __str__(self):
        return str(self.to_user.username) + "from " + str(self.from_user.username)+ "id" + str(self.id)
    def save(self, *args, **kwargs):
        super(Notification, self).save(*args, **kwargs)
        channel_layer=get_channel_layer()
        count=Notification.objects.filter(is_read=False).count()
        data={'id':self.id,'notification':self.text,'to_user':self.to_user.username,'from_user':self.from_user.username,'is_read':self.is_read}
        async_to_sync(channel_layer.group_send)(
            'notification_group',{
                'type':'send_notification',
                'value':json.dumps(data)
            }
        )