from django.db import models
from django.contrib.auth.models import User

from PIL import Image
# Create your models here.


class Personal_Info(models.Model):
    # MARITAL_STATUS_CHOICES = (
    #     ('Married', 'Married'),
    #     ('Never Married', 'Never Married'),
    #     ('Divorced', 'Divorced'),
    #     ('Widowed', 'Widowed'),
    #     ('Awaiting Divorces', 'Awaiting Divorces'),

    # )
    GENRE_CHOICES = (
        ('Male', 'MALE'),
        ('Female', 'FEMALE'),
    )
    DIET = (
        ('Vegetarian', 'Vegetarian'),
        ('Non-Vegetarian', 'Non-Vegetarian'),
    )
    BLOOD_GROUP = (
        ('A+', 'A+'),
        ('A-', 'A-'),
        ('AB+', 'AB+'),
        ('AB-', 'AB-'),
        ('B+', 'B+'),
        ('B-', 'B-'),
        ('O+', 'O+'),
        ('O-', 'O-'),

    )
    WORK_FROM = (
        ('Home', 'Home'),
        ('Office', 'Office'),
        ('Remote', 'Remote'),
    )
    FAMILY_TYPE = (
        ('Joint', 'Joint'),
        ('Nuclear', 'Nuclear'),
    )
    FAMILY_STATUS = (
        ('Affluent', 'Affluent'),
        ('Lower Middle Class', 'Lower Middle Class'),
        ('Middle Class', 'Middle Class'),
        ('Higher Middle Class', 'Higher Middle Class'),
        ('Rich', 'Rich'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='personal_info')
    sur_name = models.CharField(max_length=100,blank=True, null=True)
    age=models.CharField(max_length=100,blank=True, null=True)
    profile_photo = models.ImageField(default='default.jpg', upload_to='metrimony/images',blank=True, null=True)
    photo2 = models.ImageField(upload_to='metrimony/images',blank=True, null=True)
    photo3 = models.ImageField(upload_to='metrimony/images',blank=True, null=True)
    mother_tongue = models.CharField(max_length=100,blank=True, null=True)
    diet = models.CharField(max_length=100, choices=DIET,blank=True, null=True)
    do_u_smoke = models.BooleanField(default=False)
    do_u_drink=models.BooleanField(default=False)
    have_child = models.BooleanField(default=False)
    # address Information
    district = models.CharField(max_length=100,blank=True, null=True)
    state = models.CharField(max_length=100,blank=True, null=True)
    residency_country = models.CharField(max_length=100,blank=True, null=True)
    birth_country = models.CharField(max_length=100,blank=True, null=True)
    grow_up_country = models.CharField(max_length=100,blank=True, null=True)
    present_address=models.TextField(blank=True, null=True)
    permanent_address = models.TextField(blank=True, null=True)

    # occupation Information
    work_location = models.CharField(max_length=100,blank=True, null=True)
    employed_by = models.CharField(max_length=100,blank=True, null=True)
    company = models.CharField(max_length=100,blank=True, null=True)
    salary = models.IntegerField(blank=True, null=True)
    working_from = models.CharField(max_length=100, choices=WORK_FROM,blank=True, null=True)
    education=models.TextField(blank=True, null= True)

    no_of_boy_child_of_your_father=models.IntegerField(blank=True, null=True)
    no_of_girl_child_of_your_father=models.IntegerField(blank=True, null=True)
    family_type=models.CharField(max_length=100,choices=FAMILY_TYPE,blank=True, null=True)
    family_status=models.CharField(max_length=100,choices=FAMILY_STATUS,blank=True, null=True)
    
    # body Information
    eye_color = models.CharField(max_length=100,blank=True, null=True)
    hair_color = models.CharField(max_length=100,blank=True, null=True)
    hair_style = models.CharField(max_length=100,blank=True, null=True)
    complexion = models.CharField(max_length=100,blank=True, null=True)
    any_disability = models.CharField(max_length=100,blank=True, null=True)
    body_type = models.CharField(max_length=100,blank=True, null=True)


    # hobbies 
    interest = models.TextField(blank=True, null=True)
    music = models.TextField(blank=True, null=True)
    read_books = models.TextField(blank=True, null=True)
    tv_shows = models.TextField(blank=True, null=True)
    sports_shows = models.TextField(blank=True, null=True)
    sports = models.TextField(blank=True, null=True)
    fav_dress_style = models.TextField(blank=True, null=True)
    fav_color = models.CharField(max_length=100,blank=True, null=True)
    know_dancing=models.CharField(max_length=100,blank=True, null=True)
    know_singing=models.CharField(max_length=100,blank=True, null=True)

    # 
    phone=models.CharField(max_length=17, blank=True, null=True)
    guardians_phone=models.CharField(max_length=17, blank=True, null=True)
    guardians_type=models.CharField(max_length=100, blank=True, null= True)

    privary_limit=models.ManyToManyField(User, blank=True, related_name="matrimony_access")
    viewed=models.ManyToManyField(User, blank=True, related_name="matrimony_viewed_by")
    viewed_by=models.ManyToManyField(User, blank=True, related_name="matrimony_viewed")
    shortlisted=models.ManyToManyField(User, blank=True, related_name="matrimony_shortlisted_by")
    interested=models.ManyToManyField(User, blank=True, related_name="matrimony_interested_by")
    interested_by=models.ManyToManyField(User, blank=True, related_name="matrimony_interested")
    pending_interested_by=models.ManyToManyField(User, blank=True, related_name="pending_matrimony_interested")

    nid_verified= models.BooleanField(default=False)
    passport_no=models.CharField(max_length=100, blank=True, null=True)
    passport_verified= models.BooleanField(default=False)
    birth_certificate=models.ImageField(upload_to='metrimony/birth_certificate',blank=True, null=True)

    block_list=models.ManyToManyField(User,related_name='matri_blocked_by',blank=True, through='MatriBlockList')
    blocked_by=models.ManyToManyField(User,related_name='matri_block_list',blank=True, through='MatriBlockedBy')

    def __str__(self):
        return str(self.user.username) + "'s Matrimony Profile"
    def save(self,*args, **kwargs):
        super(Personal_Info, self).save(*args, **kwargs)
        try:
            img = Image.open(self.profile_photo.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.profile_photo.path)
        except:
            pass
        try:
            img2 = Image.open(self.photo2.path)
            if img2.height > 700 or img2.width > 700:
                output_size = (700, 700)
                img2.thumbnail(output_size)
                img2.save(self.photo2.path)
        except:
            pass
        try:
            img3 = Image.open(self.photo3.path)
            if img3.height > 700 or img3.width > 700:
                output_size = (700, 700)
                img3.thumbnail(output_size)
                img3.save(self.photo3.path)
        except:
            pass
        try:
            img4 = Image.open(self.birth_certificate.path)
            if img4.height > 700 or img4.width > 700:
                output_size = (700, 700)
                img4.thumbnail(output_size)
                img4.save(self.birth_certificate.path)
        except:
            pass
class MatriBlockList(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="m_block_list")
    personal_info=models.ForeignKey(Personal_Info, on_delete=models.CASCADE,related_name="m_blocked_by")

    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    
class MatriBlockedBy(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="ma_blocked_by")
    personal_info=models.ForeignKey(Personal_Info, on_delete=models.CASCADE,related_name="ms_block_list")
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  " has Blocked By: "  +str(self.user)

class VisaVerification(models.Model):
    matrimony=models.OneToOneField(Personal_Info, on_delete=models.CASCADE, related_name='visa')
    visa_no=models.CharField(max_length=100, blank=True, null=True)
    visa_type=models.CharField(max_length=100, blank=True, null=True)
    visa_country=models.CharField(max_length=100, blank=True, null=True)
    expiry_date=models.DateField(blank=True, null=True)
    visa_image=models.ImageField(upload_to='metrimony/visa',blank=True, null=True)
    visa_varified=models.BooleanField(default=False)
    def __str__(self):
        return str(self.matrimony)
    def save(self,*args, **kwargs):
        super(VisaVerification, self).save(*args, **kwargs)
        try:
            img = Image.open(self.visa_image.path)
            if img.height > 700 or img.width > 700:
                output_size = (700, 700)
                img.thumbnail(output_size)
                img.save(self.visa_image.path)
        except:
            pass

class Expectaion(models.Model):
    MARITAL_STATUS_CHOICES = (
        ('Married', 'Married'),
        ('Never Married', 'Never Married'),
        ('Divorced', 'Divorced'),
        ('Widowed', 'Widowed'),
        ('Awaiting Divorces', 'Awaiting Divorces'),

    )
    DIET = (
        ('Vegetarian', 'Vegetarian'),
        ('Non-Vegetarian', 'Non-Vegetarian'),
    )
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='expectationprofile')
    min_age=models.CharField(max_length=100,blank=True,null=True)
    max_age=models.CharField(max_length=100,blank=True,null=True)
    min_height=models.CharField(max_length=100,blank=True,null=True)
    max_height = models.CharField(max_length=100,blank=True,null=True)
    marital_status = models.CharField(max_length=100, choices=MARITAL_STATUS_CHOICES,blank=True,null=True)

    monthly_income_min=models.IntegerField(blank=True, null=True)
    monthly_income_max=models.IntegerField(blank=True, null=True)
    mother_tongue=models.CharField(max_length=100, blank=True, null=True)
    physical_status=models.CharField(max_length=100, blank=True, null=True)

    residency_country = models.CharField(max_length=100,blank=True,null=True)
    religion = models.CharField(max_length=100,blank=True,null=True)
    complexion = models.CharField(max_length=100,blank=True,null=True)
    education = models.TextField(blank=True,null=True)
    profession = models.TextField(blank=True,null=True)
    drinking_havits = models.BooleanField(default=False)
    smoking_habits = models.BooleanField(default=False)
    diet = models.CharField(max_length=100, choices=DIET,blank=True,null=True)
    def __str__(self):
        return str(self.user)+"'s Expectaion:"