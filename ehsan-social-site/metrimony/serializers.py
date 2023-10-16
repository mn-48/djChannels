from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from .models import Personal_Info,Expectaion,VisaVerification
from user_management.models import Consumer
from django.contrib.auth.models import User


class VisaVerificationSerializer(serializers.ModelSerializer):
    class Meta:
        model=VisaVerification
        exclude=['matrimony',]

class PersonalInfoSerializers(serializers.ModelSerializer):
    class Meta:
        model=Personal_Info
        exclude=['user',]
    def validate_passport_no(self, value):
        if self.instance.passport_no and self.instance.passport_no != value:
            raise serializers.ValidationError("You can't change your passport_no")
        return value
class ExpectationSerializers(serializers.ModelSerializer):
    class Meta:
        model=Expectaion
        exclude=['user',]

class UserSubLiteSerializer(serializers.ModelSerializer):
    class Meta:
        model=User
        fields=['id','first_name','last_name']
class ConsumerLiteSerializer(serializers.ModelSerializer):
    user=UserSubLiteSerializer(many=False, read_only=True)
    profile_completed=SerializerMethodField()
    class Meta:
        model=Consumer
        fields=['user','profile_completed','gender','religion','date_of_birth','blood_group','bio','marital_status','nid_number','occupation','designation_and_service_organization','height','weight','hobby','about_family_members','father_name','father_occupation','mother_name','mother_occupation','spouse_name']
    def validate_father_name(self, value):
        if self.instance and self.instance.father_name and self.instance.father_name != value:
            raise serializers.ValidationError("You can't change your father name")
        return value
    def validate_mother_name(self, value):
        if  self.instance and  self.instance.mother_name and self.instance.mother_name != value:
            raise serializers.ValidationError("You can't change your mother name")
        return value
    def validate_nid_number(self, value):
        if self.instance and  self.instance.nid_number and self.instance.nid_number != value:
            raise serializers.ValidationError("You can't change your nid_number")
        return value
    def validate_date_of_birth(self, value):
        if  self.instance and  self.instance.date_of_birth and self.instance.date_of_birth != value:
            raise serializers.ValidationError("You can't change your date_of_birth")
        return value
    def get_profile_completed(self, obj):
        return str(round(obj.get_count(), 2))+"%"

class PersonalInfoLiteSerializer(serializers.ModelSerializer):
    consumer=SerializerMethodField()
    class Meta:
        model=Personal_Info
        exclude=('viewed','viewed_by','shortlisted','interested','privary_limit','interested_by','pending_interested_by',)
        
    def get_consumer(self, obj):
        serializer= ConsumerLiteSerializer(obj.user.consumer, many=False)
        return serializer.data
