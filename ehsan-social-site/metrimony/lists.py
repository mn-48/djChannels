

from rest_framework.permissions import  IsAuthenticated

from .serializers import *
from .models import Personal_Info
from rest_framework.generics import ListAPIView


class ViewedProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        queryset=self.request.user.matrimony_viewed.all()
        return queryset
class ViewedByProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        queryset=self.request.user.matrimony_viewed_by.all()
        return queryset

class ShortlistedProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        profile=self.request.user.personal_info
        query=profile.shortlisted.all()
        queryset=Personal_Info.objects.filter(user__in=query)
        return queryset

class InterestedProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        profile=self.request.user.personal_info
        query=profile.interested.all()
        queryset=Personal_Info.objects.filter(user__in=query)
        return queryset

class InterestedByProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        profile=self.request.user.personal_info
        query=profile.interested_by.all()
        queryset=Personal_Info.objects.filter(user__in=query)
        return queryset

class PendingInterestedByProfileListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        profile=self.request.user.personal_info
        query=profile.pending_interested_by.all()
        queryset=Personal_Info.objects.filter(user__in=query)
        return queryset

class AllOpositeGenderProfilesList(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=PersonalInfoLiteSerializer
    queryset=Personal_Info.objects.all()
    def get_queryset(self):
        queryset=Personal_Info.objects.exclude(user__consumer__gender__iexact= self.request.user.consumer.gender)
        return queryset