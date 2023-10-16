from django.urls import path
from .views import *
from .match import *
from .operations import *
from .lists import *
from .block import *

urlpatterns = [
    path('',MetrimonyProfile.as_view(),name='metrimony_profile'),
    path('expectation/',ExpectationProfile.as_view(),name='expectation_profile'),

    path('matches/',BestMatchedProfiles.as_view(),name='matches'),

    path('profileviewed/<int:id>/',MatrimonyProfileViewedAPI.as_view(),name='profileviewed'),
    path('interestedadd/<int:id>/',InterestedAddAPI.as_view(),name='interestedadd'),
    path('interestedaccept/<int:id>/',InterestedAcceptAPI.as_view(),name='interestedaccept'),
    path('interestedreject/<int:id>/',InterestedRejectAPI.as_view(),name='interestedreject'),
    path('makeshortlisted/<int:id>/',MakeProfileShortlistedAPI.as_view(),name='makeshortlisted'),


    path('viewedprofiles/',ViewedProfileListAPI.as_view(),name='viewedprofiles'),
    path('viewedbyprofiles/',ViewedByProfileListAPI.as_view(),name='viewedbyprofiles'),
    path('shortlistedprofiles/',ShortlistedProfileListAPI.as_view(),name='shortlistedprofiles'),
    path('interestedprofiles/',InterestedProfileListAPI.as_view(),name='interestedprofiles'),
    path('interestedbyprofiles/',InterestedByProfileListAPI.as_view(),name='interestedbyprofiles'),
    path('pendinginterestedbyprofiles/',PendingInterestedByProfileListAPI.as_view(),name='pendinginterestedbyprofiles'),
    path('opositegenderprofiles/',AllOpositeGenderProfilesList.as_view(),name='opositegenderprofiles'),


    path('blockprofile/',BlockMatriAPIView.as_view(),name='blockprofile'),
    path('unblockprofile/',UnblockMatriAPIView.as_view(),name='blockprofile'),


    
]
