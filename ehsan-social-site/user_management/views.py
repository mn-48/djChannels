# from django.core.paginator import Paginator
from django.shortcuts import (
    render, 
    redirect, 
    Http404, 
    # HttpResponse, 
    # HttpResponseRedirect,
)
from django.contrib.auth import (
    authenticate, 
    logout, 
    login,
    get_user_model,
)
from django.contrib.auth.models import (
    User, 
    # Group, 
    # Permission
)
from django.contrib.auth.hashers import make_password, check_password
from django.views.generic import View
from django.http import JsonResponse
from django.urls import reverse
from django.contrib import messages
# from notice.models import Notice
from .forms import AddConsumerForm, ChangePasswordForm
from .models import (
    Consumer, 
    Country, 
    # ConsumerReferred,
    Consumer
)
import requests
from requests.auth import HTTPBasicAuth
import json
from django.db.models import Q
# from itertools import chain
# from typing import Iterable
# from django.core.exceptions import ObjectDoesNotExist
import pandas as pd  
import random
import string
from .models import Consumer
import uuid

from braces.views import LoginRequiredMixin, SuperuserRequiredMixin
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.contrib.auth.hashers import check_password
from django.contrib.auth.models import User


#change password 
@login_required()
def passchange(request):
    form = ChangePasswordForm()
    # print(request.user.id)
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST)
        if form.is_valid():
            old_pass = form.cleaned_data['old_pass']
            user_id = request.user
            if check_password(old_pass, user_id.password):
                new_pass = form.cleaned_data['new_pass']
                repeat_pass = form.cleaned_data['repert_new_pass']
                if new_pass == repeat_pass:
                    admin_old_password_obj = Consumer.objects.get(user=user_id.id)
                    admin_old_password_obj.password = new_pass
                    admin_old_password_obj.save()
                    user_auth = User.objects.get(id=user_id.id)
                    user_auth.set_password(new_pass)
                    user_auth.save()
                    messages.success(request, 'Your Password Changed successfully! Use New Password to Login!')
                    # return redirect('/home/login/')
                    return redirect('user:login')
                password_match_error = 'New password is not same'
                context = {
                    'form':form,
                    'password_match_error': password_match_error,
                }
                return render(request, 'backend/home/changepassword.html', context)
                
            password_match_error = 'Old password is wrong'
            context = {
                'form':form,
                'password_match_error': password_match_error,
            }
            return render(request, 'backend/home/changepassword.html', context)
        
        context = {
            'form':form,
        }
        
        return render(request, 'backend/home/changepassword.html', context)
    context = {
        'form':form,
    }
    return render(request, 'backend/home/changepassword.html', context)
    




def RefView(request, *args, **kwargs):
    if request.user.is_active and request.user.is_superuser:
        qs = Consumer.objects.all()
        consumers = [{"fName":x.first_name + x.last_name,"User":x.username, "Master":x.refered_by, "Reference1" :x.left_refer, "Reference2":x.right_refer} for x in qs]
        data = {'Consumers':consumers} 
        context = {'Consumers':consumers}
        return render(request, 'backend/auth/consumers.html', context,status=200)
    else:
        raise Http404        

def Pass(request):
    if request.user.is_active:  
        context = {}
        try:
            qs = Consumer.objects.get(username = request.user)
            context = {'ps':qs.password}
        except Consumer.DoesNotExist:
            user = None  
        return render(request, 'backend/home/dashboard.html', context,status=200)


class HomeView(LoginRequiredMixin, SuperuserRequiredMixin, View):
    def get(self, request):
        return render(request, 'backend/home/userdashboard.html')
class LoginView(View):
    def get(self, request):
        context = {
            "title": "Login Form",
        }
        return render(request, 'backend/auth/login.html', context)
    
    
    def post(self, request):
        username = request.POST['username']
        password = request.POST['password']


        clientkey = request.POST['g-recaptcha-response']
        # secretkey = '6LeEEnQbAAAAAIvme5n5NDCx0-DDKKbXw8GLKcQr' # Production robot chech
        secretkey = '6Le6R5MaAAAAAD3S_liPuOPFM77V-pnT1aael2J0' # Local robot chech
        CapData = {
             'secret' : secretkey,
             'response' : clientkey,
         }       
        r = requests.post('https://www.google.com/recaptcha/api/siteverify', data = CapData)
        response = r.json()
        verify = response['success']
        if verify :
            # print('you status is', verify)
            user = authenticate(username=username, password=password)
            if user is None:
                User = get_user_model()
                user_queryset = User.objects.all().filter(email__iexact=username)
                if user_queryset:
                    username = user_queryset[0].username
                    user = authenticate(username=username, password=password)

            if user is not None and user.is_superuser:
                login(request, user)
                return redirect(reverse('user:home'))

            if user is not None and not user.is_superuser:
                login(request, user)
                return redirect(reverse('user:individualRef'))

            else:
                messages.warning(request, 'You username or password does not match') 
                return redirect(reverse('user:login'))
        else:
            messages.warning(request, 'Do the Robot check!') 
            return redirect(reverse('user:login'))

