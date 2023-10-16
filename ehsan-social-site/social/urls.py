
from django.urls import path

from .views import *
from .api import *
from .views2 import *
from .list import *
app_name = 'social_post'

urlpatterns = [
    # Get APIS for Static Models
    path('activity/',ActivityListCreate.as_view()),
    path('subactivity/',SubActivityListCreate.as_view()),
    path('background/',BackgroudListCreate.as_view()),
    path('gif/',GIFListCreate.as_view()),
    path('privacys/',PrivacyModelListCreate.as_view()),
    path('location/',Check_inListCreate.as_view()),
    path('feeling/',FeelingListCreate.as_view()),
    path('lifeevent/',LifeEventListCreate.as_view()),
    path('sublifeevent/',SubLifeEventListCreate.as_view()),
    path('category/',CategoryListCreate.as_view()),
    path('reaction/',ReactionsListCreate.as_view()),

    # all in one
    path('socialcategories/',SocialCategoriesList.as_view()),


    # socailpost  related apis
    path('post/',SocialPostCreateListAPIView.as_view()),
    path('post/<int:id>/',SocialPostRetrieveUpdateDestroyAPIView.as_view()),
    path('react/<int:id>/',ReactAddAPIView.as_view()),
    path('posthistory/<int:id>/',UpdateHistoryListAPIView.as_view()),
    
    # post photo related apis
    path('uploadphoto/',PhotoUploadAPI.as_view()),
    path('postphotos/<int:id>/',PhotoLISTAPI.as_view()),
    path('postphoto/<int:id>/',PhotoUpdateRetrieveDestroyAPI.as_view()),

]