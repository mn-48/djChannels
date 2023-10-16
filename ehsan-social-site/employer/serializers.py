from jobs.serializers import JobProfileAllSerializer, JobProfileDetailsSerializer
from rest_framework import serializers

from .models import *
from jobs.models import *
from jobs.serializers import *
from userapp.serializers import UserLiteSerializer

class EmployerSerializer(serializers.ModelSerializer):
    class Meta:
        model=Employer 
        # fields='__all__'
        exclude=['user','moderators']
class EmployerDetailsSerializer(serializers.ModelSerializer):
    industry_cat=IndustryCategorySerializer(read_only=True,many=False)
    functional_cat=FunctionalJobCategorySerializer(read_only=True,many=False)
    industry_type=OrganizationTypeSerializer(read_only=True,many=False)
    moderators=UserLiteSerializer(read_only=True,many=True)
    pending_moderators=UserLiteSerializer(read_only=True,many=True)

    class Meta:
        model=Employer 
        # fields='__all__'
        exclude=['user',]
class EmployerWithTypeSerializer(serializers.ModelSerializer):
    industry_cat=IndustryCategorySerializer(read_only=True,many=False)
    functional_cat=FunctionalJobCategorySerializer(read_only=True,many=False)
    industry_type=OrganizationTypeSerializer(read_only=True,many=False)
    moderators=UserLiteSerializer(read_only=True,many=True)
    pending_moderators=UserLiteSerializer(read_only=True,many=True)
    user=UserLiteSerializer(read_only=True,many=False)
    type=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=Employer 
        fields='__all__'
        # exclude=['user',]
    def get_type(self, obj):
        user = self.context['request'].user
        if user==obj.user:
            return "Creator"
        elif user in obj.moderators.all():
            return "Moderator"
        elif user in obj.pending_moderators.all():
            return "Pending Moderator"
class JobPostSerializer(serializers.ModelSerializer):
    class Meta:
        model=JobPost
        fields='__all__'
        # exclude=['employer',]
class EmployerLiteSerializer(serializers.ModelSerializer):
    class Meta:
        model=Employer
        fields=('id','username')
class JobPostDetailsSerializer(serializers.ModelSerializer):
    employer=EmployerLiteSerializer(many=False, read_only=True)
    job_location=CityDetailSerializer(many=False, read_only=False)
    functional_category=FunctionalJobCategorySerializer(many=False, read_only=False)
    special_skills_category=SpecialSkillCategorySerializer(many=False, read_only=False)
    industry_category=IndustryCategorySerializer(many=False, read_only=False)
    applied=UserLiteSerializer(many=True, read_only=True)
    class Meta:
        model=JobPost
        fields='__all__'
        # exclude=['employer',]
class JobPostEverythingSerializer(serializers.ModelSerializer):
    employer=EmployerWithTypeSerializer(many=False, read_only=True)
    job_location=CityDetailSerializer(many=False, read_only=False)
    functional_category=FunctionalJobCategorySerializer(many=False, read_only=False)
    special_skills_category=SpecialSkillCategorySerializer(many=False, read_only=False)
    industry_category=IndustryCategorySerializer(many=False, read_only=False)
    applied=UserLiteSerializer(many=True, read_only=True)
    class Meta:
        model=JobPost
        fields='__all__'
        # exclude=['employer',]

class JobPostDetailSerializer(serializers.ModelSerializer):
    applied=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=JobPost
        fields='__all__'
    def get_applied(self, obj):
        user = self.context['request'].user
        if user in obj.applied.all():
            return True
        else:
            return False
class JobPostSearchSerializer(serializers.ModelSerializer):
    employer=EmployerSerializer(many=False, read_only=True)
    class Meta:
        model=JobPost
        fields='__all__'
class ApplicantsSerializer(serializers.ModelSerializer):
    
    class Meta:
        model=Applicants
        # fields='__all__'
        exclude=['jobprofile','working_experience']
class ApplicantsDetailSerializer(serializers.ModelSerializer):
    jobprofile=JobProfileAllSerializer(many=False, read_only=True)
    # total=serializers.SerializerMethodField(read_only=True)
    class Meta:
        model=Applicants
        fields='__all__'

    # def get_total(self,obj):
    #     return Applicants.objects.all().count()














class ExperienceListSerializer(serializers.ModelSerializer):
    class Meta:
        model=ExperienceList
        fields='__all__'
class BusinessListSerializer(serializers.ModelSerializer):
    class Meta:
        model=BusinessList
        fields='__all__'
class BenefitListSerializer(serializers.ModelSerializer):
    class Meta:
        model=BenefitList
        fields='__all__'
class SkillsListSerializer(serializers.ModelSerializer):
    class Meta:
        model=SkillsList
        fields='__all__'
class InstituionListSerializer(serializers.ModelSerializer):
    class Meta:
        model=InstituionList
        fields='__all__'

class SpecialSkillCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model=SpecialSkillCategory
        fields='__all__'

# class LocationSerializer(serializers.ModelSerializer):
#     class Meta:
#         model=Location
#         fields='__all__'