class LogoutView(LoginRequiredMixin, View):
    def get(self, request):
        logout(request)
        messages.success(request, 'Logged Out Successfully')
        return redirect(reverse('user:login'))





class RegisterView(View):
    model = Consumer
    form_class = AddConsumerForm
    initial = {'key': 'value'}
    # template_name = 'backend/auth/register.html'
    template_name = 'backend/auth/reg.html'

    
    str_num = ''
    def get(self, request):
        form = self.form_class(initial=self.initial)
        countries = Country.objects.order_by('name').all()
        # for captcha
        string_length=5
        random = str(uuid.uuid4())
        random = random.upper()
        random = random.replace("-","")
        random = random[0:string_length]
        global str_num
        str_num=str(random)  

        context = {'form': form,'countries': countries, 'img': str_num}
        
        return render(request, self.template_name, context)

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)
        refered_by = request.POST.get('refered_by')
        cap=request.POST.get("captcha")
        if Consumer.objects.filter(Q(left_refer=refered_by) | Q(right_refer=refered_by)).exists():
            if Consumer.objects.filter(refered_by=refered_by).exists():
                response = {
                    'error': 'Already Used! Please, try with another one!',
                    'custom_error': True,
                }
                return JsonResponse(response)
            elif str(cap) != str_num :
                response = {
                    'error': 'Wrong Captcha! Please, try with another one!',
                    'custom_error': True,
                }
                return JsonResponse(response)
                return redirect(reverse('user:login'))

            
            else:
                
                if form.is_valid():
                    first_name = form.cleaned_data['first_name']
                    last_name = form.cleaned_data['last_name']
                    refered_by = form.cleaned_data['refered_by']

                    user = User(
                        first_name=first_name,
                        last_name=last_name,
                        is_staff=True,
                    )
                    user.save()

                    # Update User by username, user email, user password
                    username = int(user.pk) + 1111111
                    # user_password = 'ehsan11-' + str(username)
                    # edited nazmul
                    letters = string.ascii_lowercase
                    result_str = ''.join(random.choice(letters) for i in range(3))+str(random.randint(0,1000)) 
                    user_password = 'ehsan11-' + str(username) + result_str
                    user_password_hashed = make_password(user_password)


                    user.username = username
                    user.password = user_password_hashed
                    user.email = str(username) + "@worldehsan.com"
                    user.save()

                    ############  Create mail user  ##################
                    mastera_user = 'admin@worldehsan.com'
                    mastera_password = '&%$#GFhj675S'
                    slaaf_email = user.email
                    slaaf_password = 'ehsan11-' + str(username)
                    slaaf_privileges = ''
                    url = 'https://mail.worldehsan.com/admin/mail/users/add'
                    slaaf_data = {'email': slaaf_email, 'password': slaaf_password, 'privileges': slaaf_privileges}
                    requests.post(url, auth=HTTPBasicAuth(mastera_user, mastera_password), data=slaaf_data)
                    ############  create mail user  ##################

                    consumer = form.save(commit=False)
                    consumer.user_id = user.id
                    consumer.username = user.username
                    consumer.is_master = False
                    consumer.password = user_password
                    consumer.left_refer = '1-' + str(username)
                    consumer.right_refer = '2-' + str(username)
                    consumer.save()

                    login(request, user)
                    # return redirect(reverse('user:home'))
                    response = {
                        'success': 'All ok. Success!'
                    }
                    return JsonResponse(response)

                else:
                    return JsonResponse({"error": form.errors}, json_dumps_params={'indent': 2})

        else:
            response = {
                'error':'Invalid Referrence code',
                'custom_error':True,
            }
            return JsonResponse(response)

