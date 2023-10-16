from rest_framework.response import Response
from rest_framework import status
from  rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import  IsAuthenticated
from .models import Reports
from .serializers import ReportsSerializer
class ReportsViewSet(ModelViewSet):
    permission_classes=[IsAuthenticated,]
    serializer_class=ReportsSerializer
    queryset=Reports.objects.all()
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    def get_queryset(self):
        queryset=Reports.objects.filter(user=self.request.user)
        return queryset
    def create(self, request, *args, **kwargs):
        data=request.data
        try:
            consumer_to_id=data['consumer_to_id']
            if Reports.objects.filter(user=request.user, consumer_to_id=consumer_to_id, is_active=True).exists():
                serializer = self.get_serializer(Reports.objects.filter(user=request.user, consumer_to_id=consumer_to_id, is_active=True).first())
                headers = self.get_success_headers(serializer.data)
                return Response(serializer.data, status=status.HTTP_406_NOT_ACCEPTABLE, headers=headers)
        except Exception as e:
            print(e)
        try:
            matri_pro_to_id=data['matri_pro_to_id']
            if Reports.objects.filter(user=request.user, matri_pro_to_id=matri_pro_to_id, is_active=True).exists():
                serializer = self.get_serializer(Reports.objects.filter(user=request.user, matri_pro_to_id=matri_pro_to_id, is_active=True).first())
                headers = self.get_success_headers(serializer.data)
                return Response(serializer.data, status=status.HTTP_406_NOT_ACCEPTABLE, headers=headers)
        except Exception as e:
            print(e)
        try:
            employer_to_id=data['employer_to_id']
            if Reports.objects.filter(user=request.user, employer_to_id=employer_to_id, is_active=True).exists():
                serializer = self.get_serializer(Reports.objects.filter(user=request.user, employer_to_id=employer_to_id, is_active=True).first())
                headers = self.get_success_headers(serializer.data)
                return Response(serializer.data, status=status.HTTP_406_NOT_ACCEPTABLE, headers=headers)
        except Exception as e:
            print(e)
        try:
            jobpost_to_id=data['jobpost_to_id']
            if Reports.objects.filter(user=request.user, jobpost_to_id=jobpost_to_id, is_active=True).exists():
                serializer = self.get_serializer(Reports.objects.filter(user=request.user, jobpost_to_id=jobpost_to_id, is_active=True).first())
                headers = self.get_success_headers(serializer.data)
                return Response(serializer.data, status=status.HTTP_406_NOT_ACCEPTABLE, headers=headers)
        except Exception as e:
            print(e)
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)