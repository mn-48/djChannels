# from django.urls import re_path
# from . import consumers

# websocket_urlpatterns = [
#     re_path(r"ws/chat/(?p<room_name>\w+)/$", consumers.ChatConsumer.as_asgi()),
# ]


# chat/routing.py
from django.urls import re_path, path

# from . import consumers

from .consumers import (
    ChatConsumer,
    AdminChatConsumer,
    PublicChatConsumer,
)

websocket_urlpatterns = [
    # re_path(r"ws/chat/(?P<room_name>\w+)/$", ChatConsumer.as_asgi()),
    path("ws/chat/<str:room_name>/", ChatConsumer.as_asgi()),
    # path("chat/admin/", AdminChatConsumer.as_asgi()),
    # path("chat/", PublicChatConsumer.as_asgi()),
]