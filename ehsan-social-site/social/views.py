
from rest_framework.generics import CreateAPIView, ListAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
import datetime
from .models import *
from .serializers import *
                                                                       
# Create your views here.        
class SocialPostCreateListAPIView(ListCreateAPIView):
    queryset=SocialPost.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=SocialPostSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=SocialPostDetailSerializer(instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        user=self.request.user
        instance=serializer.save(user=user)
        return instance
    def get_queryset(self):
        queryset=SocialPost.objects.filter(user=self.request.user)
        return queryset
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        queryset=queryset.filter(is_active=True)
        serializer =SocialPostDetailSerializer(queryset, many=True)
        return Response(serializer.data)
class SocialPostRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset= SocialPost.objects.all()
    serializer_class = SocialPostSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        if not instance.is_active:
            instance=None
        serializer = SocialPostDetailSerializer(instance)
        return Response(serializer.data)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        history=SocialUpdateHistory.objects.create(post=instance,post_text=instance.post_text,is_hqa=instance.is_hqa)
        print(history)
        self.perform_update(serializer)
        serializer=SocialPostDetailSerializer(instance)
        return Response(serializer.data)
    def perform_update(self, serializer):
        user=self.request.user
        time=datetime.datetime.now()
        print(serializer.validated_data)
        serializer.save(user=user,updated_at=time)
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()
        

from rest_framework.mixins import RetrieveModelMixin
class ReactAddAPIView(RetrieveModelMixin,CreateAPIView):
    permission_classes=[IsAuthenticated,]
    lookup_field='id'
    serializer_class=SocialPostDetailSerializer
    queryset=SocialPost.objects.all()
    def removes(self,obj,format=None):
        try :
            obj.likes.remove(self.request.user)
            obj.love.remove(self.request.user)
            obj.care.remove(self.request.user)
            obj.wow.remove(self.request.user)
            obj.sad.remove(self.request.user)
            obj.angry.remove(self.request.user)
            obj.haha.remove(self.request.user)
            obj.senti.remove(self.request.user)
        except:
            print("something went wrong")
    def post(self, request, id, format=None):
        post=SocialPost.objects.get(id=id)
        data=request.data
        obj=self.get_object()
        reaction=data['reaction']
        if reaction in "likes love care sad senti angry haha wow":
            self.removes(obj)
            getattr(obj, reaction).add(self.request.user)
        elif reaction == "no":
            self.removes(obj)
        serializer=SocialPostDetailSerializer(post)
        return Response(serializer.data)

class UpdateHistoryListAPIView(ListAPIView):
    queryset=SocialUpdateHistory.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=SocialUpdateHistorySerializer
    lookup_field='id'
    def get_queryset(self,id):
        post=SocialPost.objects.get(id=id)
        queryset=SocialUpdateHistory.objects.filter(post=post)
        return queryset
    def list(self, request,id, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset(id))
        #  for pagination
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    