class RegisterMasterView(View):
    model = Consumer
    form_class = AddConsumerForm
    initial = {'key': 'value'}
    template_name = 'backend/auth/register_master.html'

    def get(self, request):
        form = self.form_class(initial=self.initial)
        countries = Country.objects.order_by('name').all()
        context = {'form': form,'countries': countries,'master_active':'active show'}
        return render(request, self.template_name,context)

    def post(self, request, *args, **kwargs):
        form = self.form_class(request.POST, request.FILES)

        if form.is_valid():
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            refered_by = form.cleaned_data['refered_by']

            # Create User
            user = User(
                first_name=first_name,
                last_name=last_name,
                is_staff=True,
            )

            user.save()

            username = int(user.pk) + 1111111
            # user_password = 'ehsan11-' + str(username)
            #user_password = 'ehsan11-' + str(username) + str(random.randint(0,1000))
            letters = string.ascii_lowercase
            result_str = ''.join(random.choice(letters) for i in range(3))
            temp_x = str(username) + str(random.randint(0,1000)) + result_str

            user_password = 'ehsan11-' + temp_x
            user_password_hashed = make_password(user_password)
            user.username = username
            user.password = user_password_hashed
            user.email = str(username) + "@worldehsan.com"
            user.save()

            ############  Create mail user  ##################

            mastera_user = 'admin@worldehsan.com'
            mastera_password = '&%$#GFhj675S'
            slaaf_email = user.email
            slaaf_password = 'ehsan11-' + temp_x
            slaaf_privileges = ''
            url = 'https://mail.worldehsan.com/admin/mail/users/add'
            slaaf_data = {'email': slaaf_email, 'password': slaaf_password, 'privileges': slaaf_privileges}
            requests.post(url, auth=HTTPBasicAuth(mastera_user, mastera_password), data=slaaf_data)

            ############  create mail user  ##################

            consumer = form.save(commit=False)
            consumer.user_id = user.id
            consumer.username = user.username
            consumer.is_master = True
            consumer.password = user_password
            consumer.left_refer = '1-' + str(username)
            consumer.right_refer = '2-' + str(username)
            consumer.save()
            name = request.user
            response = {
                'user': user.pk,
                'success': 'Success!'
            }
            return JsonResponse(response)

        else:
            return JsonResponse({"error": form.errors}, json_dumps_params={'indent': 2})

#=================================
# more update needed
#=================================
def MasterConsumerView(request): 
        context = {}
        if request.user.is_superuser:
            data = Consumer.objects.filter(refered_by=0)
            TotalMaster = data.count()
            context = {'d': data,'totalMaster': TotalMaster} 
        return render(request, "backend/auth/master_consumers.html", context)




