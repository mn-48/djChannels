from rest_framework.serializers import ModelSerializer
from .models import PrivacyModel,Check_in,Feeling,LifeEvent,SubLifeEvent,Activity,Category,SubActivity,Backgroud,GIF,Reactions

class ReactionsSerializer(ModelSerializer):
    class Meta:
        model= Reactions
        fields='__all__'

class BackgroudSerializer(ModelSerializer):
    class Meta:
        model= Backgroud
        fields='__all__'

class GIFSerializer(ModelSerializer):
    class Meta:
        model= GIF
        fields='__all__'



class CategorySerializer(ModelSerializer):
    class Meta:
        model= Category
        fields='__all__'

class ActivitySerializer(ModelSerializer):
    class Meta:
        model= Activity
        fields='__all__'
class SubActivitySerializer(ModelSerializer):
    activity=ActivitySerializer(many=False, read_only=True)
    class Meta:
        model= SubActivity
        fields='__all__'
class LifeEventSerializer(ModelSerializer):
    class Meta:
        model= LifeEvent
        fields='__all__'
class SubLifeEventSerializer(ModelSerializer):
    lifeevent=LifeEventSerializer(many=False, read_only=True)
    class Meta:
        model= SubLifeEvent
        fields='__all__'

class PrivacyModelSerializer(ModelSerializer):
    class Meta:
        model= PrivacyModel
        fields='__all__'

class Check_inSerializer(ModelSerializer):
    class Meta:
        model= Check_in
        fields='__all__'

class FeelingSerializer(ModelSerializer):
    class Meta:
        model= Feeling
        fields='__all__'

