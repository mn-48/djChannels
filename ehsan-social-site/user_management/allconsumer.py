from django.views.generic import ListView, DetailView
from django.views.generic.edit import CreateView, UpdateView
from .models import Consumer
from django.shortcuts import render
from django.urls import reverse_lazy, reverse
from braces.views import LoginRequiredMixin, SuperuserRequiredMixin

class ConsumerListView(LoginRequiredMixin, SuperuserRequiredMixin, ListView):
    # model= Consumer.objects.filter(refered_by = 0)
    paginate_by = 100
    model= Consumer #.objects.filter(is_consumer=True).all()
    template_name= 'backend/consumer/consumerlist.html'
    queryset =Consumer.objects.all()
    login_url = '/home/'

class ConsumerDetailView(SuperuserRequiredMixin, DetailView):
    model=Consumer
    template_name= 'backend/consumer/allconsumer.html'
    login_url = '/home/'
class ConsumerCreateView(SuperuserRequiredMixin, CreateView):
    model= Consumer
    template_name = 'backend/consumer/addconsumer.html'
    login_url = '/home/'

class ConsumerUpdateView(LoginRequiredMixin, SuperuserRequiredMixin, UpdateView):
    model= Consumer
    template_name = 'backend/consumer/editconsumer.html'
    # fields ='__all__'
    fields =['phone','first_name','last_name','photo','occupation','date_of_birth','nid_number','gender','religion','father_name','father_occupation','mother_name','mother_occupation','spouse_name','address1','address2','country','bio','blood_group','height','weight','hobby','marital_status','languages','about_tour','about_family_members','designation_and_service_organization','primary_name_and_session','highschool_name_and_session','college_name_and_session','university_name_and_session','psd_name_and_session','others_name_and_session']
    success_url= '/home/consumerlist/' 
    login_url = '/home/'