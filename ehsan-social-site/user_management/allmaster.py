from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView
from .models import Consumer
from django.shortcuts import render, Http404
from django.urls import reverse_lazy, reverse
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from references_calculations.models import EveryOneReference
#======================================================
from braces.views import LoginRequiredMixin, SuperuserRequiredMixin
#===================================================================
class MasterListView(LoginRequiredMixin, SuperuserRequiredMixin, ListView):
    # model= Consumer
    model= EveryOneReference
    # queryset =Consumer.objects.filter(refered_by=0)
    queryset =EveryOneReference.objects.filter(i_Refered_by_total=0).order_by('username')
    queryset =EveryOneReference.objects.filter(consumer__refered_by=0).order_by('username')
    context_object_name= 'masterconsumers'
    template_name= 'backend/master/masterlist.html'
    login_url = '/home/'
    #login_url = 'http://127.0.0.1:8000/'
# def MastersTotConsumerListView(request):
#     masterconsumers= Consumer.objects.filter(refered_by=0)
#     context={
#         'masterconsumers': masterconsumers,

#     }
#     return render(request, 'backend/master/masterlist.html', context)
class MasterDetailView(LoginRequiredMixin, SuperuserRequiredMixin, DetailView):
    model=Consumer
    template_name= 'backend/master/allmaster.html'
    login_url = '/home/'
class MasterCreateView(LoginRequiredMixin, SuperuserRequiredMixin,CreateView):
    model= Consumer
    template_name = 'backend/master/addmaster.html'
    login_url = '/home/'

class MasterUpdateView(LoginRequiredMixin, SuperuserRequiredMixin,UpdateView):
    model= Consumer
    template_name = 'backend/master/editmaster.html'
    # fields ='__all__'
    fields =['phone','first_name','last_name','photo','occupation','date_of_birth','nid_number','gender','religion','father_name','father_occupation','mother_name','mother_occupation','spouse_name','address1','address2','country','bio','blood_group','height','weight','hobby','marital_status','languages','about_tour','about_family_members','designation_and_service_organization','primary_name_and_session','highschool_name_and_session','college_name_and_session','university_name_and_session','psd_name_and_session','others_name_and_session','father_name_change','mother_name_change','rank','add_seller','is_late','is_master']
    success_url= '/home/masterlist/' 
    login_url = '/home/'

    