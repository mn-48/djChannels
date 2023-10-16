from rest_framework.generics import ListCreateAPIView
from rest_framework.permissions import AllowAny
from .models import SubActivity,Backgroud,GIF,Reactions
from .models import PrivacyModel,Check_in,Feeling,LifeEvent,SubLifeEvent,Activity,Category
from .otherSerializers import *

class SubActivityListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=SubActivity.objects.all()
    serializer_class=SubActivitySerializer
class BackgroudListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Backgroud.objects.all()
    serializer_class=BackgroudSerializer

class GIFListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=GIF.objects.all()
    serializer_class=GIFSerializer
class PrivacyModelListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=PrivacyModel.objects.all()
    serializer_class=PrivacyModelSerializer
class Check_inListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Check_in.objects.all()
    serializer_class=Check_inSerializer
class FeelingListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Feeling.objects.all()
    serializer_class=FeelingSerializer
class LifeEventListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=LifeEvent.objects.all()
    serializer_class=LifeEventSerializer
class SubLifeEventListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=SubLifeEvent.objects.all()
    serializer_class=SubLifeEventSerializer
class ActivityListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Activity.objects.all()
    serializer_class=ActivitySerializer
class CategoryListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Category.objects.all()
    serializer_class=CategorySerializer
class ReactionsListCreate(ListCreateAPIView):
    permission_classes=[AllowAny,]
    queryset=Reactions.objects.all()
    serializer_class=ReactionsSerializer