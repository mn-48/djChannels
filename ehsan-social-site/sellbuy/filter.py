from rest_framework.response import Response
from rest_framework.views import APIView
from django.db.models import Q
from .models import *
from .serializers import *
from rest_framework.permissions import   IsAuthenticated
import re

# Search API Started
class ProductQuerySearchAPI(APIView):
    permission_classes=(IsAuthenticated,)
    def post(self, request, format=None):
        data=self.request.data
        query=data['query']
        q=(Q(details__icontains=query))|(Q(name__icontains=query))|(Q(category__name__icontains=query))
        queryset=Product.objects.filter(q, is_active=True)
        serializer=ProductSerializer(queryset,many=True)
        return Response(serializer.data)
class FilterProducts(APIView):
    permission_classes=(IsAuthenticated,)
    def post(self, request, format=None):
        data=self.request.data
        queryset=Product.objects.filter(is_active=True)
        try:
            keywords=data['keywords']
            if keywords != "":
                keywords = re.split(',|;|, |,,|,', keywords)
                q=(Q())
                for str in keywords:
                    q1= (Q(name__icontains=str)) | (Q(details__icontains=str)) | (Q(category__name__icontains=str)) | (Q(details_address__icontains=str)) 
                    q= q | q1
                queryset=queryset.filter(q)
        except Exception as e:
            print(e)

        try:
            price_min=data.get('price_min',None)
            price_max=data.get('price_max',None)
            q1 = (Q())
            if price_min:
                q1 &=  (Q(price__gte=price_min))
            if price_max:
                q1 &=  (Q(price__lte=price_max))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        try:
            month_min=data.get('month_min',None)
            month_max=data.get('month_max',None)
            q1 = (Q())
            if month_min:
                q1 &=  (Q(months_used__gte=month_min))
            if month_max:
                q1 &=  (Q(months_used__lte=month_max))
            queryset=queryset.filter(q1)
        except Exception as e:
            print(e)

        serializer=ProductSerializer(queryset,many=True)
        return Response(serializer.data)


from ipware import get_client_ip
import urllib, json
import geoip2.database
class LocationBasedProductAPIView(APIView):
    permission_classes=[IsAuthenticated,]
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

        query= (Q(details_address__icontains=data1["country"])|Q(details_address__icontains=data1["continent"])|Q(details_address__icontains=data1["city"])|Q(details_address__icontains=data1["county"])|Q(details_address__icontains=data1["region"]))
        querset=Product.objects.filter(query)
        serializer=ProductSerializer(querset, many=True)
        
        return Response(serializer.data)
