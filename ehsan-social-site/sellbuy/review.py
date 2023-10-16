from rest_framework.generics import  RetrieveAPIView
from rest_framework.response import Response
from rest_framework import status
from .models import *
from .serializers import *
from  rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import   IsAuthenticated


class ReviewSet(ModelViewSet):
    permission_classes=[IsAuthenticated,]
    serializer_class=ReviewDetailSerializer
    queryset=Review.objects.all()
    def create(self, request, *args, **kwargs):
        data= request.data
        product_id=data['product']
        product=Product.objects.get(id=product_id)
        try:
            if request.user.consumer == product.consumer:
                per=False
            else:
                per=True
        except Exception as e:
            per = True
            print(e)
        if per:
            if Review.objects.filter(product=product, user=request.user).exists():
                return Response({"Error":"You have already Created a review for this Product! Can't Create More."}, status=status.HTTP_406_NOT_ACCEPTABLE)
        data['user_id']=request.user.id
        serializer = self.get_serializer(data=data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
    
    def perform_create(self, serializer):
        serializer.save(is_active=True)
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        request.data['user_id']=request.user.id
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(serializer.data)
    def perform_update(self, serializer):
        serializer.save(is_active=True)
    def get_queryset(self):
        queryset=Review.objects.filter(is_active=True, parent=None)
        return queryset
    
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()
class ProductReviewLISTAPI(RetrieveAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=Review.objects.all()
    lookup_field='id'
    def get(self, request, id, *args, **kwargs):
        product=Product.objects.get(id=id)
        queryset=Review.objects.filter(product=product,parent=None,is_active=True)
        serializer = ReviewDetailSerializer(queryset,many=True)
        return Response(serializer.data)