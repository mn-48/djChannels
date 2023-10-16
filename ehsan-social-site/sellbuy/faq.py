from rest_framework.generics import  RetrieveAPIView
from rest_framework.response import Response
from rest_framework import status
from .models import *
from .serializers import *
from  rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import   IsAuthenticated


class FAQViewSet(ModelViewSet):
    permission_classes=[IsAuthenticated,]
    serializer_class=FAQSerializer
    queryset=FAQ.objects.all()

    def create(self, request, *args, **kwargs):
        data= request.data
        data._mutable = True
        data['user_id']=request.user.id
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        request.data._mutable = True
        request.data['user_id']=request.user.id
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)

    def get_queryset(self):
        queryset=FAQ.objects.filter(is_active=True)
        return queryset
    
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()

class ProductFAQLISTAPI(RetrieveAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=FAQ.objects.all()
    lookup_field='id'
    def get(self, request, id, *args, **kwargs):
        product=Product.objects.get(id=id)
        queryset=FAQ.objects.filter(product=product,is_active=True)
        serializer = FAQSerializer(queryset,many=True)
        return Response(serializer.data)