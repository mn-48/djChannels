from rest_framework.generics import ListAPIView,ListCreateAPIView, RetrieveAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticatedOrReadOnly,IsAuthenticated
from rest_framework.views import APIView
from django.contrib.auth.models import User
# from userapp.serializers import UserDetailSerializer,SpecialSerializer
from userapp.serializers import *
from user_management.models import Consumer,Country,City
class ConsumerDetailAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self,request,format=None):
        user=request.user
        serializer = UserDetailSerializer(user, many=False)
        return Response(serializer.data)


class ProfileUpdateAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def put(self, request, format=None):
        data=self.request.data
        user=request.user
        if not user.username:
            try:
                user.username= data['username']
            except:
                pass
        if not user.first_name:
            try:
                user.first_name= data['first_name']
            except:
                pass
        if not user.last_name:
            try:
                user.last_name = data['last_name']
            except:
                pass
        if not user.email:
            try:
                user.email = data['email']
            except:
                pass
        user.save()
        # user.save(using='auth_db')

        consumer=Consumer.objects.get(user=user)
        try:
            consumer.phone=str(data['phone'])
        except:
            pass
        if consumer.father_name_change:
            try:
                consumer.father_name = data['father_name']
                consumer.father_name_change=False
            except:
                consumer.father_name_change=True

        if consumer.mother_name_change:
            try:
                consumer.mother_name = data['father_name']
                consumer.mother_name_change=False
            except:
                consumer.mother_name_change=True
        if not consumer.gender:
            try:
                consumer.gender = data['gender']
            except:
                pass
        if not consumer.nid_number:
            try:
                consumer.nid_number = data['nid_number']
            except:
                pass
        if not consumer.date_of_birth:
            try:
                consumer.date_of_birth = data['date_of_birth']
            except:
                pass
        if not consumer.first_name:
            try:
                consumer.first_name = data['first_name']
            except:
                pass
        if not consumer.last_name:
            try:
                consumer.last_name = data['last_name']
            except:
                pass
        try:
            consumer.occupation=data['occupation']
        except:
            pass
        try:
            consumer.religion=data['religion']
        except:
            pass
        try:
            consumer.photo= request.FILES["photo"]
        except:
            pass
        try:
            consumer.father_occupation=data['father_occupation']
        except:
            pass
        try:
            consumer.mother_occupation=data['mother_occupation']
        except:
            pass
        try:
            consumer.spouse_name=data['spouse_name']
        except:
            pass
        try:
            consumer.address1=data['address1']
        except:
            pass
        try:
            consumer.address2=data['address2']
        except:
            pass
        try:
            consumer.country=Country.objects.get(name=data['country'])
        except:
            pass
        try:
            consumer.city=City.objects.get(name=data['city'])
        except:
            pass
        try:
            consumer.bio=data['bio']
        except:
            pass
        try:
            consumer.blood_group=data['blood_group']
        except:
            pass
        try:
            consumer.height=data['height']
        except:
            pass
        try:
            consumer.weight=data['weight']
        except:
            pass
        try:
            consumer.hobby=data['hobby']
        except:
            pass
        try:
            consumer.marital_status=data['marital_status']
        except:
            pass
        try:
            consumer.languages=data['languages']
        except:
            pass
        try:
            consumer.about_tour=data['about_tour']
        except:
            pass
        try:
            consumer.about_family_members=data['about_family_members']
        except:
            pass
        try:
            consumer.designation_and_service_organization=data['designation_and_service_organization']
        except:
            pass
        try:
            consumer.primary_name_and_session=data['primary_name_and_session']
        except:
            pass
        try:
            consumer.highschool_name_and_session=data['highschool_name_and_session']
        except:
            pass
        try:
            consumer.college_name_and_session=data['college_name_and_session']
        except:
            pass
        try:
            consumer.university_name_and_session=data['university_name_and_session']
        except:
            pass
        try:
            consumer.psd_name_and_session=data['psd_name_and_session']
        except:
            pass
        try:
            consumer.others_name_and_session=data['others_name_and_session']
        except:
            pass
        consumer.save()
        serializer=UserDetailSerializer(user, many=False)
        return Response(serializer.data)
    # def get(self,request,format=None):
    #     user=request.user
    #     serializer = UserDetailSerializer(user, many=False)
    #     return Response(serializer.data)
    def get(self,request,format=None):
        user=request.user
        consumer=Consumer.objects.get(user=user)
        data={}
        data['contact']=ContactSerializer(consumer, many=False).data
        data['body']=BodySerializer(consumer, many=False).data
        data['basic_info']=BasicSerializer(consumer, many=False).data
        data['education']=EducationSerializer(consumer, many=False).data
        data['customer']=CustomerSerializer(consumer, many=False).data
        return Response(data)
from ipware import get_client_ip
import urllib, json
import geoip2.database

class LocationAPIView(APIView):
    # permission_classes=[IsAuthenticated,]
    def get(self,request,format=None):
        client_ip, is_routable = get_client_ip(request)
        if client_ip is None:
            client_ip="0.0.0.0"
        else:
            if is_routable:
                ip_type="Public"
            else:
                ip_type="Private"
        ip_address = '116.204.228.58'
        url = 'https://api.ipfind.com/?ip=' + ip_address+"&auth=52af0442-98f2-4ace-ba49-8d5b4912fe55"
        response = urllib.request.urlopen(url)
        data1 = json.loads(response.read())
        # with geoip2.database.Reader('GeoLite2-City.mmdb') as reader:
        #     response = reader.city('101.0.33.0')
        #     print(
        #         response.country.iso_code,
        #         response.country.name,
        #         response.country.names['zh-CN'],
        #         response.subdivisions.most_specific.name,
        #         response.subdivisions.most_specific.iso_code,
        #         response.city.name,
        #         response.postal.code,
        #         response.location.latitude,
        #         response.location.longitude,
        #         response.traits.network
        #     )

        data1['client_ip']=client_ip
        data1['ip_type']=ip_type
        
        
        return Response(data1)