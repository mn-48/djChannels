# chat/consumers.py
from datetime import datetime
from channels.generic.http import AsyncHttpConsumer
import json

from channels.generic.websocket import AsyncWebsocketConsumer


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
        self.room_group_name = f"chat_{self.room_name}"

        # Join room group
        await self.channel_layer.group_add(self.room_group_name, self.channel_name)

        # print("User/Consumer: ", self.scope["user"] )

        await self.accept()

        # Clients.objects.create(channel_name=self.channel_name)

    async def disconnect(self, close_code):
        # Leave room group
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)
        # Clients.objects.filter(channel_name=self.channel_name).delete()

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
        print("User/Consumer send: ", self.scope["user"])
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
 

# channel layer 
from channels.consumer import SyncConsumer
class EchoConsumer(SyncConsumer):
    channel_layer_alias = "echo_alias"




# WebsocketConsumer ==========================================================
from channels.generic.websocket import WebsocketConsumer

class MyConsumer(WebsocketConsumer):
    groups = ["broadcast"]

    def connect(self):
        # Called on connection.
        # To accept the connection call:
        self.accept()
        # Or accept the connection and specify a chosen subprotocol.
        # A list of subprotocols specified by the connecting client
        # will be available in self.scope['subprotocols']
        self.accept("subprotocol")
        # To reject the connection, call:
        self.close()

    def receive(self, text_data=None, bytes_data=None):
        # Called with either text_data or bytes_data for each frame
        # You can call:
        self.send(text_data="Hello world!")
        # Or, to send a binary frame:
        self.send(bytes_data="Hello world!")
        # Want to force-close the connection? Call:
        self.close()
        # Or add a custom WebSocket error code!
        self.close(code=4123)

    def disconnect(self, close_code):
        # Called when the socket closes
        pass




# AsyncWebsocketConsumer ==================================================================
from channels.generic.websocket import AsyncWebsocketConsumer

class MyConsumer(AsyncWebsocketConsumer):
    groups = ["broadcast"]

    async def connect(self):
        # Called on connection.
        # To accept the connection call:
        await self.accept()
        # Or accept the connection and specify a chosen subprotocol.
        # A list of subprotocols specified by the connecting client
        # will be available in self.scope['subprotocols']
        await self.accept("subprotocol")
        # To reject the connection, call:
        await self.close()

    async def receive(self, text_data=None, bytes_data=None):
        # Called with either text_data or bytes_data for each frame
        # You can call:
        await self.send(text_data="Hello world!")
        # Or, to send a binary frame:
        await self.send(bytes_data="Hello world!")
        # Want to force-close the connection? Call:
        await self.close()
        # Or add a custom WebSocket error code!
        await self.close(code=4123)

    async def disconnect(self, close_code):
        # Called when the socket closes
        pass


# JsonWebsocketConsumer =========================================================
# AsyncJsonWebsocketConsumer ==================================================
'''


# AsyncHttpConsumer ================================================


class BasicHttpConsumer(AsyncHttpConsumer):
    async def handle(self, body):
        await asyncio.sleep(10)
        await self.send_response(200, b"Your response bytes", headers=[
            (b"Content-Type", b"text/plain"),
        ])


class LongPollConsumer(AsyncHttpConsumer):
    async def handle(self, body):
        await self.send_headers(headers=[
            (b"Content-Type", b"application/json"),
        ])
        # Headers are only sent after the first body event.
        # Set "more_body" to tell the interface server to not
        # finish the response yet:
        await self.send_body(b"", more_body=True)

    async def chat_message(self, event):
        # Send JSON and finish the response:
        await self.send_body(json.dumps(event).encode("utf-8"))


class ServerSentEventsConsumer(AsyncHttpConsumer):
    async def handle(self, body):
        await self.send_headers(headers=[
            (b"Cache-Control", b"no-cache"),
            (b"Content-Type", b"text/event-stream"),
            (b"Transfer-Encoding", b"chunked"),
        ])
        while True:
            payload = "data: %s\n\n" % datetime.now().isoformat()
            await self.send_body(payload.encode("utf-8"), more_body=True)
            await asyncio.sleep(1)


class AdminChatConsumer(AsyncHttpConsumer):
    pass


class PublicChatConsumer(AsyncHttpConsumer):
    pass