class EditMasterConsumerView(LoginRequiredMixin, View):
    def get(self, request, username):
        user = User.objects.filter(username=username).first()
        if not user or not request.user.is_superuser:
            return redirect(reverse('frontend:index'))
        consumer = Consumer.objects.filter(user_id=user.id).first()
        countries = Country.objects.all()
        context = {
            "master_active":'active show',
            "user":user,
            "consumer":consumer,
            "countries":countries,
        }
        return render(request,"backend/auth/editmasterconsumer.html",context)

    def post(self, request, username, *args, **kwargs):
        address1 = request.POST.get('address1')
        if not address1:
            response = {
                'status':'error',
                'message':'Address 1 is required'
            }
        user = User.objects.filter(username=username).first()
        if not user or not request.user.is_superuser:
            return redirect(reverse('frontend:index'))
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.save()
        consumer = Consumer.objects.filter(user_id=user.id).first()
        consumer.first_name = request.POST.get('first_name')
        consumer.last_name = request.POST.get('last_name')
        consumer.phone = request.POST.get('phone')
        consumer.occupation = request.POST.get('occupation')
        consumer.nid_number = request.POST.get('nid_number')
        consumer.gender = request.POST.get('gender')
        consumer.religion = request.POST.get('religion')
        consumer.spouse_name = request.POST.get('spouse_name')
        consumer.address1 = request.POST.get('address1')
        consumer.address2 = request.POST.get('address2')
        consumer.country_id = request.POST.get('country')
        consumer.blood_group = request.POST.get('blood_group')
        # consumer.father_name = request.POST.get('father_name')
        consumer.father_occupation = request.POST.get('father_occupation')
        # consumer.mother_name = request.POST.get('mother_name')
        consumer.mother_occupation = request.POST.get('mother_occupation')
        consumer.hobby = request.POST.get('hobby')
        consumer.height = request.POST.get('height')
        consumer.weight = request.POST.get('weight')
        consumer.marital_status = request.POST.get('marital_status')
        consumer.languages = request.POST.get('languages')
        consumer.about_tour = request.POST.get('about_tour')
        consumer.about_family_members = request.POST.get('about_family_members')
        consumer.designation_and_service_organization = request.POST.get('designation_and_service_organization')
        consumer.primary_name_and_session = request.POST.get('primary_name_and_session')
        consumer.highschool_name_and_session = request.POST.get('highschool_name_and_session')
        consumer.college_name_and_session = request.POST.get('college_name_and_session')
        consumer.university_name_and_session = request.POST.get('university_name_and_session')
        consumer.psd_name_and_session = request.POST.get('psd_name_and_session')
        consumer.others_name_and_session = request.POST.get('others_name_and_session')
        consumer.bio = request.POST.get('bio')

        # debug father_name field
        # print('consumer.father_name_change:', consumer.father_name_change)
        # print('db FN:', type(consumer.father_name), consumer.father_name)
        # print('rq FN:', type(request.POST.get('father_name')), request.POST.get('father_name'))
        # print('consumer.father_name == request.POST.get(father_name):', consumer.father_name == request.POST.get('father_name'))
        
        if consumer.father_name_change == True:
            if (consumer.father_name is None) or (consumer.father_name == '') or (consumer.father_name == 'None'):
                # that means father_name was not set before
                req_father_name = request.POST.get('father_name')
                if (req_father_name is not None) and (req_father_name != '') and (req_father_name != 'None'):
                    # now give the chanch to set the father_name
                    consumer.father_name = req_father_name
                    # and set father_name_change to False
                    # so that later user can not change father_name
                    consumer.father_name_change = False
        
        if consumer.mother_name_change == True:
            if (consumer.mother_name is None) or (consumer.mother_name == '') or (consumer.mother_name == 'None'):
                # that means mother_name was not set before
                req_mother_name = request.POST.get('mother_name')
                if (req_mother_name is not None) and (req_mother_name != '') and (req_mother_name != 'None'):
                    # now give the chanch to set the mother_name
                    consumer.mother_name = req_mother_name
                    # and set mother_name_change to False
                    # so that later user can not change mother_name
                    consumer.mother_name_change = False

        if request.POST.get('date_of_birth'):
            consumer.date_of_birth = request.POST.get('date_of_birth')
        photo = request.FILES.get('photo')
        if photo:
            consumer.photo = photo

        consumer.save()
        response = {
            'status':'success',
            'message':'Consumer information updated successfully done.'
        }
        return JsonResponse(response)

class ConsumersView(LoginRequiredMixin, View):
    def get(self, request):
        context = {
            'master_active':'active show',
        }
        return render(request, 'backend/auth/consumers.html',context)

    def post(self, request):
        search = request.POST.get('search')
        consumers = Consumer.objects.filter(
            Q(phone__icontains=search,is_master=False)|
            Q(username__icontains=search,is_master=False)|
            Q(first_name__icontains=search,is_master=False)|
            Q(last_name__icontains=search,is_master=False)|
            Q(nid_number=search,is_master=False)|
            Q(left_refer=search,is_master=False)|
            Q(right_refer=search,is_master=False)|
            Q(occupation=search,is_master=False)|
            Q(refered_by=search,is_master=False)|
            Q(address1=search,is_master=False)|
            Q(religion=search,is_master=False)
        ).order_by('-id').all()[:10]
        context = {
            'consumers':consumers,
        }
        return render(request,'backend/auth/ajax_data/get_consumers.html',context)

class CheckPhoneView(View):
    def get(self, request):
        phone = request.GET.get('phone')
        consumer = Consumer.objects.filter(phone=phone).first()
        if consumer:
            data = {
                "status": "error",
                "error": "Phone number already taken.",
            }
        else:
            data = {
                "status": "valid",
                "success": "Phone number is accepted.",
            }
        return JsonResponse(data)

