# from django.shortcuts import render, redirect, HttpResponse, HttpResponseRedirect
# from django.contrib.auth import authenticate, logout, login , get_user_model
# from django.contrib.auth.models import User, Group, Permission
# from django.contrib.auth.hashers import make_password, check_password
# from django.views.generic import View
# from django.http import JsonResponse
# from django.urls import reverse
# from django.contrib import messages
# from .forms import AddConsumerForm
# from .models import Consumer, Country
# import requests
# from requests.auth import HTTPBasicAuth
# import json
# from django.db.models import Q
# from itertools import chain
# from typing import Iterable
# from django.core.exceptions import ObjectDoesNotExist
#
# class HomeView(View):
#     def get(self, request):
#         if not request.user.username:
#             return redirect(reverse('user:login'))
#
#         user= User.objects.get(pk=request.user.id)
#         if Consumer.objects.filter(user_id=request.user.id).exists():
#
#
#
#
#
#
#             consumer = Consumer.objects.get(user_id=request.user.id)
#             context = {
#                 "title": "Login Form",
#                 'user':user,
#                 'consumer':consumer,
#                 'list':list,
#                 'admin':False
#             }
#
#
#         else:
#             context = {
#                 "title": "Login Form",
#                 'user':user,
#                 'admin':True
#             }
#         return render(request, 'backend/home/dashboard.html', context)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
# class LoginView(View):
#     def get(self, request):
#
#         context = {
#             "title": "Login Form",
#         }
#         return render(request, 'backend/auth/login.html', context)
#
#     def post(self, request):
#
#         username = request.POST['username']
#         password = request.POST['password']
#         user = authenticate(username=username, password=password)
#         if user is None:
#             User = get_user_model()
#             user_queryset = User.objects.all().filter(email__iexact=username)
#             if user_queryset:
#                 username = user_queryset[0].username
#                 user = authenticate(username=username, password=password)
#         if user is not None:
#             login(request, user)
#             return redirect(reverse('user:home'))
#         else:
#             messages.warning(request, 'You username or password does not match')
#             return redirect(reverse('user:login'))
#
# class LogoutView(View):
#     def get(self, request):
#         logout(request)
#         messages.success(request, 'You are logout successful')
#         return redirect(reverse('user:login'))
#
# class RegisterView(View):
#     model = Consumer
#     form_class = AddConsumerForm
#     initial = {'key': 'value'}
#     template_name = 'backend/auth/register.html'
#
#     def get(self, request):
#         form = self.form_class(initial=self.initial)
#         countries = Country.objects.order_by('name').all()
#         context = {'form': form,'countries': countries,}
#         return render(request, self.template_name,context)
#
#     def post(self, request, *args, **kwargs):
#         form = self.form_class(request.POST, request.FILES)
#
#         refered_by = request.POST.get('refered_by')
#
#         if Consumer.objects.filter(Q(left_refer=refered_by) | Q(right_refer=refered_by)).exists():
#
#             if Consumer.objects.filter(refered_by=refered_by).exists():
#                 response = {
#                     'error': 'Already Used! Please, try with another one!',
#                     'custom_error': True,
#                 }
#                 return JsonResponse(response)
#
#             else:
#                 if form.is_valid():
#                     first_name = form.cleaned_data['first_name']
#                     last_name = form.cleaned_data['last_name']
#
#                     user = User(
#                         first_name=first_name,
#                         last_name=last_name,
#                         is_staff=True,
#                     )
#                     user.save()
#
#                     # Update User by username, user email, user password
#                     username = int(user.pk) + 1111111
#                     user_password = 'pass-' + str(username)
#                     user_password_hashed = make_password(user_password)
#                     user.username = username
#                     user.password = user_password_hashed
#                     user.email = str(username) + "@worldehsan.com"
#                     user.save()
#
#                     ############  Create mail user  ##################
#                     mastera_user = 'admin@worldehsan.com'
#                     mastera_password = '123$%^&aS'
#                     slaaf_email = user.email
#                     slaaf_password = 'pass-' + str(username)
#                     slaaf_privileges = ''
#                     url = 'https://mail.worldehsan.com/admin/mail/users/add'
#                     slaaf_data = {'email': slaaf_email, 'password': slaaf_password, 'privileges': slaaf_privileges}
#                     requests.post(url, auth=HTTPBasicAuth(mastera_user, mastera_password), data=slaaf_data)
#                     ############  create mail user  ##################
#
#                     consumer = form.save(commit=False)
#                     consumer.user_id = user.id
#                     consumer.is_master = False
#                     consumer.password = user_password
#                     consumer.left_refer = 'L-' + str(username)
#                     consumer.right_refer = 'R-' + str(username)
#                     consumer.save()
#
#                     login(request, user)
#
#                     # return redirect(reverse('user:home'))
#
#                     response = {
#                         'success': 'Success!'
#                     }
#                     return JsonResponse(response)
#
#                 else:
#                     # return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
#                     return JsonResponse({"error": form.errors}, json_dumps_params={'indent': 2})
#
#         else:
#             response = {
#                 'error':'Invalid Referrence code',
#                 'custom_error':True,
#             }
#             return JsonResponse(response)
#
# class RegisterMasterView(View):
#     model = Consumer
#     form_class = AddConsumerForm
#     initial = {'key': 'value'}
#     template_name = 'backend/auth/register_master.html'
#
#     def get(self, request):
#         form = self.form_class(initial=self.initial)
#         countries = Country.objects.order_by('name').all()
#         context = {'form': form,'countries': countries,}
#         return render(request, self.template_name,context)
#
#     def post(self, request, *args, **kwargs):
#         form = self.form_class(request.POST, request.FILES)
#
#         if form.is_valid():
#             first_name = form.cleaned_data['first_name']
#             last_name = form.cleaned_data['last_name']
#
#             # Create User
#             user = User(
#                 first_name=first_name,
#                 last_name=last_name,
#                 is_staff=True,
#             )
#
#             user.save()
#
#             username = int(user.pk) + 1111111
#             user_password = 'pass-' + str(username)
#             user_password_hashed = make_password(user_password)
#             user.username = username
#             user.password = user_password_hashed
#             user.email = str(username) + "@worldehsan.com"
#             user.save()
#
#             ############  Create mail user  ##################
#
#             mastera_user = 'admin@worldehsan.com'
#             mastera_password = '123$%^&aS'
#             slaaf_email = user.email
#             slaaf_password = 'pass-' + str(username)
#             slaaf_privileges = ''
#             url = 'https://mail.worldehsan.com/admin/mail/users/add'
#             slaaf_data = {'email': slaaf_email, 'password': slaaf_password, 'privileges': slaaf_privileges}
#             requests.post(url, auth=HTTPBasicAuth(mastera_user, mastera_password), data=slaaf_data)
#
#             ############  create mail user  ##################
#
#             consumer = form.save(commit=False)
#             consumer.user_id = user.id
#             consumer.is_master = True
#             consumer.password = user_password
#             consumer.left_refer = 'L-' + str(username)
#             consumer.right_refer = 'R-' + str(username)
#             consumer.save()
#
#             response = {
#                 'user': user.pk,
#                 'success': 'Success!'
#             }
#             return JsonResponse(response)
#
#         else:
#             return JsonResponse({"error": form.errors}, json_dumps_params={'indent': 2})
#
# class MasterConsumerView(View):
#     def get(self, request):
#         consumers = Consumer.objects.filter(is_master=True).all()
#         context = {
#             'master_active': 'active show',
#             'consumers': consumers,
#         }
#         return render(request, 'backend/auth/master_consumers.html', context)
#
# class CheckPhoneView(View):
#     def get(self, request):
#         phone = request.GET.get('phone')
#         consumer = Consumer.objects.filter(phone=phone).first()
#         if consumer:
#             data = {
#                 "status": "error",
#                 "error": "This phone number already taken.",
#             }
#         else:
#             data = {
#                 "status": "valid",
#                 "success": "This phone number accepted.",
#             }
#         return JsonResponse(data)
#
# class ProfileView(View):
#     def get(self,request,username):
#         user = User.objects.filter(username=username).first()
#         if not user or not user.id == request.user.id:
#             return redirect(reverse('frontend:index'))
#         consumer = Consumer.objects.filter(user_id=user.id).first()
#         context = {
#             "user":user,
#             "consumer":consumer,
#         }
#         return render(request,'backend/home/profile.html',context)
#
# class EditProfileView(View):
#     def get(self,request,username):
#         user = User.objects.filter(username=username).first()
#         if not user or not user.id == request.user.id:
#             return redirect(reverse('frontend:index'))
#         consumer = Consumer.objects.filter(user_id=user.id).first()
#         countries = Country.objects.all()
#         context = {
#             "home_active":'active show',
#             "user":user,
#             "consumer":consumer,
#             "countries":countries,
#         }
#         return render(request,'backend/home/edit_profile.html',context)
#
#     def post(self,request,username):
#         address1 = request.POST.get('first_name')
#         if not address1:
#             response = {
#                 'status':'error',
#                 'message':'Address 1 is required'
#             }
#         user = User.objects.filter(username=username).first()
#         consumer = Consumer.objects.filter(user_id=user.pk).first()
#         consumer.occupation = request.POST.get('occupation')
#         consumer.date_of_birth = request.POST.get('date_of_birth')
#         consumer.nid_number = request.POST.get('nid_number')
#         consumer.gender = request.POST.get('gender')
#         consumer.religion = request.POST.get('religion')
#         consumer.spouse_name = request.POST.get('spouse_name')
#         consumer.address1 = request.POST.get('address1')
#         consumer.address2 = request.POST.get('address2')
#         consumer.country_id = request.POST.get('country')
#         consumer.blood_group = request.POST.get('blood_group')
#         consumer.father_occupation = request.POST.get('father_occupation')
#         consumer.mother_occupation = request.POST.get('mother_occupation')
#         consumer.hobby = request.POST.get('hobby')
#         consumer.height = request.POST.get('height')
#         consumer.weight = request.POST.get('weight')
#         consumer.marital_status = request.POST.get('marital_status')
#         consumer.languages = request.POST.get('languages')
#         consumer.about_tour = request.POST.get('about_tour')
#         consumer.about_family_members = request.POST.get('about_family_members')
#         consumer.designation_and_service_organization = request.POST.get('designation_and_service_organization')
#         consumer.primary_name_and_session = request.POST.get('primary_name_and_session')
#         consumer.highschool_name_and_session = request.POST.get('highschool_name_and_session')
#         consumer.college_name_and_session = request.POST.get('college_name_and_session')
#         consumer.university_name_and_session = request.POST.get('university_name_and_session')
#         consumer.psd_name_and_session = request.POST.get('psd_name_and_session')
#         consumer.others_name_and_session = request.POST.get('others_name_and_session')
#         consumer.bio = request.POST.get('bio')
#
#         photo = request.FILES.get('photo')
#         if photo:
#             consumer.photo = photo
#         if consumer.father_name_change == True:
#             if consumer.father_name == request.POST.get('father_name'):
#                 consumer.father_name_change = True
#             else:
#                 consumer.father_name_change = False
#             consumer.father_name = request.POST.get('father_name')
#         if consumer.mother_name_change == True:
#             if consumer.mother_name == request.POST.get('mother_name'):
#                 consumer.mother_name_change = True
#             else:
#                 consumer.mother_name_change = False
#             consumer.mother_name = request.POST.get('mother_name')
#
#         consumer.save()
#         response = {
#             'status':'success',
#             'message':'Your information updated successfully done.'
#         }
#         return JsonResponse(response)
#
#
# class OrderView(View):
#     def get(self, request):
#         user = request.user
#         if user:
#             customer = Customer.objects.filter(user_id=user.id).first()
#             orders = Order.objects.filter(customer_id=customer.id).all()
#             context = {
#                 "customer": customer,
#                 "orders": orders,
#             }
#         else:
#             return redirect(reverse('front_products'))
#         return render(request, 'backend/inventory/customer/order.html', context)
#
# class AddCountryApiView(View):
#     def get(self, request):
#         api_request = requests.get('https://restcountries.eu/rest/v2/all')
#         countries = json.loads(api_request.content)
#         for data in countries:
#             check_country = Country.objects.filter(name=data['name']).first()
#             if check_country:
#                 check_country.name = data['name'],
#                 check_country.topLevelDomain = data['topLevelDomain'],
#                 check_country.alpha2Code = data['alpha2Code'],
#                 check_country.alpha3Code = data['alpha3Code'],
#                 check_country.callingCodes = ''.join(map(str, data['callingCodes'])),
#                 check_country.capital = data['capital'],
#                 check_country.region = data['region'],
#                 check_country.subregion = data['subregion'],
#                 check_country.latlng = data['latlng'],
#                 check_country.demonym = data['demonym'],
#                 check_country.area = data['area'],
#                 check_country.timezones = data['timezones'],
#                 check_country.currencies = data['currencies'],
#                 check_country.languages = data['languages'],
#                 check_country.flag = data['flag'],
#                 check_country.save()
#                 msg = "Country updated successfully done"
#             else:
#                 country = Country(
#                     name=data['name'],
#                     topLevelDomain=data['topLevelDomain'],
#                     alpha2Code=data['alpha2Code'],
#                     alpha3Code=data['alpha3Code'],
#                     callingCodes=''.join(map(str, data['callingCodes'])),
#                     capital=data['capital'],
#                     region=data['region'],
#                     subregion=data['subregion'],
#                     latlng=data['latlng'],
#                     demonym=data['demonym'],
#                     area=data['area'],
#                     timezones=data['timezones'],
#                     currencies=data['currencies'],
#                     languages=data['languages'],
#                     flag=data['flag'],
#                 )
#                 country.save()
#                 msg = "Country added successfully done"
#         return HttpResponse(msg)
#
#
#
#
#
#
#
#
#
