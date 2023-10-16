from rest_framework.generics import ListCreateAPIView, RetrieveAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from .models import *
from .serializers import *

class PhotoUploadAPI(ListCreateAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=SocialPhoto.objects.all()
    serializer_class=SocialPhotoSerializer
    def perform_create(self, serializer):
        user=self.request.user
        instance=serializer.save(user=user)
        return instance
    def get(self, request, *args, **kwargs):
        queryset=SocialPhoto.objects.filter(user=self.request.user)
        serializer = SocialPhotoSerializer(queryset,many=True)
        return Response(serializer.data)
class PhotoLISTAPI(RetrieveAPIView):
    permission_classes=[IsAuthenticated,]
    lookup_field='id'
    def get(self, request, id, *args, **kwargs):
        post=SocialPost.objects.get(id=id)
        queryset=SocialPhoto.objects.filter(post=post)
        serializer = SocialPhotoSerializer(queryset,many=True)
        return Response(serializer.data)
   
class PhotoUpdateRetrieveDestroyAPI(RetrieveUpdateDestroyAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=SocialPhotoSerializer
    queryset=SocialPhoto.objects.all()
    lookup_field='id'
   