from django.views.generic import ListView, DetailView
from .models import Consumer
from django.shortcuts import render
from django.urls import reverse_lazy, reverse
from braces.views import LoginRequiredMixin, SuperuserRequiredMixin

class ConsumerListView(LoginRequiredMixin, SuperuserRequiredMixin, ListView):
    # model= Consumer.objects.filter(refered_by = 0)
    model= Consumer #.objects.filter(is_consumer=True).all()
    template_name= 'backend/consumer/consumerlist.html'
    queryset =Consumer.objects.all()
    context_object_name= 'consumers'
    login_url = '/home/'

class ConsumerDetailView(SuperuserRequiredMixin, DetailView):
    model=Consumer
    template_name= 'backend/consumer/allconsumer.html'
    login_url = '/home/'
