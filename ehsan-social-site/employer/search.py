from rest_framework import permissions, generics
from rest_framework.views import APIView
from rest_framework.response import Response

from django.db.models import Q
from . serializers import *
from .models import *
from jobs.models import *

# Something Based LIST Started Here
class FunctionalCategoryJobPostAPIView(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= FunctionalJobCategory.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        posts=JobPost.objects.filter(functional_category=instance)
        serializer = self.get_serializer(posts, many=True)
        return Response(serializer.data)
class SpecialSkillCategoryJobPostAPIView(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= SpecialSkillCategory.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        posts=JobPost.objects.filter(special_skills_category=instance)
        serializer = self.get_serializer(posts, many=True)
        return Response(serializer.data)


class OrganizationTypeJobList(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= OrganizationType.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        emps=instance.orgs_ty.all()
        que=JobPost.objects.filter(employer__in=emps)
        serializer = self.get_serializer(que, many=True)
        return Response(serializer.data)
class IndustryCategoryBasedJobListAPI(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= IndustryCategory.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        posts=instance.org_post.all()
        serializer = self.get_serializer(posts, many=True)
        return Response(serializer.data)
class LocationBasedJobs(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= City.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        posts=JobPost.objects.filter(job_location=instance)
        serializer = self.get_serializer(posts, many=True)
        return Response(serializer.data)

class OrganizationBasedJobs(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Employer.objects.all()
    serializer_class = JobPostDetailSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        posts=instance.jobposts.all()
        serializer = self.get_serializer(posts, many=True)
        return Response(serializer.data)

class FeaturedJobPostList(generics.ListAPIView):
    permission_classes=[permissions.IsAuthenticated,]
    serializer_class=JobPostEverythingSerializer
    queryset=JobPost.objects.all()
    def get_queryset(self):
        queryset=JobPost.objects.filter(is_featured=True)
        return queryset
class AllJobPostList(generics.ListAPIView):
    permission_classes=[permissions.IsAuthenticated,]
    serializer_class=JobPostEverythingSerializer
    queryset=JobPost.objects.all()

# Search API Started
class QuerySearchAPI(APIView):
    permission_classes=(permissions.IsAuthenticated,)
    def post(self, request, format=None):
        data=self.request.data
        queryset=JobPost.objects.filter(is_active=True)
        
        query=data['query']
        q=(Q(job_title__icontains=query))|(Q(special_skills_category__name__icontains=query))|(Q(special_instruction__icontains=query))|(Q(job_responsibilities__icontains=query))|(Q(area_of_experience__icontains=query))|(Q(area_of_business__icontains=query))| (Q(skills__icontains=query))|(Q(functional_category__name__icontains=query))|(Q(additional_requirements__icontains=query))|(Q(job_context__icontains=query))
        queryset=queryset.filter(q)
        
        serializer=JobPostSearchSerializer(queryset,many=True)
        return Response(serializer.data)
