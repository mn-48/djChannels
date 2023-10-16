from rest_framework import serializers
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAuthenticated
from rest_framework.views import APIView
from django.contrib.auth.models import User
from rest_framework import status

from .models import CoverPhoto, ProfilePhoto
from .serializers import ProfilePhotoSerializer,CoverPhotoSerializer, ProfilePhotoDetailSerializer,CoverPhotoDetailSerializer

class ProfilePhotoCreateListAPIView(ListCreateAPIView):
    queryset=ProfilePhoto.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=ProfilePhotoSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=ProfilePhotoDetailSerializer(instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        user=self.request.user
        instance=serializer.save(user=user)
        return instance
    def get_queryset(self):
        queryset=ProfilePhoto.objects.filter(user=self.request.user)
        return queryset
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = ProfilePhotoDetailSerializer(queryset, many=True)
        return Response(serializer.data)
class ProfilePhotoRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset= ProfilePhoto.objects.all()
    serializer_class = ProfilePhotoSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = ProfilePhotoDetailSerializer(instance)
        return Response(serializer.data)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        serializer=ProfilePhotoDetailSerializer(instance)
        return Response(serializer.data)
    def perform_update(self, serializer):
        user=self.request.user
        print(serializer.validated_data)
        serializer.save(user=user)
        
class CoverPhotoCreateListAPIView(ListCreateAPIView):
    queryset=CoverPhoto.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=CoverPhotoSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=CoverPhotoDetailSerializer(instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        user=self.request.user
        instance=serializer.save(user=user)
        return instance
    def get_queryset(self):
        queryset=CoverPhoto.objects.filter(user=self.request.user)
        return queryset
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer =CoverPhotoDetailSerializer(queryset, many=True)
        return Response(serializer.data)
class CoverPhotoRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset= CoverPhoto.objects.all()
    serializer_class = CoverPhotoSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = CoverPhotoDetailSerializer(instance)
        return Response(serializer.data)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        serializer=CoverPhotoDetailSerializer(instance)
        return Response(serializer.data)
    def perform_update(self, serializer):
        user=self.request.user
        print(serializer.validated_data)
        serializer.save(user=user)
        
class ProfilePhotoActiveView(APIView):
    permission_classes=[IsAuthenticated,]
    def options(self, request, id, format=None):
        actives=ProfilePhoto.objects.filter(is_active=True).filter(user=request.user)
        for act in actives:
            act.is_active=False
            act.save()
        instance=ProfilePhoto.objects.get(id=id)
        instance.is_active=True
        instance.save()
        serializer=ProfilePhotoDetailSerializer(instance)
        return Response(serializer.data)

class CoverPhotoActiveView(APIView):
    permission_classes=[IsAuthenticated,]
    def options(self, request, id, format=None):
        actives=CoverPhoto.objects.filter(is_active=True).filter(user=request.user)
        for act in actives:
            act.is_active=False
            act.save()
        instance=CoverPhoto.objects.get(id=id)
        instance.is_active=True
        instance.save()
        serializer=CoverPhotoDetailSerializer(instance)
        return Response(serializer.data)