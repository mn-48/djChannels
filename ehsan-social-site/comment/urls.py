from django.urls import path
from .views import *
urlpatterns = [
    path('postcomments/',PostCommentCreateAPIView.as_view()),
    path('postcomments/<int:id>/',PostCommentLISTAPI.as_view()),
    path('postcomment/<int:id>/',PostCommentRetrieveUpdateDestroyAPIView.as_view()),
    path('reactadd/<int:id>/',PostCommentReactAddAPIView.as_view()),
    path('postcommenthis/<int:id>/',PostCommentUpdateHistoryListAPIView.as_view()),
    
    path('photocomments/',PostPhotoCommentCreateAPIView.as_view()),
    path('photocomments/<int:id>/',PostPhotoCommentLISTAPI.as_view()),
    path('photocomment/<int:id>/',PostPhotoCommentRetrieveUpdateDestroyAPIView.as_view()),
    path('photoreactadd/<int:id>/',PostPhotoCommentReactAddAPIView.as_view()),
    path('photocommenthis/<int:id>/',PostPhotoCommentUpdateHistoryListAPIView.as_view()),

]
