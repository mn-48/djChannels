from rest_framework.serializers import ModelSerializer
from rest_framework.serializers import ModelSerializer
from rest_framework import serializers
from .models import Reports
from metrimony.models import Personal_Info
from employer.models import Employer, JobPost
from user_management.models import Consumer
from userapp.serializers import UserLiteSerializer

class Personal_infoLiteSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    class Meta:
        model=Personal_Info
        fields=['id','user',]

class ConsumerLiteSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    class Meta:
        model=Consumer
        fields=['id','user',]

class EmployerLiteSerializer(ModelSerializer):
    user=UserLiteSerializer(many=False, read_only=True)
    class Meta:
        model=Employer
        fields=['id','user',]

class JobPostLiteSerializer(ModelSerializer):
    employer=EmployerLiteSerializer(many=False, read_only=True)
    class Meta:
        model=JobPost
        fields=['id','job_title','employer',]

class ReportsSerializer(ModelSerializer):
    matri_pro_to=Personal_infoLiteSerializer(many=False, read_only=True)
    matri_pro_to_id= serializers.PrimaryKeyRelatedField(write_only=True,
                                                 source='matri_pro_to',
                                                 queryset=Personal_Info.objects.all(),required=False, allow_null=True)
    # matri_pro_to_id= serializers.IntegerField(write_only=True)

    consumer_to=ConsumerLiteSerializer(many=False, read_only=True)
    consumer_to_id= serializers.PrimaryKeyRelatedField(write_only=True,
                                                 source='consumer_to',
                                                 queryset=Consumer.objects.all(),required=False, allow_null=True)
    
    employer_to=EmployerLiteSerializer(many=False, read_only=True)
    employer_to_id= serializers.PrimaryKeyRelatedField(write_only=True,
                                                 source='employer_to',
                                                 queryset=Employer.objects.all(),required=False, allow_null=True)
    
    
    jobpost_to=JobPostLiteSerializer(many=False, read_only=True)
    jobpost_to_id= serializers.PrimaryKeyRelatedField(write_only=True,
                                                 source='jobpost_to',
                                                 queryset=JobPost.objects.all(),required=False, allow_null=True)
    
    
    class Meta:
        model=Reports
        exclude=['user',]
