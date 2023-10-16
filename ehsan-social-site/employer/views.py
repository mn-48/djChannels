from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import  IsAuthenticated
from rest_framework import permissions
from rest_framework import generics
from .serializers import *
from .models import *
from jobs.models import *
from django.db.models import Q

# Jobpost
# Related API Started Here
class JobPostCreate(generics.ListCreateAPIView):
    permission_classes=[permissions.IsAuthenticated,]
    serializer_class=JobPostSerializer
    queryset=JobPost.objects.all()
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=JobPostDetailsSerializer(instance, many=False)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        instance=serializer.save()
        return instance
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = JobPostDetailsSerializer(queryset, many=True)
        return Response(serializer.data)
    def get_queryset(self):
        queryset=JobPost.objects.filter( (Q(employer__in=self.request.user.employer.all())) | (Q(employer__in=self.request.user.moderating_org.all())))
        return queryset
class JobPostUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = JobPostSerializer
    lookup_field='id'
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_update(serializer)
        serializer=JobPostDetailsSerializer(instance, many=False)
        return Response(serializer.data)
    def perform_update(self, serializer):
        instance = serializer.save(is_published=False)
        return instance
    def perform_destroy(self, instance):
        if instance.employer.user==self.request.user:
            instance.is_active=False
            instance.save()
        else:
            return Response({"Error":"You are not Creator of That ogranization!"})


