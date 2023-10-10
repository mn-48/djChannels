# chat/consumers.py
import json

from channels.generic.websocket import AsyncWebsocketConsumer


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
        self.room_group_name = f"chat_{self.room_name}"

        # Join room group
        await self.channel_layer.group_add(self.room_group_name, self.channel_name)

        await self.accept()

    async def disconnect(self, close_code):
        # Leave room group
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

    # Receive message from WebSocket
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json["message"]

        # Send message to room group
        await self.channel_layer.group_send(
            self.room_group_name, {"type": "chat.message", "message": message}
        )

    # Receive message from room group
    async def chat_message(self, event):
        message = event["message"]

        # Send message to WebSocket
        await self.send(text_data=json.dumps({"message": message}))




'''

# SyncConsumer ============================================================
from channels.consumer import SyncConsumer
class EchoConsumer(SyncConsumer):
    def websocket_connect(self, event):
        self.send({
            "type": "websocket.accept",
        })

    def websocket_send(self, event):
        self.send({
            "type": "websocket.send",
            "text": event["text"],
        })

   

# AsyncConsumer =============================================================
from channels.consumer import AsyncConsumer
class EchoConsumer(AsyncConsumer):

    async def websocket_connect(self, event):
        await self.send({
            "type": "websocket.accept",
        })

    async def websocket_send(self, event):
        await self.send({
            "type": "websocket.send",
            "text": event["text"],
        })

'''  
