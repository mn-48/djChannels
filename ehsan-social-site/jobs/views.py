from rest_framework import status,permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import generics
from . serializers import *
from .models import *
class JobProfileCreateUpdateRetrieveAPIView(APIView):
    permission_classes=[permissions.IsAuthenticated,]
    def post(self,request,format=None):
        try:
            jobpro=JobProfile.objects.get(user=self.request.user)
        except:
            jobpro=JobProfile.objects.create(user=self.request.user)
        serializer = JobProfileSerializer(jobpro, data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=serializer.save(user=self.request.user)
        serializer=JobProfileDetailsSerializer(instance)
        return Response(serializer.data)
    def get(self,request,format=None):
        try:
            jobpro=JobProfile.objects.get(user=self.request.user)
        except:
            jobpro=None
        if jobpro:
            serializer=JobProfileDetailsSerializer(jobpro,many=False)
            return Response(serializer.data)
        else:
            return Response({"error":"user don't have any jobprofile"})

    def delete(self, request, format=None):
        try:
            jobpro=JobProfile.objects.get(user=self.request.user)
        except:
            jobpro=None
        if jobpro:
            jobpro.delete()
            return Response({"Success":"Successfully Deleted"})
        else:
            
            return Response({"error":"user don't have any jobprofile"})
class DisabilityProfileAPI(APIView):
    permission_classes=[permissions.IsAuthenticated,]
    def post(self, request,format=None):
        try:
            jobpro=JobProfile.objects.get(user=self.request.user)
        except:
            jobpro=JobProfile.objects.create(user=self.request.user)
        try:
            disability=Disability_information.objects.get(jobprofile=jobpro)
        except:
            disability=Disability_information.objects.create(jobprofile=jobpro)
        serializer = DisabilitySerializer(disability, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(jobprofile=jobpro)
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    def get(self,request, format=None):
        disability=Disability_information.objects.get(jobprofile=self.request.user.jobprofile)
        serializer=DisabilitySerializer(disability,many=False)
        return Response(serializer.data)
    def delete(self, request, format=None):
        try:
            disability=Disability_information.objects.get(jobprofile=self.request.user.jobprofile)
        except:
            disability=None
        if disability:
            disability.delete()
            return Response({"Success":"Successfully Deleted"})
        else:
            return Response({"error":"user don't have any jobprofile"})

class EducationProfileAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= EducationProfile.objects.all()
    serializer_class = EducationProfileSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=EducationProfile.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset

class EduProfileDeleteAPIView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= EducationProfile.objects.all()
    serializer_class = EducationProfileSerializer
    lookup_field='id'
class TrainingAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Training.objects.all()
    serializer_class = TrainingProfileSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        user=self.request.user
        queryset=Training.objects.filter(jobprofile=user.jobprofile)
        return queryset
class TrainingUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Training.objects.all()
    serializer_class = TrainingProfileSerializer
    lookup_field='id'
class Professional_certificateAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Professional_certificate.objects.all()
    serializer_class = ProfessionalProfileSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=Professional_certificate.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
class ProCertificateUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Professional_certificate.objects.all()
    serializer_class = ProfessionalProfileSerializer
    lookup_field='id'
class ExperienceAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Experience.objects.all()
    serializer_class = ExperienceSerializer
    def perform_create(self, serializer):
        
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=Experience.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
class ExperienceUpdateAPIView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Experience.objects.all()
    serializer_class = ExperienceSerializer
    lookup_field='id'
class Project_WorksAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Project_Works.objects.all()
    serializer_class = Project_WorksSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=Project_Works.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
class Project_WorksUpdateAPI(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Project_Works.objects.all()
    serializer_class = Project_WorksSerializer
    lookup_field='id'
class SkillsAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Skills.objects.all()
    serializer_class = SkillsSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=Skills.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
class SkillsUpdateAPI(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Skills.objects.all()
    serializer_class = SkillsSerializer
    lookup_field='id'
class ReferenceAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Reference.objects.all()
    serializer_class = ReferenceSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        if jobprofile.reference.all().count()>=2:
            return False
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=Reference.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        val=self.perform_create(serializer)
        if val== False:
            return Response({"error":"User can't Create More Than Two Reference"})
        else:
            headers = self.get_success_headers(serializer.data)
            return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
        
class ReferenceUpdateAPI(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= Reference.objects.all()
    serializer_class = ReferenceSerializer
    lookup_field='id'

class ArmyExperienceAPI(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= ArmyExperience.objects.all()
    serializer_class = ArmyExperienceSerializer
    def perform_create(self, serializer):
        jobprofile=self.request.user.jobprofile
        serializer.save(jobprofile=jobprofile)
    def get_queryset(self):
        queryset=ArmyExperience.objects.filter(jobprofile=self.request.user.jobprofile)
        return queryset
class ArmyExperienceUpdateAPI(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset= ArmyExperience.objects.all()
    serializer_class = ArmyExperienceSerializer
    lookup_field='id'