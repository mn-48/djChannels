from django.contrib import admin
from django.urls import path, include, re_path
from django.views.generic import TemplateView
from rest_framework.authtoken.views import obtain_auth_token
from django.conf import settings
from django.conf.urls.static import static
from .views import MyTokenObtainPairView
from rest_framework_simplejwt.views import (
    TokenRefreshView,
)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/user/',include('userapp.urls')),
    path('api/metrimony/',include('metrimony.urls')),
    path('api/jobs/',include('jobs.urls')),
    path('api/employer/',include('employer.urls')),
    path('api/social/',include('social.urls')),
    path('api/sellbuy/',include('sellbuy.urls')),
    path('api/comment/',include('comment.urls')),
    path('api/posts/',include('posts.urls')),
    path('api/follow/',include('followfollowing.urls')),
    path('api-token-auth/', obtain_auth_token, name="token_login"),
    path('api/token/', MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('notifications/',include('notifications.urls')),
    # path('chat/',include('chatapp.urls')),
    path('chat/',include('chat.urls')),
    path('api/reports/',include('reports.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,
                          document_root=settings.STATIC_ROOT)
    urlpatterns += [
        re_path(r'^.*', TemplateView.as_view(template_name='index.html')),
    ]

if not settings.DEBUG:
    urlpatterns += [
        re_path(r'^.*', TemplateView.as_view(template_name='index.html')),
    ]