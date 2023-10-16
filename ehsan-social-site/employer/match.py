from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from . serializers import *
from .models import *
from jobs.models import *
import re

def match(profile, jobpost):
    count=4
    if profile.job_location==jobpost.job_location:
        count+=1
    if profile.looking_job_level==jobpost.job_level:
        count+=1
    if profile.looking_job_level==jobpost.job_level:
        count+=1
    if profile.age >= jobpost.min_age and profile.age <= jobpost.max_age:
        count+=1
    if profile.expected_salary >= jobpost.min_salary and profile.expected_salary <= jobpost.max_salary:
        count+=1
    if jobpost.employment_status in profile.available_for_job_type:
        count+=1
    if profile.user.consumer.gender in jobpost.gender:
        count+=1
    try:
        pro=profile.disability
    except:
        pro=None
    if jobpost.person_with_disability_can_apply:
        count+=1
    elif not jobpost.person_with_disability_can_apply and  pro is not None:
        count+=1

    for edu in profile.education.all():
        if edu.institude_name in jobpost.prefered_educational_institutions:
            count+=1
        if jobpost.degree_level==edu.level_of_edu:
            count+=1
        if jobpost.degree_name==edu.degree_or_exam:
            count+=1
    for trn in profile.training.all():
        if trn.title in jobpost.training_or_trade_cources:
            count+=1
            break
    for trn in profile.pro_certificate.all():
        if trn.certification in jobpost.professional_certifications:
            count+=1
            break
    for trn in profile.skills.all():
        if trn.skill_name in jobpost.skills:
            count+=1
            break
    try:
        keywords = re.split(',|;|, |,,|,',profile.keywords)
    except:
        keywords=[]
    for k in keywords:
        if k in jobpost.job_context or k in jobpost.job_responsibilities or k in jobpost.special_instruction or k in jobpost.additional_requirements or k in jobpost.area_of_business:
            count+=1

    return count


    
class BestMatchedJobs(APIView):
    permission_classes=[permissions.IsAuthenticated,]
    def get(self, request, format=None):
        profile=request.user.jobprofile
        
        queryset=JobPost.objects.filter(is_freezed=False, is_active=True)
        queryset=queryset.filter(functional_category__in=profile.job_categories.all())
        queryset=queryset.filter(special_skills_category__in=profile.special_skills.all())

        data={}
        data['status']='success'
        data['items']=[]
        for qu in queryset:
            ma=match(profile, qu)
            serializer=JobPostSearchSerializer(qu, many=False)
            item={}
            item['matches']=str((ma/20)*100)+"%"
            item['object']=serializer.data
            data['items'].append(item)
        data['items']=sorted(data['items'], key=lambda x: x['matches'])
        return Response(data)