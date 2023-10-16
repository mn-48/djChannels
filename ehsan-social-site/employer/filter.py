from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from django.db.models import Q
import re
from datetime import datetime, timedelta
from .serializers import *
from .models import *
from jobs.models import *


class FilterApplicats(APIView):
    permission_classes=(permissions.IsAuthenticated,)
    def post(self, request,id, format=None):
        data=self.request.data
        job=JobPost.objects.get(id=id)
        queryset=job.applicants_list.all()
        try:
            keywords=data['keywords']
            if keywords != "":
                keywords = re.split(',|;|, |,,|,', keywords)
                q=(Q())
                for str in keywords:
                    jobcat=FunctionalJobCategory.objects.filter(name__icontains=str)
                    specat=SpecialSkillCategory.objects.filter(name__icontains=str)
                    q1= (Q(jobprofile__special_qualifications__icontains=str)) | (Q(jobprofile__career_summary__icontains=str)) | (Q(jobprofile__career_objective__icontains=str)) | (Q(jobprofile__job_categories__in=jobcat)) | (Q(jobprofile__special_skills__in=specat)) 
                    q= q | q1
                queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        try:
            name=data['name']
            if name != "":
                name = re.split(',|;| |,,|, ', name)
                q=(Q())
                for str in name:
                    q1= (Q(jobprofile__user__first_name__icontains=str)) | (Q(jobprofile__user__last_name__icontains=str)) 
                    q= q | q1
                queryset=queryset.filter(q)
        except Exception as e:
            print(e)

        try:
            gender=data['gender']
            if gender != "":
                gender = re.split(',|;| |,,|, ', gender)
                q=(Q())
                for str in gender:
                    q1= (Q(jobprofile__user__consumer__gender__iexact=str)) 
                    q= q | q1
                queryset=queryset.filter(q)
        except Exception as e:
            print(e)

        # looking_job_level
        try:
            job_level=data['job_level']
            if job_level != "":
                job_level = re.split(',|;|,,|, ', job_level)
                q=(Q())
                for str in job_level:
                    q1= (Q(jobprofile__looking_job_level__icontains=str)) 
                    q= q | q1
                queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        
        try:
            institutions=data.getlist('institutions',[])
            major_in=data.get('major_in',None)
            degree_name=data.get('degree_name',None)
            degree_level=data.get('degree_level',None)
            result=data.get('result',None)
            gpa_min=data.get('gpa_min',None)
            gpa_max=data.get('gpa_max',None)
            institutions=InstituionList.objects.filter(id__in=institutions)
            q=(Q())
            if len(institutions) > 0:
                print("call")
                for ins in institutions:
                    q1 = (Q(jobprofile__education__institude_name__icontains=ins.name))
                    if major_in:
                        q1 &=  (Q(jobprofile__education__major_in__icontains=major_in))
                    if degree_name:
                        q1 &=  (Q(jobprofile__education__degree_or_exam__icontains=degree_name))
                    if degree_level:
                        q1 &=  (Q(jobprofile__education__level_of_edu__icontains=degree_level))
                    if result:
                        q1 &=  (Q(jobprofile__education__result__icontains=result))
                    if gpa_min and gpa_max:
                        q1 &=  (Q(jobprofile__education__cgpa__gte=gpa_min,jobprofile__education__cgpa__lte=gpa_max))
                    q = q | q1
            else:
                q1 = (Q())
                if major_in:
                    q1 &=  (Q(jobprofile__education__major_in__icontains=major_in))
                if degree_name:
                    q1 &=  (Q(jobprofile__education__degree_or_exam__icontains=degree_name))
                if degree_level:
                    q1 &=  (Q(jobprofile__education__level_of_edu__icontains=degree_level))
                if result:
                    q1 &=  (Q(jobprofile__education__result__icontains=result))
                if gpa_min and gpa_max:
                    q1 &=  (Q(jobprofile__education__cgpa__gte=gpa_min,jobprofile__education__cgpa__lte=gpa_max))
                q = q | q1
            queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        
        
        try:
            experience_min=data['experience_min']
            queryset=queryset.filter(working_experience__gte=(experience_min*365))
        except Exception as e:
            print(e)
        try:
            experience_max=data['experience_max']
            queryset=queryset.filter(working_experience__lte=(experience_max*365))
        except Exception as e:
            print(e)

        try:
            salary_min=data.get('salary_min',None)
            salary_max=data.get('salary_max',None)
            q1 = (Q())
            if salary_min:
                q1 &=  (Q(expected_salary__gte=salary_min))
            if salary_max:
                q1 &=  (Q(expected_salary__lte=salary_max))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            age_min=data.get('age_min',None)
            age_max=data.get('age_max',None)
            q1 = (Q())
            if age_min:
                q1 &=  (Q(jobprofile__age__gte=age_min))
            if age_max:
                q1 &=  (Q(jobprofile__age__lte=age_max))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            location=data.get('location',None)
            location_present=data.get('location_present',None)
            location_permanent=data.get('location_permanent',None)
            if location:
                q1 = (Q(jobprofile__user__consumer__address1__icontains=location))
                if location_present.lower()=="true":
                    q1 |=  (Q(jobprofile__user__consumer__address1__icontains=location))
                if location_permanent.lower()=="true":
                    q1 |=  (Q(jobprofile__user__consumer__address2__icontains=location))
                queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            person_with_disability=data['person_with_disability']
            if person_with_disability.lower()=="false":
                queryset=queryset.filter(jobprofile__disability__isnull=True)
        except Exception as e:
            print(e)

        serializer=ApplicantsDetailSerializer(queryset,many=True)
        return Response(serializer.data)


