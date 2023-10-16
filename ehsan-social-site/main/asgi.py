import os

from django.core.asgi import get_asgi_application
from django.urls import path,re_path
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from chatapp.consumers import ChatRoomConsumer
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.security.websocket import AllowedHostsOriginValidator
from django.core.asgi import get_asgi_application

from notifications.consumers import NotificationConsumer
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ChannelsCourse.settings')

from chatapp.consumers import *
from chat.consumers import *

ws_patterns=[
    re_path(r'ws/notification/(?P<room_name>\w+)/$', NotificationConsumer.as_asgi()),
    # re_path(r'ws/chat/(?P<room_name>\w+)/$', ChatRoomConsumer.as_asgi()),
    re_path(r'ws/chat/(?P<room_name>\w+)/$', UserToUserConsumer.as_asgi()),
    re_path(r'ws/groupchat/(?P<room_name>\w+)/$', GroupChatConsumer.as_asgi()),
    # path('ws/notification/', NotificationConsumer.as_asgi()),

]
application=ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AllowedHostsOriginValidator(
        AuthMiddlewareStack(
            URLRouter(ws_patterns)
        ),
    ),
    # "http": get_asgi_application(),
    # 'websocket':URLRouter(ws_patterns)
})