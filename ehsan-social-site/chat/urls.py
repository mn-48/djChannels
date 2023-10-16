from django.urls import path
from .views import *

urlpatterns = [
    path('', chatHome, name="chathome"),
    path('chatwith/<str:username>/', chatView,name='chatwith'),
    path('groupchat/<str:group_name>/', GroupChat,name='groupchat'),
    path('login/', LoginView, name='login'),
    path('groupcreate/', CreateGroupView.as_view(), name='groupcreate'),
    path('memberadd/<int:pk>/', ParticipantsAddView.as_view(), name='memberadd'),
    path('logout/', LogoutView, name='logout'),
]