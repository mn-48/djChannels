
from django.urls import path

from .views import *
from .api import *
from .photo import *
app_name = 'userapp'

urlpatterns = [
    path('register/', registration, name='user-registration-api'),
    path('login/', login, name='user-login-api'),
    path('refresh_token/', token_refresh, name='user-token-refresh-api'),
    path('userdetails/',ConsumerDetailAPIView.as_view(),name="userdetails"),
    path('profileupdate/',ProfileUpdateAPI.as_view(),name="profileupdate"),

    path('profilephoto/',ProfilePhotoCreateListAPIView.as_view()),
    path('profilephoto/<int:id>/',ProfilePhotoRetrieveUpdateDestroyAPIView.as_view()),
    path('dp_active/<int:id>/',ProfilePhotoActiveView.as_view()),

    path('coverphoto/',CoverPhotoCreateListAPIView.as_view()),
    path('coverphoto/<int:id>/',CoverPhotoRetrieveUpdateDestroyAPIView.as_view()),
    path('cover_active/<int:id>/',CoverPhotoActiveView.as_view()),

    path('countries/',CountryListApiView.as_view()),
    path('cities/',CityListApiView.as_view()),


    path('ip/',LocationAPIView.as_view()),
]