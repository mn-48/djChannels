
  
from rest_framework import serializers
from django.contrib.auth import get_user_model
from .models import  Message,GroupMessage

User = get_user_model()

class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username',]

class MessageSerializer(serializers.ModelSerializer):
    user = UserModelSerializer()
    class Meta:
        model = Message
        fields = '__all__'
class GroupMessageSerializer(serializers.ModelSerializer):
    user = UserModelSerializer()
    class Meta:
        model = GroupMessage
        fields = '__all__'