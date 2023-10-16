from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from .models import *
from userapp.serializers import UserLiteSerializer
from datetime import datetime, timedelta




class FollowersSerializer(serializers.HyperlinkedModelSerializer):
    id = serializers.ReadOnlyField(source='user.id')
    user = serializers.ReadOnlyField(source='user.username')
    first_name = serializers.ReadOnlyField(source='user.first_name')
    class Meta:
        model=Followers
        fields=['id','user','first_name','created_at']
class FollowingsSerializer(serializers.HyperlinkedModelSerializer):
    id = serializers.ReadOnlyField(source='user.id')
    user = serializers.ReadOnlyField(source='user.username')
    class Meta:
        model=Followings
        fields=['id','user','created_at']
class ToBeFollowersSerializer(serializers.HyperlinkedModelSerializer):
    id = serializers.ReadOnlyField(source='user.id')
    user = serializers.ReadOnlyField(source='user.username')
    class Meta:
        model=ToBeFollowers
        fields=['id','user','created_at']
class ToBeFollowingsSerializer(serializers.HyperlinkedModelSerializer):
    id = serializers.ReadOnlyField(source='user.id')
    user = serializers.ReadOnlyField(source='user.username')
    class Meta:
        model=ToBeFollowings
        fields=['id','user','created_at']


class FriendsSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    followers=FollowersSerializer( source='followers_list', many=True)
    followings=FollowingsSerializer( source='followings_list', many=True)
    to_be_followers=ToBeFollowersSerializer(source='tobefollowers_set', many=True)
    to_be_followings=ToBeFollowingsSerializer(source='tobefollowings_set', many=True)
    followers_count=serializers.SerializerMethodField(read_only=True)
    followings_count=serializers.SerializerMethodField(read_only=True)
    to_be_followers_count=serializers.SerializerMethodField(read_only=True)
    to_be_followings_count=serializers.SerializerMethodField(read_only=True)
    new_followers=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=Friends
        fields='__all__'
    
    def get_followers_count(self, obj):
        return obj.followers.count()
    def get_new_followers(self, obj):
        return  obj.followers_list.filter(created_at__gte=datetime.now()-timedelta(days=7)).count()
    def get_followings_count(self, obj):
        return obj.followings.count()
    def get_to_be_followers_count(self, obj):
        return obj.to_be_followers.count()
    def get_to_be_followings_count(self, obj):
        return obj.to_be_followings.count()
