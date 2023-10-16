from rest_framework import serializers
from .models import *
class FunctionalJobCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model=FunctionalJobCategory
        fields='__all__'
class OrganizationTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model=OrganizationType
        fields='__all__'
class IndustryCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model=IndustryCategory
        fields='__all__'
class SpecialSkillCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model=SpecialSkillCategory
        fields='__all__'

class Project_WorksSerializer(serializers.ModelSerializer):
    class Meta:
        model=Project_Works
        # fields='__all__'
        exclude=['jobprofile',]

class SkillsSerializer(serializers.ModelSerializer):
    class Meta:
        model=Skills
        # fields='__all__'
        exclude=['jobprofile',]

class ExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model=Experience
        # fields='__all__'
        exclude=['jobprofile',]


class JobProfileSerializer(serializers.ModelSerializer):
    
    class Meta:
        model=JobProfile
        # fields='__all__'
        exclude=['user',]
class JobProfileDetailsSerializer(serializers.ModelSerializer):
    job_categories=FunctionalJobCategorySerializer(many=True)
    special_skills=SpecialSkillCategorySerializer(many=True)
    class Meta:
        model=JobProfile
        # fields='__all__'
        exclude=['user',]

class DisabilitySerializer(serializers.ModelSerializer):
    class Meta:
        model=Disability_information
        # fields='__all__'
        exclude=['jobprofile',]


class EducationProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model=EducationProfile
        # fields='__all__'
        exclude=['jobprofile',]

        
class TrainingProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model=Training
        # fields='__all__'
        exclude=['jobprofile',]
class ProfessionalProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model=Professional_certificate
        # fields='__all__'
        exclude=['jobprofile',]
class ReferenceSerializer(serializers.ModelSerializer):
    class Meta:
        model=Reference
        # fields='__all__'
        exclude=['jobprofile',]
class ArmyExperienceSerializer(serializers.ModelSerializer):
    class Meta:
        model=ArmyExperience
        # fields='__all__'
        exclude=['jobprofile',]


from rest_framework.serializers import ModelSerializer
from rest_framework.fields import SerializerMethodField

class MajorInSerializer(ModelSerializer):
    class Meta:
        model=MajorIn
        fields=('id','name',)

class DegreeOrExamSerializer(ModelSerializer):
    major_in=SerializerMethodField()
    class Meta:
        model=DegreeOrExam
        fields=('id','name','major_in')
    def get_major_in(self, obj):
        if obj.majors.all():
            return MajorInSerializer(obj.majors.all(), many=True).data
        else:
            return None
class EducationLevelSerializer(ModelSerializer):
    degrees=SerializerMethodField()
    class Meta:
        model=EducationLevel
        fields=('id','name','degrees')
    def get_degrees(self, obj):
        if obj.degrees.all():
            return DegreeOrExamSerializer(obj.degrees.all(), many=True).data
        else:
            return None
class CitySerializer(ModelSerializer):
    class Meta:
        model=City
        fields=('id','name',)

class StateSerializer(ModelSerializer):
    city=SerializerMethodField()
    class Meta:
        model=State
        fields=('id','name','city')
    def get_city(self, obj):
        if obj.cities.all():
            return CitySerializer(obj.cities.all(), many=True).data
        else:
            return None
class CountrySerializer(ModelSerializer):
    state=SerializerMethodField()
    class Meta:
        model=Country
        fields=('id','name','state')
    def get_state(self, obj):
        if obj.states.all():
            return StateSerializer(obj.states.all(), many=True).data
        else:
            return None
class ContinentSerializer(ModelSerializer):
    country=SerializerMethodField()
    class Meta:
        model=Continent
        fields=('id','name','country')
    def get_country(self, obj):
        if obj.countries.all():
            return CountrySerializer(obj.countries.all(), many=True).data
        else:
            return None

class ContinentLiteSerializer(ModelSerializer):
    class Meta:
        model=Continent
        fields=('id','name',)
class CountryLiteSerializer(ModelSerializer):
    continent=ContinentLiteSerializer(many=False, read_only=True)
    class Meta:
        model=Country
        fields=('id','name','continent')
class StateLiteSerializer(ModelSerializer):
    country=CountryLiteSerializer(many=False, read_only=True)
    class Meta:
        model=State
        fields=('id','name','country')

class CityDetailSerializer(ModelSerializer):
    state=StateLiteSerializer(many=False, read_only=True)
    class Meta:
        model=City
        fields=('id','name','state')

from user_management.models import Consumer
class CountrySimpleSerializer(serializers.ModelSerializer):
    class Meta:
        model=Country
        fields='__all__'
class ConcumerJobProfileInfo(serializers.ModelSerializer):
    city=CitySerializer(many=False, read_only=True)
    country=CountrySimpleSerializer(many=False, read_only=True)
    class Meta:
        model=Consumer
        fields=['phone','gender','city','country']
class UserJobProfileInfo(serializers.ModelSerializer):
    consumer=SerializerMethodField()
    class Meta:
        model=User
        fields=['id','first_name','last_name','email','consumer']

    def get_consumer(self, obj):
        if obj.consumer:
            return ConcumerJobProfileInfo(obj.consumer,many=False).data



class JobProfileAllSerializer(serializers.ModelSerializer):
    job_categories = FunctionalJobCategorySerializer(many=True, read_only=True)
    special_skills = SpecialSkillCategorySerializer(many=True, read_only=True)
    profession=ProfessionalProfileSerializer(many=True, read_only=True)
    training=TrainingProfileSerializer(many=True, read_only=True)
    education=EducationProfileSerializer(many=True, read_only=True)
    disability=DisabilitySerializer(many=False, read_only=True)
    experience=ExperienceSerializer(many=True, read_only=True)
    projectworks=Project_WorksSerializer(many=True, read_only=True)
    skills=SkillsSerializer(many=True, read_only=True)
    user=UserJobProfileInfo(many=False, read_only=True)

    class Meta:
        model=JobProfile
        fields='__all__'