class ProfileView(LoginRequiredMixin, View):
    def get(self,request,username):
        user = User.objects.filter(username=username).first()
        if not user or not user.id == request.user.id:
            return redirect(reverse('frontend:index'))
        consumer = Consumer.objects.filter(user_id=user.id).first()
        context = {
            "user":user,
            "consumer":consumer,
        }
        return render(request,'backend/home/profile.html',context)

class EditProfileView(LoginRequiredMixin, View):
    def get(self,request,username):
        user = User.objects.filter(username=username).first()
        if not user or not user.id == request.user.id:
            return redirect(reverse('frontend:index'))
        consumer = Consumer.objects.filter(user_id=user.id).first()
        countries = Country.objects.all()
        context = {
            "home_active":'active show',
            "user":user,
            "consumer":consumer,
            "countries":countries,
        }
        return render(request,'backend/home/edit_profile.html',context)

    def post(self,request,username):
        address1 = request.POST.get('first_name')
        if not address1:
            response = {
                'status':'error',
                'message':'Address 1 is required'
            }
        user = User.objects.filter(username=username).first()
        consumer = Consumer.objects.filter(user_id=user.pk).first()
        consumer.occupation = request.POST.get('occupation')
        consumer.date_of_birth = request.POST.get('date_of_birth')
        consumer.nid_number = request.POST.get('nid_number')
        consumer.gender = request.POST.get('gender')
        consumer.religion = request.POST.get('religion')
        consumer.spouse_name = request.POST.get('spouse_name')
        consumer.address1 = request.POST.get('address1')
        consumer.address2 = request.POST.get('address2')
        consumer.country_id = request.POST.get('country')
        consumer.blood_group = request.POST.get('blood_group')
        consumer.father_occupation = request.POST.get('father_occupation')
        consumer.mother_occupation = request.POST.get('mother_occupation')
        consumer.hobby = request.POST.get('hobby')
        consumer.height = request.POST.get('height')
        consumer.weight = request.POST.get('weight')
        consumer.marital_status = request.POST.get('marital_status')
        consumer.languages = request.POST.get('languages')
        consumer.about_tour = request.POST.get('about_tour')
        consumer.about_family_members = request.POST.get('about_family_members')
        consumer.designation_and_service_organization = request.POST.get('designation_and_service_organization')
        consumer.primary_name_and_session = request.POST.get('primary_name_and_session')
        consumer.highschool_name_and_session = request.POST.get('highschool_name_and_session')
        consumer.college_name_and_session = request.POST.get('college_name_and_session')
        consumer.university_name_and_session = request.POST.get('university_name_and_session')
        consumer.psd_name_and_session = request.POST.get('psd_name_and_session')
        consumer.others_name_and_session = request.POST.get('others_name_and_session')
        consumer.bio = request.POST.get('bio')

        photo = request.FILES.get('photo')
        if photo:
            consumer.photo = photo
        
        # debug father_name field
        # print('consumer.father_name_change:', consumer.father_name_change)
        # print('db FN:', type(consumer.father_name), consumer.father_name)
        # print('rq FN:', type(request.POST.get('father_name')), request.POST.get('father_name'))
        # print('consumer.father_name == request.POST.get(father_name):', consumer.father_name == request.POST.get('father_name'))
        
        if consumer.father_name_change == True:
            if (consumer.father_name is None) or (consumer.father_name == '') or (consumer.father_name == 'None'):
                # that means father_name was not set before
                req_father_name = request.POST.get('father_name')
                if (req_father_name is not None) and (req_father_name != '') and (req_father_name != 'None'):
                    # now give the chanch to set the father_name
                    consumer.father_name = req_father_name
                    # and set father_name_change to False
                    # so that later user can not change father_name
                    consumer.father_name_change = False
        
        if consumer.mother_name_change == True:
            if (consumer.mother_name is None) or (consumer.mother_name == '') or (consumer.mother_name == 'None'):
                # that means mother_name was not set before
                req_mother_name = request.POST.get('mother_name')
                if (req_mother_name is not None) and (req_mother_name != '') and (req_mother_name != 'None'):
                    # now give the chanch to set the mother_name
                    consumer.mother_name = req_mother_name
                    # and set mother_name_change to False
                    # so that later user can not change mother_name
                    consumer.mother_name_change = False
        consumer.save()
        response = {
            'status':'success',
            'message':'Your Information Updated Successfully.'
        }
        return JsonResponse(response)

# class OrderView(LoginRequiredMixin, View):
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
# #

