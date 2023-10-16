from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from PIL import Image
 
from jobs.models import City, Continent, Country, State

class Consumer(models.Model):
    user = models.OneToOneField(User, blank=True, null=True, on_delete=models.CASCADE,related_name='consumer')

    # contact Information
    phone = models.CharField(null=True,blank=True, max_length=100)
    address1 = models.CharField(max_length=250, null=True)
    address2 = models.CharField(max_length=250, blank=True, null=True)
    country = models.ForeignKey(Country, null=True, blank=True, related_name='country_list', on_delete=models.SET_NULL)
    city = models.ForeignKey(City, null=True, blank=True, related_name='city_list', on_delete=models.SET_NULL)
    
    # Basic Information
    username = models.CharField(max_length=100, null=True, unique=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    first_name = models.CharField(max_length=100, null=True)
    last_name = models.CharField(max_length=100, null=True)
    gender = models.CharField(max_length=150,null=True)
    religion = models.CharField(max_length=150,null=True)
    date_of_birth = models.CharField(max_length=200, null=True, blank=True)
    blood_group = models.CharField(max_length=100, blank=True, null=True)
    bio = models.TextField(blank=True, null=True)
    marital_status = models.CharField(max_length=100, blank=True, null=True)
    nid_number = models.CharField(max_length=150, blank=True, null=True)
    occupation = models.CharField(max_length=150, blank=True, null=True)
    designation_and_service_organization = models.CharField(max_length=100, blank=True, null=True) 
    photo = models.ImageField(blank=True, null=True, upload_to='images/consumer', default='profile.jpg')
    
    # Body Information
    height = models.CharField(max_length=100, blank=True, null=True)
    weight = models.CharField(max_length=100, blank=True, null=True)
    hobby = models.CharField(max_length=100, blank=True, null=True)
    languages = models.CharField(max_length=100, blank=True, null=True)
    about_tour = models.CharField(max_length=100, blank=True, null=True)

    # Education Information
    primary_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    highschool_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    college_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    university_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    psd_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    others_name_and_session = models.CharField(max_length=100, blank=True, null=True)
    
    # Family Information
    about_family_members = models.CharField(max_length=100, blank=True, null=True)
    father_name = models.CharField(max_length=250, blank=True, null=True)
    father_occupation = models.CharField(max_length=250, blank=True, null=True)
    mother_name = models.CharField(max_length=250, blank=True, null=True)
    mother_occupation = models.CharField(max_length=250, blank=True, null=True)
    spouse_name = models.CharField(max_length=250, blank=True, null=True)
    father_name_change = models.BooleanField(default=True, blank=True)
    mother_name_change = models.BooleanField(default=True, blank=True)
    
    # Consumer/customer Information
    rank = models.IntegerField(default=0, blank=True)
    add_seller = models.BooleanField(default=False, blank=True)
    refered_by = models.CharField(max_length=250, blank=False, default=None )
    left_refer = models.CharField(max_length=250, blank=True, null=True)
    right_refer = models.CharField(max_length=250, blank=True, null=True)
    is_late = models.BooleanField(default=False, blank=True)
    is_master = models.CharField(max_length=255, default='false', blank=True)

    can_follow=models.BooleanField(default=True)
    # other information
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True)
    updated_at = models.DateTimeField(auto_now=True, blank=True, null=True)
    completeness=['gender','religion','date_of_birth','blood_group','bio','marital_status','nid_number','occupation','designation_and_service_organization','height','weight','hobby','about_family_members','father_name','father_occupation','mother_name','mother_occupation','spouse_name']
    matrimony=['sur_name','age','profile_photo','photo2','photo3','mother_tongue','diet','do_u_smoke','do_u_drink','have_child','district','state','residency_country','birth_country','grow_up_country','present_address','permanent_address','work_location','employed_by','company','salary','working_from','education','no_of_boy_child_of_your_father','no_of_girl_child_of_your_father','family_type','family_status','eye_color','hair_color','hair_style','complexion','any_disability','body_type','interest','music','read_books','tv_shows','sports_shows','sports','fav_dress_style','fav_color','know_dancing','know_singing','phone','guardians_phone','guardians_type','birth_certificate']
    
    def __str__(self):
        return self.username

    def user_info(self):
        return User.objects.filter(id=self.user_id).first()

    def user_full_name(self):
        user = User.objects.filter(id=self.user_id).first()
        return user.first_name + " " + user.last_name

    def get_count(self):
        count=0
        total=0
        for field in self.completeness:
            total += 1
            try:
                if getattr(self, field) != None and getattr(self, field) != "":
                    count += 1
            except Exception as e:
                print(e)
        for field in self.matrimony:
            total += 1
            try:
                if getattr(self.user.personal_info, field) != None and getattr(self.user.personal_info, field) != "":
                    count += 1
            except Exception as e:
                print(e)
        print(count, total)
        return (count/ total)*100
class ConsumerReferred(models.Model):
    referred_by = models.CharField(max_length=255, null=True)
    user_id = models.IntegerField(null=True)
    left_refer = models.CharField(max_length=255, null=True, blank=True)
    right_refer = models.CharField(max_length=255, null=True, blank=True)
    username = models.CharField(max_length=255, null=True)
    first_name = models.CharField(max_length=255, null=True, blank=True)
    last_name = models.CharField(max_length=255, null=True, blank=True)
    referal_name_left = models.CharField(max_length=255, null=True, blank=True)
    referal_name_right = models.CharField(max_length=255, null=True, blank=True)
    parent_id = models.CharField(max_length=255, null=True, blank=True)

    def __str__(self):
        return self.first_name





