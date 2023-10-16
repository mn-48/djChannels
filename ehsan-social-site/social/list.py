
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from .models import *
from .serializers import *

privacy=PrivacyModelSerializer(many=False, read_only=True)
category=CategorySerializer(many=False, read_only=True)
subactivity=SubActivitySerializer(many=False, read_only=True)
check_in=Check_inSerializer(many=False, read_only=True)
feeling=FeelingSerializer(many=False, read_only=True)
background=BackgroudSerializer(many=False, read_only=True)
gif=GIFSerializer(many=False, read_only=True)
lifeevent=LifeEventSerializer(many=False, read_only=True)
sublifeevent=SubLifeEventSerializer(many=False, read_only=True)

class SocialCategoriesList(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, format=None):
        data={}
        data['privacy']=PrivacyModelSerializer(PrivacyModel.objects.all(), many=True).data
        data['category']=CategorySerializer(Category.objects.all(), many=True).data
        data['activity']=ActivitySerializer(Activity.objects.all(), many=True).data
        data['subactivity']=SubActivitySerializer(SubActivity.objects.all(), many=True).data
        data['check_in']=Check_inSerializer(Check_in.objects.all(), many=True).data
        data['feeling']=FeelingSerializer(Feeling.objects.all(), many=True).data
        data['background']=BackgroudSerializer(Backgroud.objects.all(), many=True).data
        data['gif']=GIFSerializer(GIF.objects.all(), many=True).data
        data['lifeevent']=LifeEventSerializer(LifeEvent.objects.all(), many=True).data
        data['sublifeevent']=SubLifeEventSerializer(SubLifeEvent.objects.all(), many=True).data
        data['reactions']=ReactionsSerializer(Reactions.objects.all(), many=True).data
        return Response(data)