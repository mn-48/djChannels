from rest_framework import serializers
from .models import SocialPhoto, SocialPost, SocialUpdateHistory
from userapp.serializers import UserLiteSerializer
from .otherSerializers import *

class SocialPostSerializer(serializers.ModelSerializer):
    class Meta:
        model=SocialPost
        exclude=('user','likes','love','angry','haha','sad','care','senti','wow')

class SocialPostDetailSerializer(serializers.ModelSerializer):
    tags=UserLiteSerializer(many=True,read_only=True)
    views=UserLiteSerializer(many=True,read_only=True)
    likes=UserLiteSerializer(many=True,read_only=True)
    love=UserLiteSerializer(many=True,read_only=True)
    angry=UserLiteSerializer(many=True,read_only=True)
    haha=UserLiteSerializer(many=True,read_only=True)
    care=UserLiteSerializer(many=True,read_only=True)
    sad=UserLiteSerializer(many=True,read_only=True)
    senti=UserLiteSerializer(many=True,read_only=True)
    wow=UserLiteSerializer(many=True,read_only=True)
    shared_by=UserLiteSerializer(many=True,read_only=True)


    privacy=PrivacyModelSerializer(many=False, read_only=True)
    category=CategorySerializer(many=False, read_only=True)
    activity=ActivitySerializer(many=False, read_only=True)
    subactivity=SubActivitySerializer(many=False, read_only=True)
    check_in=Check_inSerializer(many=False, read_only=True)
    feeling=FeelingSerializer(many=False, read_only=True)
    background=BackgroudSerializer(many=False, read_only=True)
    gif=GIFSerializer(many=False, read_only=True)
    lifeevent=LifeEventSerializer(many=False, read_only=True)
    sublifeevent=SubLifeEventSerializer(many=False, read_only=True)

    class Meta:
        model=SocialPost
        fields='__all__'
        # fields=('id','user','photo','caption','location','tags','privacy','is_active','last_used','created_at')
        # read_only_fields = ('tags',)
class SocialUpdateHistorySerializer(ModelSerializer):
    class Meta:
        model=SocialUpdateHistory
        fields='__all__'

class SocialPhotoSerializer(ModelSerializer):
    class Meta:
        model=SocialPhoto
        exclude=('user',)