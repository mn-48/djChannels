from django.db import models
from django.contrib.auth.models import User


class PrivateChtRoom(models.Model):
    room_name = models.CharField(unique=True, max_length=220)
    user1 = models.ForeignKey(User, on_delete=models.CASCADE, related_name="room1")
    user2 = models.ForeignKey(User, on_delete=models.CASCADE, related_name="room2")
    def __str__(self):
        return f"This is the chat between {self.user1} and {self.user2}"

class Message(models.Model):
    room = models.ForeignKey(PrivateChtRoom, null=True, on_delete=models.CASCADE,related_name="messages")
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    msg = models.TextField()
    created_at=models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return f"Private Chat room name: {self.room}"

class GroupName(models.Model):
    group_name = models.CharField(max_length=40, unique=True)
    group_name_to_show=models.CharField(max_length=40)
    participants = models.ManyToManyField( User, related_name='groups_c8', blank=True)
    admins = models.ManyToManyField( User, related_name='admins_group', blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.group_name


class GroupMessage(models.Model):
    group=models.ForeignKey(GroupName, on_delete=models.SET_NULL, blank=True, null=True ,related_name='g_messages')
    user=models.ForeignKey(User, on_delete=models.SET_NULL, blank=True, null=True, related_name='group_messages')
    msg=models.TextField()
    created_at=models.DateTimeField(auto_now_add=True)
    class Meta:
        ordering=['-created_at']
    def __str__(self):
        return self.msg