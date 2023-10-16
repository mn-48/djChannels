from rest_framework import serializers
from rest_framework.serializers import ModelSerializer

from .models import PostComment,PostPhotoComment
from userapp.serializers import UserLiteSerializer



class PostCommentSerializer(ModelSerializer):
    class Meta:
        model=PostComment
        exclude=('user','is_active','likes','love','angry','haha','sad','care','senti','wow')

class PostCommentDetailSerializer(ModelSerializer):
    likes=UserLiteSerializer(many=True,read_only=True)
    love=UserLiteSerializer(many=True,read_only=True)
    angry=UserLiteSerializer(many=True,read_only=True)
    haha=UserLiteSerializer(many=True,read_only=True)
    care=UserLiteSerializer(many=True,read_only=True)
    sad=UserLiteSerializer(many=True,read_only=True)
    senti=UserLiteSerializer(many=True,read_only=True)
    wow=UserLiteSerializer(many=True,read_only=True)
    # parent='Self'
    child_count=serializers.SerializerMethodField()
    child=serializers.SerializerMethodField()
    class Meta:
        model=PostComment
        # fields='__all__'
        exclude=('parent',)
    def get_child(self, obj):
        if obj.selfreplies.filter(is_active=True):
            return PostCommentDetailSerializer(obj.selfreplies.filter(is_active=True),many=True).data
        else:
            return None
    def get_child_count(self,obj):
        if obj.selfreplies.filter(is_active=True):
            return obj.selfreplies.filter(is_active=True).count()
        else:
            return 0
class PostPhotoCommentSerializer(ModelSerializer):
    class Meta:
        model=PostPhotoComment
        exclude=('user','is_active','likes','love','angry','haha','sad','care','senti','wow')

class PostPhotoCommentDetailSerializer(ModelSerializer):
    likes=UserLiteSerializer(many=True,read_only=True)
    love=UserLiteSerializer(many=True,read_only=True)
    angry=UserLiteSerializer(many=True,read_only=True)
    haha=UserLiteSerializer(many=True,read_only=True)
    care=UserLiteSerializer(many=True,read_only=True)
    sad=UserLiteSerializer(many=True,read_only=True)
    senti=UserLiteSerializer(many=True,read_only=True)
    wow=UserLiteSerializer(many=True,read_only=True)
    # parent='Self'
    child_count=serializers.SerializerMethodField(read_only=True)
    child=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=PostPhotoComment
        # fields='__all__'
        exclude=('parent',)
    def get_child(self, obj):
        if obj.selfreplies.filter(is_active=True):
            return PostPhotoCommentDetailSerializer(obj.selfreplies.filter(is_active=True),many=True).data
        else:
            return None
    def get_child_count(self,obj):
        if obj.selfreplies.filter(is_active=True):
            return obj.selfreplies.filter(is_active=True).count()
        else:
            return 0

from .models import PostCommentHistory, PostPhotoCommentHistory

class PostCommentHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model=PostCommentHistory
        fields='__all__'
class PostPhotoCommentHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model=PostPhotoCommentHistory
        fields='__all__'