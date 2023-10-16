from django.urls import path
from .views import *
urlpatterns = [
    path('categories/',PostCategoryList.as_view()),
]
