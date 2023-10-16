from django.contrib import admin
from django.urls import path
from . import views
from . views import MasterConsumerView  #,  EditMasterConsumerView

from .allmaster import MasterListView, MasterUpdateView

from .allconsumer import ConsumerListView, ConsumerUpdateView
from .everyConsumer import (
    EveryConsumerView,
    EveryConsumerMasterView,
    EveryConsumerReference1View,
    EveryConsumerReference2View,
)

app_name='user'

urlpatterns = [
    path('userdashboard/',EveryConsumerView, name='individualRef'),
    path('consumerlist/', ConsumerListView.as_view(), name='consumerlist'), 
    path('consumeredit/<int:pk>/', ConsumerUpdateView.as_view(), name='consumeredit'), 
    path('masterlist/', MasterListView.as_view(), name='masterlist'), 
    path('masteredit/<int:pk>/', MasterUpdateView.as_view(), name='masteredit'), 
    path('consumers/', views.RefView, name = 'consumers'),
    path('dashboard/', views.HomeView.as_view(), name='home'),

    path('abovemaster/', EveryConsumerMasterView, name='abovemaster'),
    path('reference1/', EveryConsumerReference1View, name='reference1'),
    path('reference2/', EveryConsumerReference2View, name='reference2'),

    path('login/', views.LoginView.as_view(), name = 'login'),
    path('register/', views.RegisterView.as_view(), name = 'register'),
    path('register_master/', views.RegisterMasterView.as_view(), name = 'register_master'),
    path('masterconsumers/', MasterConsumerView, name = 'master_consumers'),
    path('consumers/', views.ConsumersView.as_view(), name = 'consumers'), 
    path('check_phone/', views.CheckPhoneView.as_view(), name = 'check_phone'),
    path('logout/', views.LogoutView.as_view(), name = 'logout'),
    path('edit_profile/<username>/', views.EditProfileView.as_view(), name='edit_profile'),
    path('changepass/', views.passchange, name='changepass'), #user role urls
    path('country/add_country_api/', views.AddCountryApiView.as_view(), name='add_country_api'),  
    path('findchild/', views.FindChildView.as_view(), name = 'findchild'),
    path('load_child/', views.LoadChildView.as_view(), name = 'load_child'),
    path('<username>/', views.ProfileView.as_view(), name='profile'),
]


# 127.0.0.1:8000/home/abovemaster/
# 127.0.0.1:8000/home/reference1/
# 127.0.0.1:8000/home/reference2/