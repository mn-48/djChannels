from django.urls import path
from .views import *
urlpatterns = [
    path('message/<str:roomname>/', chatView,name='chat'),
    path('login/', LoginView,name='login'),
    path('logout/', LogoutView,name='logout')
]
