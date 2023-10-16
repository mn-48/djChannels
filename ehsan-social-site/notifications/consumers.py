import json
from notifications.models import Notification

from asgiref.sync import async_to_sync
from channels.exceptions import DenyConnection
from channels.generic.websocket import WebsocketConsumer
from django.contrib.auth import get_user_model

User = get_user_model()
from .serializers import NotificationSerializer
class NotificationConsumer(WebsocketConsumer):
    def connect(self):
        print("from consumer",self.scope['user'])
        # self.room_name = self.scope['url_route']['kwargs']['room_name']
        # self.room_group_name = 'chat_%s' % self.room_name
        self.room_name = "notification_room"
        self.room_group_name = "notification_group"
        self.user = self.scope["user"]
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )
        self.accept()
        notifications=Notification.objects.filter(to_user=self.scope['user'])
        serializer=NotificationSerializer(notifications,many=True)
        self.send(text_data=json.dumps(serializer.data))

    def disconnect(self, *args, **kwargs):
        print('disconnected')
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )

    def receive(self, text_data):
        data = json.loads(text_data)
        print(data)

    def send_notification(self,event):
        data=json.loads(event.get('value'))
        if data['to_user']==self.scope['user'].username and data['is_read']==False:
            notification=Notification.objects.get(id=data['id'])
            serializer=NotificationSerializer(notification,many=False)
            self.send(text_data=json.dumps(serializer.data))