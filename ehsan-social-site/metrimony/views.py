from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView

from user_management.models import Consumer
from .models import Personal_Info,Expectaion, VisaVerification
from .serializers import PersonalInfoSerializers,ExpectationSerializers, VisaVerificationSerializer
from .serializers import ConsumerLiteSerializer
class MetrimonyProfile(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None, *args, **kwargs):
        user=request.user
        try:
            person , created=Personal_Info.objects.get_or_create(user=user)
        except Exception as e:
            print(e)
        serializer = PersonalInfoSerializers(person, data=request.data)
        serializer.is_valid(raise_exception=True)
        matrimony=serializer.save(user=request.user)
        context={}
        if matrimony:
            context['Matrimony']=serializer.data
        try:
            visaprofile, created=VisaVerification.objects.get_or_create(matrimony=matrimony)
        except Exception as e:
            print(e)
        serializer3=VisaVerificationSerializer(visaprofile, data=request.data)
        serializer3.is_valid(raise_exception=True)
        visa_no=serializer3.validated_data.get('visa_no',None)
        visa_country=serializer3.validated_data.get('visa_country',None)
        if visa_no and visaprofile.visa_no != visa_no:
            serializer3.save(visa_varified=False)
        elif visa_country and visaprofile.visa_country != visa_country:
            serializer3.save(visa_varified=False)
        else:
            serializer3.save(visa_varified=visaprofile.visa_varified)
        context['visaprofile']=serializer3.data

        try:
            consumer, created=Consumer.objects.get_or_create(user=user)
        except Exception as e:
            pass
        if consumer:
            serializer2 = ConsumerLiteSerializer(consumer, data=request.data)
            serializer2.is_valid(raise_exception=True)
            serializer2.save(user=request.user)
            context['Consumer']=serializer2.data
        else:
            context['Consumer']="User doesn't have consumer Profile!!!"
        return Response(context)

    def get(self,request,format=None):
        user=request.user
        try:
            matrimony, created=Personal_Info.objects.get_or_create(user=user)
            consumer, created=Consumer.objects.get_or_create(user=request.user)
        except Exception as e:
            print(e)
        try:
            visaprofile=VisaVerification.objects.get(matrimony=matrimony)
        except:
            visaprofile=VisaVerification.objects.create(matrimony=matrimony)

        serializer2 = ConsumerLiteSerializer(consumer, many=False)
        serializer3 = VisaVerificationSerializer(visaprofile, many=False)
        serializer= PersonalInfoSerializers(matrimony, many=False, context={'request': request})
        context={
            'Metrimony':serializer.data,
            'visaprofile':serializer3.data,
            'Consumer':serializer2.data
        }
        return Response(context)
        # return Response(serializer.data)
    def delete(self, request, format=None):
        user=request.user
        try:
            person=Personal_Info.objects.get(user=user)
            person.delete()
            return Response({"Success":"Successfully Deleted"})
        except:
            return Response({"error":"Profile Not Found"})

class ExpectationProfile(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        data=self.request.data
        user=request.user
        try:
            expectation=Expectaion.objects.get(user=user)
        except:
            expectation=Expectaion()
        serializer = ExpectationSerializers(expectation, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(user=request.user)
        return Response(serializer.data)
    def get(self,request,format=None):
        user=request.user
        try:
            expectation=Expectaion.objects.get(user=user)
        except:
            expectation=Expectaion()
            expectation.user=user
            expectation.save()
        serializer= ExpectationSerializers(expectation,many=False,context={'request': request})
        return Response(serializer.data)
    def delete(self,request,format=None):
        user=request.user
        try:
            expectation=Expectaion.objects.get(user=user)
            expectation.delete()
            return Response({"Success":"Successfully Deleted"})
        except:
            return Response({"error":"Profile Not Found"})

    
