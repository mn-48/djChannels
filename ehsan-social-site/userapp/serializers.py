
from django.db import models
from django.db.models import fields, query
from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.serializers import raise_errors_on_nested_writes

from user_management.models import Consumer, Country, City

class UserLiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id','username','first_name','last_name')


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        exclude = ('password',)


class CountrySerializers(serializers.ModelSerializer):
    class Meta:
        model=Country
        fields='__all__'

class CitySerializers(serializers.ModelSerializer):
    country=CountrySerializers(many=False, read_only=True)
    class Meta:
        model=City
        fields='__all__'

class ConsumerSerializers(serializers.ModelSerializer):
    country=CountrySerializers(many=False, read_only=True)
    city=CitySerializers(many=False, read_only=True)
    class Meta:
        model=Consumer
        # fields='__all__'
        exclude=('created_at','updated_at')

class UserDetailSerializer(serializers.ModelSerializer):
    consumer = ConsumerSerializers(many=False, read_only=True)
    class Meta:
        model = User
        fields = '__all__'
class ContactSerializer(serializers.ModelSerializer):
    country=CountrySerializers(many=False, read_only=True)
    city=CitySerializers(many=False, read_only=True)
    class Meta:
        model= Consumer
        fields=('phone','address1','address2','country','city',)
class BasicSerializer(serializers.ModelSerializer):
    user=UserSerializer(many=False, read_only=True)
    class Meta:
        model=Consumer
        fields=('user','username','first_name','last_name','gender','religion','date_of_birth','blood_group','bio','marital_status','nid_number','languages','occupation','photo','designation_and_service_organization')
class BodySerializer(serializers.ModelSerializer):
    class Meta:
        model=Consumer
        fields=('height','weight','hobby','about_tour')
class EducationSerializer(serializers.ModelSerializer):
    class Meta:
        model=Consumer
        fields=('about_family_members','father_name','father_occupation','mother_name','mother_occupation','spouse_name','father_name_change','mother_name_change')
class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model=Consumer
        fields=('rank','add_seller','refered_by','left_refer','right_refer','is_late','is_master')


from .models import CoverPhoto, ProfilePhoto
class ProfilePhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model=ProfilePhoto
        exclude=('user','is_active')
    def create(self, validated_data):
        tags = validated_data.pop('tags', [])
        user = validated_data.get('user', None)
        dps=ProfilePhoto.objects.filter(user=user)
        for c in dps:
            print(c.id)
            c.is_active=False
            c.save()
        photo = ProfilePhoto.objects.create(**validated_data)
        photo.tags.set(tags)
        return photo
class ProfilePhotoDetailSerializer(serializers.ModelSerializer):
    tags=UserLiteSerializer(many=True,read_only=True,)
    class Meta:
        model=ProfilePhoto
        fields=('id','user','photo','caption','location','tags','privacy','is_active','last_used','created_at')
        read_only_fields = ('tags',)

class CoverPhotoSerializer(serializers.ModelSerializer):
    class Meta:
        model=CoverPhoto
        exclude=('user','is_active')
    def create(self, validated_data):
        tags = validated_data.pop('tags', [])
        user = validated_data.get('user', None)
        dps=CoverPhoto.objects.filter(user=user)
        for c in dps:
            print(c.id)
            c.is_active=False
            c.save()
        photo = CoverPhoto.objects.create(**validated_data)
        photo.tags.set(tags)
        return photo
class CoverPhotoDetailSerializer(serializers.ModelSerializer):
    tags=UserLiteSerializer(many=True,read_only=True,)
    class Meta:
        model=CoverPhoto
        fields=('id','user','photo','caption','location','tags','privacy','is_active','last_used','created_at')
        read_only_fields = ('tags',)