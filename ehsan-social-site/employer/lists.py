from rest_framework.permissions import  IsAuthenticated
from rest_framework import permissions
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
from .models import *
from jobs.models import *

class EmployerList(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Employer.objects.all()
    serializer_class = EmployerSerializer

class InstituionListAPIView(generics.ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=InstituionList.objects.all()
    serializer_class=InstituionListSerializer
    
class SkillsListAPIView(generics.ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=SkillsList.objects.all()
    serializer_class=SkillsListSerializer
    
class BenefitListAPIView(generics.ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=BenefitList.objects.all()
    serializer_class=BenefitListSerializer

# class LocationListAPIView(generics.ListCreateAPIView):
#     permission_classes=[IsAuthenticated,]
#     queryset=Location.objects.all()
#     serializer_class=LocationSerializer

    
class BusinessListAPIView(generics.ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=BusinessList.objects.all()
    serializer_class=BusinessListSerializer
    
class ExperienceListAPIView(generics.ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=ExperienceList.objects.all()
    serializer_class=ExperienceListSerializer


class SpecialSkillCategoryListAPIView(generics.ListAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=SpecialSkillCategory.objects.all()
    serializer_class=SpecialSkillCategorySerializer

class OrganizationTypeList(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= OrganizationType.objects.all()
    serializer_class = OrganizationTypeSerializer

class IndustryCategoryList(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= IndustryCategory.objects.all()
    serializer_class = IndustryCategorySerializer

class FunctionalJobCategoryListAPIView(generics.ListAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=FunctionalJobCategory.objects.all()
    serializer_class=FunctionalJobCategorySerializer

class AppliedJonListOfUser(generics.ListAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=JobPost.objects.all()
    serializer_class=JobPostDetailsSerializer
    def get_queryset(self):
        queryset=self.request.user.applied_jobs.all()
        return queryset

class ThreeCategoryList(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, format=None):
        industry_cat = IndustryCategory.objects.all()
        functional_cat = FunctionalJobCategory.objects.all()
        industry_type = OrganizationType.objects.all()
        data={}
        data['industry_cat']=IndustryCategorySerializer(industry_cat, many=True).data
        data['functional_cat']=FunctionalJobCategorySerializer(functional_cat, many=True).data
        data['industry_type']=OrganizationTypeSerializer(industry_type, many=True).data
        data['special_skills_category']=SpecialSkillCategorySerializer(SpecialSkillCategory.objects.all(), many=True).data
        # data['job_location']=LocationSerializer(Location.objects.all(), many=True).data
        data['compensation_and_benefits']=BenefitListSerializer(BenefitList.objects.all(), many=True).data
        data['prefered_educational_institutions']=InstituionListSerializer(InstituionList.objects.all(), many=True).data
        data['area_of_experience']=ExperienceListSerializer(ExperienceList.objects.all(), many=True).data
        data['area_of_business']=BusinessListSerializer(BusinessList.objects.all(), many=True).data
        data['skills']=SkillsListSerializer(SkillsList.objects.all(), many=True).data
        data['education_levels']=EducationLevelSerializer(EducationLevel.objects.all(), many=True).data
        data['continents']=ContinentSerializer(Continent.objects.all(), many=True).data

        return Response(data)