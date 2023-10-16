from django.urls import path
from django.urls.conf import include
from rest_framework.routers import DefaultRouter

from .Viewsets import *
from .views import *
from .search import *
from .lists import *
from .match import *
from .filter import *

router=DefaultRouter()
router.register(r'employer', EmployerViewSet)

urlpatterns = [
    path('e/',include(router.urls)),
    path('',EmployerListCreate.as_view()),
    path('<int:id>/',EmployerUpdateRetrieveDelete.as_view()),
    path('list/',EmployerList.as_view()),
    path('jobpost/', JobPostCreate.as_view()),
    path('featured/', FeaturedJobPostList.as_view()),
    path('allpost/', AllJobPostList.as_view()),
    path('orgs_jobs/<int:id>/', OrganizationBasedJobs.as_view()),


    path('apply/', ApplicantsCreate.as_view()),


    path('addmoderator/<int:id>/', AddModerator.as_view()),
    path('pendingmodlist/', PendingModeratorOrganizationList.as_view()),
    path('acceptmoderator/<int:id>/', AcceptModeratorRequest.as_view()),
    path('removemoderator/<int:id>/', RemoveModerator.as_view()),
    path('leavefrommoderator/<int:id>/', LeaveFromModerator.as_view()),


    path('applicants/<int:id>/', ApplicantsListAPIView.as_view()),


    path('hideorg/<int:id>/', OrganizationHideAPI.as_view()),
    path('unhideorg/<int:id>/', OrganizationUnHideAPI.as_view()),

    path('freeze/<int:id>/', JobPostFreeze.as_view()),
    path('freezeall/<int:id>/', AllJobPostFreeze.as_view()),

    path('unfreeze/<int:id>/', JobPostUnFreeze.as_view()),
    path('unfreezeall/<int:id>/', AllJobPostUnFreeze.as_view()),


    path('doshortlist/<int:id>/',   MakeShortlistedAPI.as_view()),
    path('unshortlisted/<int:id>/', RemoveFromShortlistedAPI.as_view()),
    path('shortlisted/<int:id>/',   ShortlistedList.as_view()),

    path('dointerviewed/<int:id>/',  MakeInterviewedAPI.as_view()),
    path('uninterviewed/<int:id>/',RemoveFromInterviewedAPI.as_view()),
    path('interviewed/<int:id>/',  InterviewedList.as_view()),

    path('doselected/<int:id>/', MakeSelectededAPI.as_view()),
    path('deselect/<int:id>/',    RemoveFromSelectedAPI.as_view()),
    path('selected/<int:id>/',   SelectedList.as_view()),


    path('reject/<int:id>/', MakeRejectedAPI.as_view()),
    path('rejectlist/<int:id>/', RejectedList.as_view()),
    path('removereject/<int:id>/', RemoveFromRejectedAPI.as_view()),


    path('viewed/<int:id>/', MakeViewedAPI.as_view()),
    path('viewedlist/<int:id>/', ViewedList.as_view()),

    path('jobpost/<int:id>/', JobPostUpdateAPIView.as_view()),
    path('functional_cat/<int:id>/', FunctionalCategoryJobPostAPIView.as_view()),
    path('spsk_cat/<int:id>/', SpecialSkillCategoryJobPostAPIView.as_view()),


    path('orgtype/<int:id>/', OrganizationTypeJobList.as_view()),
    path('indus_category/<int:id>/', IndustryCategoryBasedJobListAPI.as_view()),
    path('local/<int:id>/', LocationBasedJobs.as_view()),


    path('appliedlist/', AppliedJonListOfUser.as_view()),

    path('experiencelist/', ExperienceListAPIView.as_view()),
    path('businesslist/', BusinessListAPIView.as_view()),
    path('benefitslist/', BenefitListAPIView.as_view()),
    path('skillslist/', SkillsListAPIView.as_view()),
    # path('locations/', LocationListAPIView.as_view()),
    path('instituitionlist/', InstituionListAPIView.as_view()),
    path('functional_cat/', FunctionalJobCategoryListAPIView.as_view()),
    path('spsk_cat/', SpecialSkillCategoryListAPIView.as_view()),
    path('org_type/', OrganizationTypeList.as_view()),
    path('industry_cat/', IndustryCategoryList.as_view()),

    path('three_cat/', ThreeCategoryList.as_view()),


    # Match APi
    path('match/', BestMatchedJobs.as_view()),



    # Search APIs
    path('search/', QuerySearchAPI.as_view()),
    
    # Filter APIs
    path('filter_jobs/', FilterJobpost.as_view()),
    path('filter_applicants/<int:id>/', FilterApplicats.as_view()),

]
