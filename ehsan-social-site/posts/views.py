

from rest_framework.generics import ListAPIView
from rest_framework.permissions import AllowAny
from .models import PostCategory
from .serializers import *
# Create your views here.
class PostCategoryList(ListAPIView):
    permission_classes=[AllowAny,]
    queryset=PostCategory.objects.all()
    serializer_class=PostCategorySerializers