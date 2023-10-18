"""
ASGI config for core project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""

import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack

# Replace 'your_project_name' with the actual name of your Django project.
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'your_project_name.settings')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'core.settings')

# Get the Django ASGI application.
django_asgi = get_asgi_application()

# Define the routing for WebSocket consumers.
application = ProtocolTypeRouter({
    "http": django_asgi,
    # WebSocket consumers go here
    "websocket": AuthMiddlewareStack(
        URLRouter(
            # Add your WebSocket consumers here
        ),
    ),
})