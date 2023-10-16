from chatapp.models import Message
import json
from asgiref.sync import async_to_sync
from channels.exceptions import DenyConnection
from channels.generic.websocket import WebsocketConsumer
from .serializers import MessageSerializer
from django.contrib.auth import get_user_model
User = get_user_model()
from .checkup import *


class UserToUserConsumer(WebsocketConsumer):
    def connect(self):
        print("from consumer",self.scope['user'])
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name

        if not support_room_exist(self.room_name, self.scope['user'].username):
            raise DenyConnection
        room = validate_then_get_room(room_name=self.room_name)
        self.room=room
        if not user_has_room_access(self.scope['user'],room):
            raise DenyConnection
        else:
            async_to_sync(self.channel_layer.group_add)(
                self.room_group_name,
                self.channel_name
            )
        self.accept()

        text_data=get_previous_msg(room)
        self.send(text_data=text_data)

    def receive(self,text_data):
        data=json.loads(text_data)['msg']
        user=self.scope['user']
        msg=Message.objects.create(room=self.room,user=user,msg=data)
        messages = MessageSerializer(msg, many=False)
        data=[]
        data.append(messages.data)
        return self.send_chat_message(data)
        
    def disconnect(self, *args, **kwargs):
        print('disconnected')
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def send_chat_message(self, message):
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    def chat_message(self, event):
        message = event['message']
        self.send(text_data=json.dumps(message))
    


class GroupChatConsumer(WebsocketConsumer):
    def connect(self):
        print("from consumer",self.scope['user'])
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name

        if not support_group_exist(self.room_name, self.scope['user'].username):
            raise DenyConnection
        room = validate_then_get_group(group_name=self.room_name)
        self.room=room
        if not user_has_group_access(self.scope['user'],room):
            raise DenyConnection
        else:
            async_to_sync(self.channel_layer.group_add)(
                self.room_group_name,
                self.channel_name
            )
        self.accept()

        text_data=get_previous_group_msg(room)
        self.send(text_data=text_data)

    def receive(self,text_data):
        data=json.loads(text_data)['msg']
        user=self.scope['user']
        msg=GroupMessage.objects.create(group=self.room,user=user,msg=data)
        messages = GroupMessageSerializer(msg, many=False)
        data=[]
        data.append(messages.data)
        return self.send_chat_message(data)
        
    def disconnect(self, *args, **kwargs):
        print('disconnected')
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )
        
    def send_chat_message(self, message):
        async_to_sync(self.channel_layer.group_send)(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    def chat_message(self, event):
        message = event['message']
        self.send(text_data=json.dumps(message))
    