class FilterJobpost(APIView):
    permission_classes=(permissions.IsAuthenticated,)
    def post(self, request, format=None):
        data=self.request.data
        queryset=JobPost.objects.all()
        try:
            keywords=data['keywords']
            keywords=keywords.strip().strip(",").strip(", ")
            keywords = re.split(',|;|, |,,|,', keywords)
            print(keywords)
            q=(Q())
            for str in keywords:
                str= str.strip()
                print(str)
                jobcat=FunctionalJobCategory.objects.filter(name__icontains=str)
                specat=SpecialSkillCategory.objects.filter(name__icontains=str)
                indus=IndustryCategory.objects.filter(name__icontains=str)
                q1= (Q(job_title__icontains=str)) | (Q(employment_status__icontains=str)) | (Q(special_instruction__icontains=str)) | (Q(job_location__name__icontains=str)) | (Q(job_level__icontains=str)) | (Q(job_context__icontains=str)) | (Q(job_responsibilities__icontains=str)) | (Q(workplace__icontains=str)) | (Q(additional_salary_info__icontains=str)) | (Q(compensation_and_benefits__icontains=str)) | (Q(lunch_facilities__icontains=str)) | (Q(other__icontains=str)) | (Q(degree_level__icontains=str)) | (Q(degree_name__icontains=str)) | (Q(major_in__icontains=str)) | (Q(prefered_educational_institutions__icontains=str)) | (Q(other_educational_qualifications__icontains=str)) | (Q(training_or_trade_cources__icontains=str)) | (Q(professional_certifications__icontains=str)) | (Q(area_of_experience__icontains=str)) | (Q(area_of_business__icontains=str)) | (Q(skills__icontains=str)) | (Q(additional_requirements__icontains=str)) | (Q(functional_category__in=jobcat)) | (Q(special_skills_category__in=specat)) | (Q(industry_category__in=indus)) 
                q= q | q1
            queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        
        try:
            gender=data['gender']
            gender = re.split(',|;| |,,|, ', gender)
            q=(Q())
            for str in gender:
                q1= (Q(gender__iexact=str)) 
                q= q | q1
            queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        
        # looking_job_level
        try:
            job_level=data['job_level']
            job_level = re.split(',|;|,,|, ', job_level)
            q=(Q())
            for str in job_level:
                q1= (Q(job_level__icontains=str)) 
                q= q | q1
            queryset=queryset.filter(q)
        except Exception as e:
            print(e)

        try:
            job_nature=data['job_nature']
            job_nature = re.split(',|;|,,|, ', job_nature)
            q=(Q())
            for str in job_nature:
                q1= (Q(employment_status__icontains=str)) 
                q= q | q1
            queryset=queryset.filter(q)
        except Exception as e:
            print(e)
        
        try:
            min_experience=data.get('min_experience',None)
            max_experience=data.get('max_experience',None)
            q1 = (Q())
            if min_experience and max_experience:
                q1 |=  (Q(max_experience__gte=min_experience, min_experience__lte=min_experience)) | (Q( min_experience__lte=max_experience, max_experience__gte=max_experience)) | (Q(max_experience__lte=max_experience, min_experience__gte=min_experience))
            elif min_experience:
                q1 |=  (Q(min_experience__lte=min_experience))
            elif max_experience:
                q1 |=  (Q(max_experience__gte=max_experience))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            location=data.get('location',None)
            if location:
                location=City.objects.get(id = int(location))
                q1 = (Q(job_location=location))
                queryset=queryset.filter(q1)
        except Exception as e:
            print(e)
        
        try:
            industry_type=data.get('industry_type',None)
            if industry_type:
                industry_type=OrganizationType.objects.get(id=industry_type)
                queryset=queryset.filter(employer__industry_type=industry_type)
        except Exception as e:
            print(e)

        try:
            functional_category=data.get('functional_category',None)
            if functional_category:
                functional_category=FunctionalJobCategory.objects.get(id=functional_category)
                queryset=queryset.filter(functional_category=functional_category)
        except Exception as e:
            print(e)

        try:
            industry_category=data.get('industry_category',None)
            if industry_category:
                industry_category=IndustryCategory.objects.get(id=industry_category)
                queryset=queryset.filter(industry_category=industry_category)
        except Exception as e:
            print(e)

        try:
            special_skills_category=data.get('special_skills_category',None)
            if special_skills_category:
                special_skills_category=SpecialSkillCategory.objects.get(id=special_skills_category)
                queryset=queryset.filter(special_skills_category=special_skills_category)
        except Exception as e:
            print(e)

        try:
            workplace=data['workplace']
            queryset=queryset.filter(workplace__icontains=workplace)
        except Exception as e:
            print(e)

        try:
            min_age=data.get('min_age',None)
            max_age=data.get('max_age',None)
            q1 = (Q())
            if min_age and max_age:
                q1 |=  (Q(max_age__gte=min_age, min_age__lte=min_age)) | (Q( min_age__lte=max_age, max_age__gte=max_age)) | (Q(max_age__lte=max_age, min_age__gte=min_age))
            elif min_age:
                q1 |=  (Q(min_age__lte=min_age))
            elif max_age:
                q1 |=  (Q(max_age__gte=max_age))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            person_with_disability=data['person_with_disability']
            if  person_with_disability.lower()=="false":
                queryset=queryset.filter(person_with_disability_can_apply=False)
            else:
                queryset=queryset.filter(person_with_disability_can_apply=True)
        except Exception as e:
            print(e)

        try:
            created_at=data['posted']
            queryset=queryset.filter(created_at__gte=datetime.now()-timedelta(days=int(created_at)))
        except Exception as e:
            print(e)


        try:
            deadline=data['deadline']
            queryset=queryset.filter(deadline__lte=datetime.now()+timedelta(days=int(deadline)))
        except Exception as e:
            print(e)
        
        serializer=JobPostSearchSerializer(queryset,many=True)
        return Response(serializer.data)