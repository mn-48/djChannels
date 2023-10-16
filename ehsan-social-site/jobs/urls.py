from django.urls import path
from .views import *
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from .models import *

urlpatterns = [
    
    path('jobprocreate/', JobProfileCreateUpdateRetrieveAPIView.as_view()),
    path('disability/', DisabilityProfileAPI.as_view()),

    path('education/',csrf_exempt( EducationProfileAPI.as_view())),
    path('education/<int:id>/',EduProfileDeleteAPIView.as_view()),

    path('training/',csrf_exempt( TrainingAPI.as_view())),
    path('training/<int:id>/',TrainingUpdateAPIView.as_view()),

    path('skills/',csrf_exempt( SkillsAPI.as_view())),
    path('skills/<int:id>/', SkillsUpdateAPI.as_view()),

    path('army/',csrf_exempt( ArmyExperienceAPI.as_view())),
    path('army/<int:id>/', ArmyExperienceUpdateAPI.as_view()),

    path('reference/',csrf_exempt( ReferenceAPI.as_view())),
    path('reference/<int:id>/', ReferenceUpdateAPI.as_view()),

    path('experience/',csrf_exempt( ExperienceAPI.as_view())),
    path('experience/<int:id>/', ExperienceUpdateAPIView.as_view()),

    path('projectworks/',csrf_exempt( Project_WorksAPI.as_view())),
    path('projectworks/<int:id>/', Project_WorksUpdateAPI.as_view()),

    path('pro-certificate/',csrf_exempt( Professional_certificateAPI.as_view())),
    path('pro-certificate/<int:id>/', ProCertificateUpdateAPIView.as_view()),
    
    # path('jobproupdate/<int:id>/',csrf_exempt( JobProfileUpdateAPIView.as_view())),
]
