from rest_framework import serializers
from .models import Notification
from userapp.serializers import UserLiteSerializer
class NotificationSerializer(serializers.ModelSerializer):
    to_user=UserLiteSerializer(read_only=True,many=False)
    from_user=UserLiteSerializer(read_only=True,many=False)
    class Meta:
        model=Notification
        fields='__all__'
class NotificationCreateSerializer(serializers.ModelSerializer):
    class Meta:
        model=Notification
        exclude=('from_user',)