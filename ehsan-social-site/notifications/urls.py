from django.urls import path
from .views import *

urlpatterns = [
    path('',notificationview),
    path('markread/<int:id>/',NotificationUpdateAPIView.as_view()),
    path('markallread/',MarkAllReadNotification.as_view()),
]
