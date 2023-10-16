from django.urls import path
from .views import *
urlpatterns = [
    path('add/',FollowAPIView.as_view()),
    path('accept/',AcceptRequest.as_view()),
    path('remove/',UnFollowAPIView.as_view()),
    path('list/',FriendsListAPI.as_view()),
    path('block/',BlockUserAPIView.as_view()),
    path('unblock/',UnblockUserAPIView.as_view()),
]
