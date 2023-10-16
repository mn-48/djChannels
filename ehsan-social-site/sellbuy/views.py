from rest_framework.generics import ListAPIView
from .models import *
from .serializers import *
from  rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import  AllowAny, IsAuthenticated

class ProductViewSet(ModelViewSet):
    permission_classes=[IsAuthenticated,]
    serializer_class=ProductSerializer
    queryset=Product.objects.all()
    def perform_create(self, serializer):
        serializer.save(consumer=self.request.user.consumer, is_active=True)
    def get_queryset(self):
        queryset=Product.objects.filter(is_active=True)
        return queryset
    def perform_destroy(self, instance):
        instance.is_active=False
        instance.save()
class CategoryListAPI(ListAPIView):
    permission_classes=[AllowAny,]
    serializer_class=CategorySerializer
    queryset=Category.objects.all()
    

