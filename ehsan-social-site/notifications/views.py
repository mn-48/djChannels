from django.shortcuts import render
from rest_framework.generics import RetrieveUpdateAPIView, ListAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from .serializers import *
from .models import *
# Create your views here.
def notificationview(request):
    print(request.user)
    return render(request,'notifications.html')
class NotificationUpdateAPIView(RetrieveUpdateAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=NotificationSerializer
    queryset=Notification.objects.all()
    lookup_field='id'
    def put(self, request, id,*args, **kwargs):
        ids=Notification.objects.filter(id=id).update(is_read=True)
        return Response({"success":"marked As Read"})
class MarkAllReadNotification(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=NotificationSerializer
    queryset=Notification.objects.all()
    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        queryset=queryset.filter(to_user=request.user)
        queryset.update(is_read=True)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)