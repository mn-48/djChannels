from django.contrib.auth.models import User
from django.db.models import fields
from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from .models import *
from userapp.serializers import UserLiteSerializer
class DealerProfileLiteSerializer(serializers.ModelSerializer):
    class Meta:
        model=DealerProfile
        exclude=['seller',]
class SellerProfileSerializers(serializers.ModelSerializer):
    dealers= serializers.SerializerMethodField()
    class Meta:
        model=SellerProfile
        exclude=['user',]
    def get_dealers(self, obj):
        if obj.dealers.filter(is_active=True):
            return DealerProfileLiteSerializer(obj.dealers.filter(is_active=True),many=True).data
        else:
            return None
    # def validate_owner_nid_no(self, value):
    #     if self.instance.owner_nid_no and self.instance.owner_nid_no != value:
    #         raise serializers.ValidationError("You can't change your NID No")
    #     return value



class SellerProfileLiteSerializer(serializers.ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    class Meta:
        model=SellerProfile
        fields=['id','user']
class DealerProfileSerializer(serializers.ModelSerializer):
    seller=SellerProfileLiteSerializer(many=False, read_only=True)
    class Meta:
        model=DealerProfile
        fields='__all__'
class BuyersSerializer(serializers.HyperlinkedModelSerializer):
    id = serializers.ReadOnlyField(source='user.id')
    user = serializers.ReadOnlyField(source='user.username')
    class Meta:
        model=Buyers
        fields=['id','user','quantity','created_at']
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model=Category
        fields='__all__'
from userapp.serializers import BasicSerializer
class ProductSerializer(serializers.ModelSerializer):
    seller=SellerProfileLiteSerializer(many=False, read_only=True)
    seller_id= serializers.PrimaryKeyRelatedField(write_only=True, source='seller', queryset=SellerProfile.objects.all())

    dealer=DealerProfileLiteSerializer(many=False, read_only=True)
    dealer_id= serializers.PrimaryKeyRelatedField(write_only=True, source='dealer', queryset=DealerProfile.objects.all())

    category=CategorySerializer(many=False, read_only=True)
    category_id= serializers.PrimaryKeyRelatedField(write_only=True, source='category', queryset=Category.objects.all(),required=True, allow_null=False)

    consumer=BasicSerializer(many=False, read_only=True)
    buyers=BuyersSerializer( source='buyer', many=True, read_only=True)
    like=UserLiteSerializer(many=True, read_only=True)
    class Meta:
        model=Product
        # fields='__all__'
        exclude=['selled_quantity','is_published','is_featured','is_toprated','selled','is_active']

from rest_framework.serializers import ModelSerializer
class ReviewDetailSerializer(ModelSerializer):
    likes= UserLiteSerializer(many=True, read_only=True)
    dislikes= UserLiteSerializer(many=True, read_only=True)

    child=serializers.SerializerMethodField(read_only=True)

    user=UserLiteSerializer(many=False, read_only=True)
    user_id= serializers.PrimaryKeyRelatedField(write_only=True, source='user', queryset=User.objects.all())

    class Meta:
        model=Review
        fields='__all__'
        # exclude=('user',)

    def get_child(self, obj):
        if obj.reviewreplies.filter(is_active=True):
            return ReviewDetailSerializer(obj.reviewreplies.filter(is_active=True),many=True).data
        else:
            return None

class FAQSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    user_id= serializers.PrimaryKeyRelatedField(write_only=True, source='user', queryset=User.objects.all())
    class Meta:
        model=FAQ
        exclude=['is_active',]
class QuestionSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    user_id= serializers.PrimaryKeyRelatedField(write_only=True, source='user', queryset=User.objects.all())
    class Meta:
        model=Question
        exclude=['is_active',]
class AnswerSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    user_id= serializers.PrimaryKeyRelatedField(write_only=True, source='user', queryset=User.objects.all())
    class Meta:
        model=Answer
        exclude=['is_active',]
class AnswerLiteSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    class Meta:
        model=Answer
        fields=['user','answer']
class QuestionDetailsSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    answers=SerializerMethodField()
    class Meta:
        model=Question
        exclude=['is_active',]
    def get_answers(self, obj):
        if obj.answar.exists():
            return AnswerLiteSerializer(obj.answar.all(), many=True).data
        

class ProductCommentDetailSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    user_id= serializers.PrimaryKeyRelatedField(write_only=True, source='user', queryset=User.objects.all())
    child=serializers.SerializerMethodField()
    class Meta:
        model=ProductComment
        # fields='__all__'
        exclude=('is_active',)

    def get_child(self, obj):
        if obj.parent and obj.id == obj.parent.id:
            return None
        if obj.selfreplies.filter(is_active=True):
            return ProductCommentDetailSerializer(obj.selfreplies.filter(is_active=True),many=True).data
        else:
            return None