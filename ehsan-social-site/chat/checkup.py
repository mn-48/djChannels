from .models import PrivateChtRoom
from django.contrib.auth.models import User
from .serializers import *
from .models import *
import json

def validate_then_get_room(room_name):
    try:
        room = PrivateChtRoom.objects.get(room_name=room_name)
        
    except PrivateChtRoom.DoesNotExist:
        return None
    except User.DoesNotExist:
        return None
    return room


def support_room_exist(room_username, user_username):
    try:
        room = PrivateChtRoom.objects.get(room_name=room_username)
        user = User.objects.get(username=user_username)
    except PrivateChtRoom.DoesNotExist:
        return False
    except User.DoesNotExist:
        return False
    if room:
        return True


def user_has_room_access(user,room):
    if user is room.user1 or user is room.user2:
        return False
    else:
        return True

def get_previous_msg(room):
    queryset=room.messages.all().order_by('-created_at')[:40]
    queryset2=sorted(queryset, key=lambda x: x.created_at)
    messages = MessageSerializer(queryset2, many=True)
    return json.dumps(messages.data)



def support_group_exist(group_name, user_username):
    try:
        room = GroupName.objects.get(group_name=group_name)
        user = User.objects.get(username=user_username)
    except GroupName.DoesNotExist:
        return False
    except User.DoesNotExist:
        return False
    if room:
        return True

def validate_then_get_group(group_name):
    try:
        room = GroupName.objects.get(group_name=group_name)
    except GroupName.DoesNotExist:
        return None
    return room

def user_has_group_access(user,room):
    if user in room.participants.all() or user in room.admins.all():
        return True
    else:
        return False

def get_previous_group_msg(group):
    queryset=group.g_messages.all().order_by('-created_at')[:40]
    queryset2=sorted(queryset, key=lambda x: x.created_at)
    messages = GroupMessageSerializer(queryset2, many=True)
    return json.dumps(messages.data)