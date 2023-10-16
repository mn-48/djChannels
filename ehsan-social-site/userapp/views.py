from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.exceptions import ValidationError
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated

from django.contrib.auth.models import User

from .exceptions import Conflict
from .helpers import prepare_tokens
from .serializers import UserSerializer

import requests
@api_view(['POST'])
@permission_classes([AllowAny])
def registration(request: Request) -> Response:
    username = request.data.get('username')
    try:
        User.objects.get(username=username)
        raise Conflict(detail='username already exists', code=status.HTTP_409_CONFLICT)
    except User.DoesNotExist:
        user = User()
        user.username = username
        user.set_password(raw_password=request.data.get('password'))
        user.first_name = request.data.get('first_name')
        user.last_name = request.data.get('last_name')
        user.is_active = True
        user.save()
        # api_get=requests.get(f"http://127.0.0.1:8001/home/userdetails/{username}/")
        # datas=api_get.json()
        # print(datas)
    
        consumer=Consumer()
        consumer.user_id = user.id
        consumer.username = user.username
        consumer.is_master = False
        consumer.password = request.data.get('password')
        consumer.left_refer = request.data.get('left_refer')
        consumer.right_refer = request.data.get('right_refer')
        consumer.refered_by = request.data.get('refered_by')
        consumer.save()

        return Response(data={'data': UserSerializer(user).data}, status=status.HTTP_201_CREATED)


@api_view(['POST'])
@permission_classes([AllowAny])
def login(request: Request) -> Response:
    username = request.data.get('username')
    password = request.data.get('password')

    if not username or not password:
        raise ValidationError(detail='username and password if required', code=status.HTTP_400_BAD_REQUEST)
    try:
        user = User.objects.get(username__exact=username)
        if not user.check_password(raw_password=password):
            raise ValidationError(detail='invalid password', code=status.HTTP_400_BAD_REQUEST)
        if not user.is_active:
            raise ValidationError(detail='user is inactive', code=status.HTTP_400_BAD_REQUEST)
        access_token, refresh_token = prepare_tokens(user=user)
        data = {
            "access_token": access_token,
            "refresh_token": refresh_token
        }
        return Response(data=data, status=status.HTTP_201_CREATED)
    except User.DoesNotExist:
        raise ValidationError(detail='user not found', code=status.HTTP_404_NOT_FOUND)


@api_view(['GET'])
@permission_classes([IsAuthenticated])
def token_refresh(request: Request) -> Response:
    if not request.user.is_active:
        raise ValidationError(detail='user is not active', code=status.HTTP_401_UNAUTHORIZED)
    access_token, refresh_token = prepare_tokens(user=request.user)
    data = {
        'access_token': access_token,
        'refresh_token': refresh_token
    }
    return Response(data=data, status=status.HTTP_201_CREATED)
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny
from .serializers import *
from user_management.models import *
class CountryListApiView(ListAPIView):
    queryset=Country.objects.all()
    permission_classes=[AllowAny,]
    serializer_class=CountrySerializers
class CityListApiView(ListAPIView):
    queryset=City.objects.all()
    permission_classes=[AllowAny,]
    serializer_class=CitySerializers