# Job Post operations Starts Here
class JobPostFreeze(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            post= JobPost.objects.get(id=id)
            post.is_freezed=True
            post.save()
            return Response({"Success":"Successfully freezed done!"})
        except:
            return Response({"Error":"JobPost Not Found"})
class JobPostUnFreeze(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            post= JobPost.objects.get(id=id)
            post.is_freezed=False
            post.save()
            return Response({"Success":"Successfully unfreezed done!"})
        except:
            return Response({"Error":"JobPost Not Found"})
class AllJobPostFreeze(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            org= Employer.objects.get(id=id)
            if org.is_hidden:
                return Response({"Error":"You are trying to freeze posts of hidden ORG. To Freeze please unhide that organization.!"})
            if org.user== request.user:
                org.jobposts.all().update(is_freezed=True)
                return Response({"Success":"Successfully freezed all Jobpost of that Org!"})
            else:
                return Response({"Error":"You are not creator of that organisation"})
        except:
            return Response({"Error":"Org Not Found"})
class AllJobPostUnFreeze(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            org= Employer.objects.get(id=id)
            if org.is_hidden:
                return Response({"Error":"You are trying to unfreeze posts of hidden ORG. To Freeze please unhide that organization.!"})
            if org.user== request.user:
                org.jobposts.all().update(is_freezed=False)
                return Response({"Success":"Successfully unfreezed all Jobpost of that Org!"})
            else:
                return Response({"Error":"You are not creator of that organisation"})
        except:
            return Response({"Error":"Org Not Found"})


















# Employer ? Organization
# Related API Started Here
class EmployerListCreate(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated,]
    queryset= Employer.objects.all()
    serializer_class = EmployerSerializer
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        # queryset=queryset.filter(user=request.user)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = EmployerWithTypeSerializer(queryset,context={'request': request}, many=True)
        print(request.user)
        return Response(serializer.data)
    def get_queryset(self):
        queryset=Employer.objects.filter(user=self.request.user)
        queryset= queryset | self.request.user.moderating_org.all() | self.request.user.pending_moderating_org.all()
        return queryset

class EmployerUpdateRetrieveDelete(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Employer.objects.all()
    serializer_class = EmployerSerializer
    lookup_field='id'
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        queryset=Employer.objects.filter(user=request.user)
        serializer = EmployerWithTypeSerializer(queryset, context={'request': request}, many=True)
        return Response(serializer.data)
    def perform_destroy(self, instance):
        if instance.user==self.request.user:
            instance.is_active=False
            instance.save()
        else:
            return Response({"Error":"You are not Creator of That ogranization!"})
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        if instance.user == request.user:
            self.perform_update(serializer)
            instance.jobposts.all().update(is_freezed=True)
        return Response(serializer.data)
    def perform_update(self, serializer):
        serializer.save(is_published=False)







#  ADD and remove Moderator API starts here

class AddModerator(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self, request, id, format=None):
        user=request.user
        org=Employer.objects.get(id=id)
        moderator=User.objects.get(id=request.data['user_id'])
        try:
            if org.user==user:
                org.pending_moderators.add(moderator)
                org.save()
                return Response({'success':'Successfully added as moderator, but it is pending now!'})
            else:
                return Response({'error':'Logged in user is not creator or that organization!'})
        except:
            return Response({'error':'Something went wrong'})
class RemoveModerator(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self, request, id, format=None):
        user=request.user
        org=Employer.objects.get(id=id)
        moderator=User.objects.get(id=request.data['user_id'])
        try:
            if org.user==user:
                org.moderators.remove(moderator)
                org.save()
                return Response({'success':'Successfully removed from moderator!'})
            else:
                return Response({'error':'Logged in user is not creator or that organization!'})
        except:
            return Response({'error':'Something went wrong'})
class AcceptModeratorRequest(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        user=request.user
        org=Employer.objects.get(id=id)
        try:
            if user in org.pending_moderators.all():
                org.pending_moderators.remove(user)
                org.moderators.add(user)
                org.save()
                return Response({'success':'Successfully accepted moderator request!'})
            else:
                return Response({'error':'Logged in user is not creator or that organization!'})
        except:
            return Response({'error':'Something went wrong'})
class LeaveFromModerator(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        user=request.user
        org=Employer.objects.get(id=id)
        try:
            org.moderators.remove(user)
            org.save()
            return Response({'success':'Successfully removed from moderator!'})
        except:
            return Response({'error':'Something went wrong'})
class PendingModeratorOrganizationList(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, format=None):
        user=request.user
        try:
            orgs=user.pending_moderating_org.all()
            serializer = EmployerDetailsSerializer(orgs, many=True)
            return Response(serializer.data)
        except:
            return Response({'error':'Something went wrong'})

#  Organizations Operation Starts Here
class OrganizationHideAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None): 
        try:
            org= Employer.objects.get(id=id)
            if org.user == request.user:
                org.is_hidden=True
                org.save()
            
        except:
            pass
        queryset=Employer.objects.filter(user=request.user)
        serializer = EmployerDetailsSerializer(queryset, many=True)
        return Response(serializer.data)
            
class OrganizationUnHideAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            org= Employer.objects.get(id=id)
            if org.user == request.user:
                org.is_hidden=False
                org.save()
        except:
            pass
        queryset=Employer.objects.filter(user=request.user)
        serializer = EmployerDetailsSerializer(queryset, many=True)
        return Response(serializer.data)



















# Applicants 
# Related API Started Here
from datetime import date, datetime, timedelta
class ApplicantsCreate(generics.CreateAPIView):
    permission_classes=[permissions.IsAuthenticated,]
    serializer_class=ApplicantsSerializer
    queryset=Applicants.objects.all()
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        jobpost=request.data['job']
        jobpost=JobPost.objects.get(id=jobpost)
        if request.user in jobpost.applied.all():
            return Response({"Error":"Already Applied"})
        else:
            instance=self.perform_create(serializer)
            jobpost.applied.add(request.user)
            headers = self.get_success_headers(serializer.data)
            serializer=ApplicantsDetailSerializer(instance)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        experiences=jobprofile.experiences.all()
        days=0
        for ex in experiences:
            if ex.start_date and ex.end_date:
                txt=str(ex.end_date - ex.start_date)
                day=txt.split(" ")
                days=days+int(day[0])
            elif ex.start_date:
                txt=str(date.today()-ex.start_date)
                day=txt.split(" ")
                days=days+int(day[0])
        instance=serializer.save(jobprofile=jobprofile,working_experience=days)
        return instance


class ApplicantsListAPIView(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.all()
        serializer = self.get_serializer(applicants, many=True)
        data={}
        data['jobpost']=JobPostSearchSerializer(instance, many=False).data
        data['total']=instance.applicants_list.all().count()
        data['shortlisted']=instance.applicants_list.filter(shortlisted=True).count()
        data['interviewed']=instance.applicants_list.filter(interviewed=True).count()
        data['selected']=instance.applicants_list.filter(selected=True).count()
        data['rejected']=instance.applicants_list.filter(rejected=True).count()
        data['viewed']=instance.applicants_list.filter(viewed=True).count()
        data['list']=serializer.data

        return Response(data)









# Applicants Operations
# Related API Started Here
# ShortListed Starts Here

from datetime import datetime
class MakeShortlistedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.shortlisted=True
            applicants.viewed=True
            applicants.rejected=False
            applicants.shortlisted_at=datetime.now()
            applicants.save()
            return Response({"Success":"Successfully shortlisted!"})
        except:
            return Response({"Error":"Applicants Not Found"})
class RemoveFromShortlistedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.shortlisted=False
            applicants.save()
            return Response({"Success":"Successfully Removed!"})
        except:
            return Response({"Error":"Applicants Not Found"})

class ShortlistedList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.filter(shortlisted=True)
        serializer = self.get_serializer(applicants, many=True)
        return Response(serializer.data)

        




# interviewed Starts Here
class MakeInterviewedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.interviewed=True
            applicants.rejected=False
            applicants.interviewed_at=datetime.now()
            applicants.save()
            return Response({"Success":"Successfully Added to interviewed!"})
        except:
            return Response({"Error":"Applicants Not Found"})
class RemoveFromInterviewedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.interviewed=False
            applicants.save()
            return Response({"Success":"Successfully Removed!"})
        except:
            return Response({"Error":"Applicants Not Found"})

class InterviewedList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.filter(interviewed=True)
        serializer = self.get_serializer(applicants, many=True)
        return Response(serializer.data)
        

class MakeViewedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.viewed=True
            applicants.save()
            return Response({"Success":"Successfully Added to viewed!"})
        except:
            return Response({"Error":"Applicants Not Found"})
class ViewedList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.filter(viewed=True)
        serializer = self.get_serializer(applicants, many=True)
        return Response(serializer.data)
        



# selected Starts Here
class MakeSelectededAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.selected=True
            applicants.rejected=False
            applicants.selected_at=datetime.now()
            applicants.save()
            return Response({"Success":"Successfully selected!"})
        except:
            return Response({"Error":"Applicants Not Found"})
class RemoveFromSelectedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.selected=False
            applicants.save()
            return Response({"Success":"Successfully Removed!"})
        except:
            return Response({"Error":"Applicants Not Found"})

class SelectedList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.filter(selected=True)
        serializer = self.get_serializer(applicants, many=True)
        return Response(serializer.data)







#  Rejected Starts Here
class MakeRejectedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self, request, id, format=None):
        data=request.data
        try:
            applicants= Applicants.objects.get(id=id)
            feedback=data['feedback']
            applicants.rejected=True
            applicants.viewed=True
            applicants.shortlisted=False
            applicants.interviewed=False
            applicants.selected=False
            applicants.feedback=feedback
            # applicants.shortlisted_at=datetime.now()
            applicants.save()
            return Response({"Success":"Successfully Rejected!"})
        except:
            return Response({"Error":"Something Went Wrong!!!!!!!!!!!!!!"})

class RejectedList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= JobPost.objects.all()
    serializer_class = ApplicantsDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        applicants=instance.applicants_list.filter(rejected=True)
        applicants=instance.applicants_list.filter(rejected=True)
        serializer = self.get_serializer(applicants, many=True)
        return Response(serializer.data)
    
class RemoveFromRejectedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            applicants= Applicants.objects.get(id=id)
            applicants.rejected=False
            applicants.save()
            return Response({"Success":"Successfully Removed!"})
        except:
            return Response({"Error":"Applicants Not Found"})