from rest_framework.generics import ListAPIView, RetrieveAPIView
from rest_framework.response import Response
from django.db.models import Q
from .models import *
from .serializers import *
from rest_framework.permissions import   IsAuthenticated


# for getting selfs product
class SelfProductLISTAPIView(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=ProductSerializer
    queryset=Product.objects.all()
    def get_queryset(self):
        try:
            queryset=Product.objects.filter((Q(consumer=self.request.user.consumer)|Q(seller=self.request.user.seller_profile) | Q(dealer__in=self.request.user.seller_profile.dealers.all()))).distinct()
        except:
            queryset=Product.objects.filter((Q(consumer=self.request.user.consumer)|Q(seller=self.request.user.seller_profile))).distinct()
        else:
            queryset=Product.objects.filter((Q(consumer=self.request.user.consumer)))
        return queryset


# for getting other sellers product
class OtherConsumersProductLISTAPIView(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=ProductSerializer
    queryset=Product.objects.all()
    lookup_field='id'
    def list(self, request, id, *args, **kwargs):
        user=User.objects.get(id=id)
        queryset=Product.objects.filter((Q(consumer=user.consumer)|Q(seller=user.seller_profile)| Q(dealer__in=user.seller_profile.dealers.all())) & (Q(is_active=True)) & (Q(selled=False))).distinct()

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class OtherSellersProductLISTAPIView(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=ProductSerializer
    queryset=Product.objects.all()
    lookup_field='id'
    def list(self, request, id, *args, **kwargs):
        seller=SellerProfile.objects.get(id=id)
        queryset=Product.objects.filter((Q(seller=seller)| Q(dealer__in=seller.dealers.all())) & (Q(is_active=True)) & (Q(selled=False))).distinct()
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
class OtherDealersProductLISTAPIView(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=ProductSerializer
    queryset=Product.objects.all()
    lookup_field='id'
    def list(self, request, id, *args, **kwargs):
        dealer=DealerProfile.objects.get(id=id)
        queryset=Product.objects.filter(dealer=dealer, is_active=True, selled=False)

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class DealerProfileListAll(ListAPIView):
    permission_classes=[IsAuthenticated,]
    serializer_class=DealerProfileSerializer
    queryset=DealerProfile.objects.all()
    def get_queryset(self):
        queryset=DealerProfile.objects.filter(seller=self.request.user.seller_profile)
        return queryset

class CategoryWiseProductAPIView(RetrieveAPIView):
    permission_classes = [IsAuthenticated]
    queryset= Category.objects.all()
    serializer_class = ProductSerializer
    lookup_field='id'
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        products=Product.objects.filter(category=instance)
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)