class AddCountryApiView(View):
    pass
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

class FindChildView(LoginRequiredMixin, View):
    def get(self, request):
        context = {
            "title": "Find child",
        }
        return render(request, 'user_management/findchild.html',context)


    def post(self, request):
        pass

class LoadChildView(LoginRequiredMixin, View):
    def get(self, request):

        cin_get = request.GET.get('cin')
        # print(cin_get)

        if Consumer.objects.filter(username=int(cin_get)).exists():
            consumer_data = Consumer.objects.get(username=int(cin_get))
            consumer_id = consumer_data.user_id
            ### get descendant data
            def get_descendants(id, consumer_all=[]):
                consumer = Consumer.objects.get(user_id=id)

                left_refer = consumer.left_refer
                right_refer = consumer.right_refer

                left_true = Consumer.objects.filter(refered_by=left_refer).exists()
                right_true = Consumer.objects.filter(refered_by=right_refer).exists()

                if ((left_true == True) and (right_true == True)):
                    child_left = Consumer.objects.get(refered_by=left_refer)
                    child_right = Consumer.objects.get(refered_by=right_refer)
                    consumer_all.append({
                        'username': child_left.username,
                        'left_refer': child_left.left_refer,
                        'right_refer': child_left.right_refer,
                        'country': child_left.country,
                        'refered_by_left': child_left.refered_by,
                        'refered_by_right': 'no_right',
                        'rank': child_left.rank,
                        'first_name': child_left.first_name,
                        'last_name': child_left.last_name,
                        'refered_by': child_left.refered_by,
                    })
                    consumer_all.append({
                        'username': child_right.username,
                        'left_refer': child_right.left_refer,
                        'right_refer': child_right.right_refer,
                        'country': child_right.country,
                        'refered_by_left': 'no_left',
                        'refered_by_right': child_right.refered_by,
                        'rank': child_right.rank,
                        'first_name': child_right.first_name,
                        'last_name': child_right.last_name,
                        'refered_by': child_right.refered_by,
                    })
                elif ((left_true == True) and (right_true == False)):
                    child_left = Consumer.objects.get(refered_by=left_refer)
                    consumer_all.append({
                        'username': child_left.username,
                        'left_refer': child_left.left_refer,
                        'right_refer': child_left.right_refer,
                        'country': child_left.country,
                        'refered_by_left': child_left.refered_by,
                        'refered_by_right': 'no_right',
                        'rank': child_left.rank,
                        'first_name': child_left.first_name,
                        'last_name': child_left.last_name,
                        'refered_by': child_left.refered_by,
                    })
                elif ((left_true == False) and (right_true == True)):
                    child_right = Consumer.objects.get(refered_by=right_refer)
                    consumer_all.append({
                        'username': child_right.username,
                        'left_refer': child_right.left_refer,
                        'right_refer': child_right.right_refer,
                        'country': child_right.country,
                        'refered_by_left': 'no_left',
                        'refered_by_right': child_right.refered_by,
                        'rank': child_right.rank,
                        'first_name': child_right.first_name,
                        'last_name': child_right.last_name,
                        'refered_by': child_right.refered_by,
                    })
                else:
                    pass

                if ((left_true == True) and (right_true == True)):
                    child_left = Consumer.objects.get(refered_by=left_refer)
                    child_right = Consumer.objects.get(refered_by=right_refer)
                    get_descendants(child_left.user_id)
                    get_descendants(child_right.user_id)
                elif ((left_true == True) and (right_true == False)):
                    child_left = Consumer.objects.get(refered_by=left_refer)
                    get_descendants(child_left.user_id)
                elif ((left_true == False) and (right_true == True)):
                    child_right = Consumer.objects.get(refered_by=right_refer)
                    get_descendants(child_right.user_id)
                else:
                    pass

                return consumer_all

            descendant = get_descendants(consumer_id)
            current_consumer = Consumer.objects.get(user_id=consumer_id)

            left_child = []
            right_child = []

            for child in descendant:
                if child['refered_by_left'] == 'no_left':
                    right_child.append(child)
                else:
                    left_child.append(child)
            context = {
                'consumer': current_consumer,
                'descendants': descendant,
                'left_child': left_child,
                'right_child': right_child,
            }
            return render(request, 'user_management/load_child.html', context)
        else:
            return render(request, 'user_management/load_child_blank.html')

















