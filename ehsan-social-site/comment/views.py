from rest_framework.generics import CreateAPIView,RetrieveAPIView, ListAPIView, ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework import status
import datetime
from .models import *
from .serializers import *
                                                                       
# Create your views here.        
class PostCommentCreateAPIView(CreateAPIView):
    queryset=PostComment.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=PostCommentSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=PostCommentDetailSerializer(instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        user=self.request.user
        time=datetime.datetime.now()
        instance=serializer.save(user=user,updated_at=time,is_active=True)
        return instance
class PostCommentLISTAPI(RetrieveAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=PostComment.objects.all()
    lookup_field='id'
    def get(self, request, id, *args, **kwargs):
        post=SocialPost.objects.get(id=id)
        queryset=PostComment.objects.filter(post=post,parent=None,is_active=True)
        serializer = PostCommentDetailSerializer(queryset,many=True)
        return Response(serializer.data)

class PostCommentRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset= PostComment.objects.all()
    serializer_class = PostCommentSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        if not instance.is_active:
            instance=None
            return Response({"error":"object not found"})
        serializer = PostCommentDetailSerializer(instance)
        return Response(serializer.data)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        if instance.image:
            history=PostCommentHistory.objects.create(postcomment=instance,text=instance.text,image=instance.image,user=instance.user)
        else:
            history=PostCommentHistory.objects.create(postcomment=instance,text=instance.text,user=instance.user)
        self.perform_update(serializer)
        serializer=PostCommentDetailSerializer(instance)
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
class PostCommentReactAddAPIView(RetrieveModelMixin,CreateAPIView):
    permission_classes=[IsAuthenticated,]
    lookup_field='id'
    serializer_class=PostCommentDetailSerializer
    queryset=PostComment.objects.all()
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
        post=PostComment.objects.get(id=id)
        data=request.data
        obj=self.get_object()
        reaction=data['reaction']
        if reaction in "likes love care sad senti angry haha wow":
            self.removes(obj)
            getattr(obj, reaction).add(self.request.user)
        elif reaction == "no":
            self.removes(obj)
        serializer=PostCommentDetailSerializer(post)
        return Response(serializer.data)

class PostCommentUpdateHistoryListAPIView(ListAPIView):
    queryset=PostCommentHistory.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=PostCommentHistorySerializer
    lookup_field='id'
    def get_queryset(self,id):
        postcomment=PostComment.objects.get(id=id)
        queryset=PostCommentHistory.objects.filter(postcomment=postcomment)
        return queryset
    def list(self, request,id, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset(id))
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class PostPhotoCommentCreateAPIView(CreateAPIView):
    queryset=PostPhotoComment.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=PostPhotoCommentSerializer
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance=self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        serializer=PostPhotoCommentDetailSerializer(instance)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    def perform_create(self, serializer):
        user=self.request.user
        instance=serializer.save(user=user,is_active=True)
        return instance

class PostPhotoCommentLISTAPI(RetrieveAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=PostPhotoComment.objects.all()
    lookup_field='id'
    def get(self, request, id, *args, **kwargs):
        photo=SocialPhoto.objects.get(id=id)
        queryset=PostPhotoComment.objects.filter(photo=photo,parent=None,is_active=True)
        serializer = PostPhotoCommentDetailSerializer(queryset,many=True)
        return Response(serializer.data)

class PostPhotoCommentRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset= PostPhotoComment.objects.all()
    serializer_class = PostPhotoCommentSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        if not instance.is_active:
            instance=None
            return Response({"error":"object not found"})
        serializer = PostPhotoCommentDetailSerializer(instance)
        return Response(serializer.data)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        if instance.image:
            history=PostPhotoCommentHistory.objects.create(postphotocomment=instance,text=instance.text,image=instance.image,user=instance.user)
        else:
            history=PostPhotoCommentHistory.objects.create(postphotocomment=instance,text=instance.text,user=instance.user)
        self.perform_update(serializer)
        serializer=PostPhotoCommentDetailSerializer(instance)
        return Response(serializer.data)
    def perform_update(self, serializer):
        user=self.request.user
        time=datetime.datetime.now()
        print(serializer.validated_data)
        serializer.save(user=user,updated_at=time)
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()
        
class PostPhotoCommentReactAddAPIView(RetrieveModelMixin,CreateAPIView):
    permission_classes=[IsAuthenticated,]
    lookup_field='id'
    serializer_class=PostPhotoCommentSerializer
    queryset=PostPhotoComment.objects.all()
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
        post=PostPhotoComment.objects.get(id=id)
        data=request.data
        obj=self.get_object()
        reaction=data['reaction']
        if reaction in "likes love care sad senti angry haha wow":
            self.removes(obj)
            getattr(obj, reaction).add(self.request.user)
        elif reaction == "no":
            self.removes(obj)
        serializer=PostPhotoCommentDetailSerializer(post)
        return Response(serializer.data)


class PostPhotoCommentUpdateHistoryListAPIView(ListAPIView):
    queryset=PostPhotoCommentHistory.objects.all()
    permission_classes=[IsAuthenticated,]
    serializer_class=PostPhotoCommentHistorySerializer
    lookup_field='id'
    def get_queryset(self,id):
        postphotocomment=PostPhotoComment.objects.get(id=id)
        queryset=PostPhotoCommentHistory.objects.filter(postphotocomment=postphotocomment)
        return queryset
    def list(self, request,id, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset(id))
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)