from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from .models import *
from .serializers import *
from  rest_framework.viewsets import ModelViewSet
from rest_framework.permissions import  IsAuthenticated


class SellerProfileCRUD(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None, *args, **kwargs):
        user=request.user
        try:
            seller , created=SellerProfile.objects.get_or_create(user=user)
        except Exception as e:
            print(e)
        serializer = SellerProfileSerializers(seller, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(user=request.user, is_active=True)
        return Response(serializer.data)

    def get(self,request,format=None):
        user=request.user
        try:
            seller , created=SellerProfile.objects.get_or_create(user=user)
        except Exception as e:
            print(e)
        if seller.is_active:
            serializer = SellerProfileSerializers(seller, many=False)
            return Response(serializer.data)
        else:
            return Response({'error':"Profile Not Found"},status=status.HTTP_404_NOT_FOUND)

    def delete(self, request, format=None):
        user=request.user
        try:
            seller=SellerProfile.objects.get(user=user)
            seller.is_active=False
            seller.save()
            return Response({"Success":"Successfully Deleted"})
        except:
            return Response({"error":"Profile Not Found"})


class DealerProfileViewSet(ModelViewSet):
    permission_classes=[IsAuthenticated,]
    serializer_class=DealerProfileSerializer
    queryset=DealerProfile.objects.all()
    def perform_create(self, serializer):
        serializer.save(seller=self.request.user.seller_profile)