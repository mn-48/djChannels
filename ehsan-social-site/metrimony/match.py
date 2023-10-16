from rest_framework import permissions
from rest_framework.views import APIView
from rest_framework.response import Response

from django.db.models import Q
from . serializers import *
from .models import *
from jobs.models import *
import re


def match(expectation, matripro):
    match_items=[]
    count=0
    try:
        if expectation.marital_status==matripro.user.consumer.marital_status:
            count+=1
            match_items.append("marital_status")
    except Exception as e:
        print(e)
 
    try:
        if expectation.religion.lower() == matripro.user.consumer.religion.lower() :
            count+=1
            match_items.append("religion")
    except Exception as e:
        print(e)

    try:
        if matripro.age  >= expectation.min_age and matripro.age <=  expectation.max_age :
            count+=1
            match_items.append("min_age")
            match_items.append("max_age")
    except Exception as e:
        print(e)

    try:
        if matripro.salary  >= expectation.monthly_income_min and matripro.salary <=  expectation.monthly_income_max :
            count+=1
            match_items.append("monthly_income_min")
            match_items.append("monthly_income_max")
    except Exception as e:
        print(e)

    try:
        if matripro.user.consumer.height  >= expectation.min_height and  matripro.user.consumer.height <= expectation.max_height:
            count+=1
            match_items.append("min_height")
            match_items.append("max_height")
    except Exception as e:
        print(e)
    
    try:
        if expectation.mother_tongue != "":
            keywords = re.split(',|;|, |,,|,', expectation.mother_tongue)
    except:
        keywords=[]
    try:
        for k in keywords:
            if k in matripro.mother_tongue:
                count+=1
                match_items.append("mother_tongue")
                break
    except Exception as e:
        print(e)

    try:
        if expectation.physical_status.lower() in matripro.body_type.lower() :
            count+=1
            match_items.append("physical_status")
    except Exception as e:
        print(e)

    try:
        if expectation.drinking_havits == matripro.do_u_drink :
            count+=1
            match_items.append("drinking_havits")
        elif expectation.drinking_havits == "i don't care":
            count+=1
            match_items.append("drinking_havits")
    except Exception as e:
        print(e)

    try:
        if expectation.smoking_habits == matripro.do_u_smoke :
            count+=1
            match_items.append("smoking_habits")
        elif expectation.smoking_habits == "i don't care":
            count+=1
            match_items.append("smoking_habits")
    except Exception as e:
        print(e)

    try:
        if  expectation.diet and  matripro.diet:
            if expectation.diet.lower() == matripro.diet.lower():
                count+=1
                match_items.append("diet")
            elif expectation.diet.lower() == "any" :
                count+=1
                match_items.append("diet")
    except Exception as e:
        print(e)

    try:
        if expectation.education != "":
            keywords = re.split(',|;|, |,,|,', expectation.education)
    except:
        keywords=[]
    try:
        for k in keywords:
            if k in matripro.education:
                count+=1
                match_items.append("education")
                break
    except Exception as e:
        print(e)

    try:
        if expectation.profession != "":
            keywords = re.split(',|;|, |,,|,', expectation.profession)
    except:
        keywords=[]

    try:
        for k in keywords:
            if k in matripro.user.consumer.occupation:
                count+=1
                match_items.append("profession")
                break
    except Exception as e:
        print(e)

    try:
        if expectation.residency_country != "":
            keywords = re.split(',|;|, |,,|,', expectation.residency_country)
    except:
        keywords=[]
    try:
        for k in keywords:
            if k in matripro.residency_country:
                count+=1
                match_items.append("residency_country")
                break
    except Exception as e:
        print(e)

    return match_items, count

    
class BestMatchedProfiles(APIView):
    permission_classes=[permissions.IsAuthenticated,]
    def get(self, request, format=None):
        expectationprofile=request.user.expectationprofile
        queryset=Personal_Info.objects.exclude((Q(user=request.user)) | (Q(user__consumer__gender__iexact=expectationprofile.user.consumer.gender)))
        data={}
        data['status']='success'
        data['items']=[]
        for qu in queryset:
            match_items, count=match(expectationprofile, qu)
            serializer=PersonalInfoSerializers(qu, many=False)
            serializer2=ConsumerLiteSerializer(qu.user.consumer, many=False)
            item={}
            item['matches']=str((count/13)*100)+"%"
            item['profile']={"Matrimony":serializer.data, "Consumer":serializer2.data}
            item['match_items']=match_items
            data['items'].append(item)

        data['items']=sorted(data['items'], key=lambda x: x['matches'])
        return Response(data)