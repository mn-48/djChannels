from datetime import datetime
from django.contrib.auth.models import User
from django.db import models
from django.db.models.fields import IntegerField
from jobs.models import *



class Employer(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE,related_name='employer')
    moderators=models.ManyToManyField(User, related_name="moderating_org" , blank=True)
    pending_moderators=models.ManyToManyField(User, related_name="pending_moderating_org" , blank=True)
    is_active=models.BooleanField(default=False)
    is_published=models.BooleanField(default=False)
    username=models.CharField(max_length=100, unique=True)

    company_name=models.CharField(max_length=100,blank=True,null=True)
    year_of_establishment=models.CharField(max_length=100,blank=True,null=True)
    company_size=models.CharField(max_length=100,blank=True,null=True)
    company_country=models.CharField(max_length=100,blank=True,null=True)
    company_district=models.CharField(max_length=100,blank=True,null=True)
    company_subdistrict=models.CharField(max_length=100,blank=True,null=True)
    company_address=models.TextField(blank=True,null=True)
    company_website=models.URLField(blank=True,null=True)
    company_email=models.EmailField(blank=True,null=True)
    business_description=models.TextField(blank=True,null=True)

    industry_cat=models.ForeignKey(IndustryCategory, on_delete=models.SET_NULL, blank=True, null=True, related_name='orgs')
    functional_cat=models.ForeignKey(FunctionalJobCategory, on_delete=models.SET_NULL, blank=True, null=True, related_name='fun_orgs')
    industry_type=models.ForeignKey(OrganizationType, on_delete=models.SET_NULL, blank=True, null=True, related_name='orgs_ty')
    
    trade_licence_no=models.IntegerField(blank=True, null=True)
    rl_no=models.IntegerField(blank=True, null=True)

    contact_person_email=models.EmailField(blank=True,null=True)
    contact_person_name=models.CharField(max_length=100,blank=True,null=True)
    contact_person_phone=models.CharField(max_length=100,blank=True,null=True)
    contact_person_designation=models.CharField(max_length=100,blank=True,null=True)
    facility_for_person_with_disability=models.BooleanField(default=False)
    logo=models.ImageField(upload_to='employer/images',blank=True,null=True)
    is_hidden=models.BooleanField(default=False)
    def __str__(self):
        return self.username




class JobPost(models.Model):
    employer=models.ForeignKey(Employer,on_delete=models.CASCADE, related_name='jobposts')
    job_title=models.CharField(max_length=100,blank=True,null=True)
    vacancies=models.IntegerField(blank=True,null=True)
    employment_status=models.CharField(max_length=100,blank=True,null=True)
    deadline=models.DateField(blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True,blank=True,null=True)
    resume_receiveing_option=models.CharField(max_length=100,blank=True,null=True)
    special_instruction=models.TextField(blank=True,null=True)
    photograph_enclosed=models.BooleanField(blank=True,null=True)

    functional_category=models.ForeignKey(FunctionalJobCategory, on_delete=models.SET_NULL, blank=True, null= True, related_name='fcat_posts')
    special_skills_category=models.ForeignKey(SpecialSkillCategory, on_delete=models.SET_NULL, blank=True, null= True, related_name='spskcat_posts')
    industry_category=models.ForeignKey(IndustryCategory, on_delete=models.SET_NULL, blank=True, null=True, related_name='org_post') 
    
    job_location=models.ForeignKey(City,on_delete=models.SET_NULL, blank=True, null= True, related_name='locations_posts')


    job_level=models.CharField(max_length=100,blank=True,null=True)
    job_context=models.TextField(blank=True,null=True)
    job_responsibilities=models.TextField(blank=True,null=True)
    workplace=models.CharField(max_length=100,blank=True,null=True)
    min_salary=models.IntegerField(blank=True,null=True)
    max_salary=models.IntegerField(blank=True,null=True)
    per_policy=models.CharField(max_length=100,blank=True,null=True)
    show_salary=models.BooleanField(blank=True,null=True)
    is_compare=models.BooleanField(blank=True,null=True)
    show_alert=models.BooleanField(blank=True,null=True)
    additional_salary_info=models.TextField(blank=True,null=True)
    compensation_and_benefits=models.TextField(blank=True,null=True)
    lunch_facilities=models.CharField(max_length=100,blank=True,null=True)
    salary_review=models.CharField(max_length=100,blank=True,null=True)
    num_of_fastival_bonous=models.IntegerField(blank=True,null=True)
    other=models.TextField(blank=True,null=True)


    # educational
    degree_level=models.CharField(max_length=100,blank=True,null=True)
    degree_name=models.CharField(max_length=100,blank=True,null=True)
    major_in=models.CharField(max_length=100,blank=True,null=True)
    prefered_educational_institutions=models.TextField(blank=True,null=True)
    other_educational_qualifications=models.TextField(blank=True,null=True)
    training_or_trade_cources=models.TextField(blank=True,null=True)
    professional_certifications=models.TextField(blank=True,null=True)

    # Experience and business area
    experience_required=models.BooleanField(blank=True,null=True)
    min_experience=models.IntegerField(blank=True,null=True)
    max_experience=models.IntegerField(blank=True,null=True)
    fresher_can_apply=models.BooleanField(blank=True,null=True)
    area_of_experience=models.TextField(blank=True,null=True)
    area_of_business=models.TextField(blank=True,null=True)
    skills=models.TextField(blank=True,null=True)
    additional_requirements=models.TextField(blank=True,null=True)

    # personal_info
    gender=models.CharField(max_length=100,blank=True,null=True)
    min_age=models.IntegerField(blank=True,null=True)
    max_age=models.IntegerField(blank=True,null=True)
    person_with_disability_can_apply=models.BooleanField(blank=True,null=True)

    # Company_information showing permission
    company_name_show=models.BooleanField(blank=True,null=True)
    company_address_show=models.BooleanField(blank=True,null=True)
    company_business_show=models.BooleanField(blank=True,null=True)
    which_industry_type_to_show=models.CharField(max_length=100,blank=True,null=True)
    

    # matching fields
    is_age=models.BooleanField(blank=True,null=True)
    is_age_mendatory=models.BooleanField(blank=True,null=True)
    is_gender=models.BooleanField(blank=True,null=True)
    is_gender_mendatory=models.BooleanField(blank=True,null=True)
    is_total_year_experience=models.BooleanField(blank=True,null=True)
    is_experience_mendatory=models.BooleanField(blank=True,null=True)
    is_area_of_experience=models.BooleanField(blank=True,null=True)
    is_skills=models.BooleanField(blank=True,null=True)
    is_location=models.BooleanField(blank=True,null=True)
    is_location_mendatory=models.BooleanField(blank=True,null=True)
    is_salary_range=models.BooleanField(blank=True,null=True)
    is_area_of_business=models.BooleanField(blank=True,null=True)
    is_job_level=models.BooleanField(blank=True,null=True)
    
    # Extra Features for Employer
    cover_letter_required=models.BooleanField(default=False, blank=True,null=True)
    rusume_required=models.BooleanField(default=False, blank=True,null=True)
    cv_required=models.BooleanField(default=False, blank=True,null=True)
    NID_no_required=models.BooleanField(default=False, blank=True,null=True)
    passport_required=models.BooleanField(default=False, blank=True,null=True)
    driving_lisence_no_required=models.BooleanField(default=False, blank=True,null=True)

    applied=models.ManyToManyField(User, related_name='applied_jobs', blank=True)

    is_freezed=models.BooleanField(default=False)
    is_active=models.BooleanField(default=False)
    is_featured=models.BooleanField(default=False)
    is_published=models.BooleanField(default=False)
    activation_time=models.DateTimeField(blank=True, null= True)
    __original_active = None
    def __str__(self):
        return str(self.employer)+" : " + str(self.job_title)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.__original_active = self.is_active

    def save(self, *args, **kwargs):
        if self.is_active != self.__original_active:
            self.activation_time=datetime.now()
        super(JobPost, self).save(*args, **kwargs)
        # self.__original_name = self.name



from jobs.models import JobProfile
from django.core.validators import MinValueValidator

class Applicants(models.Model):
    job=models.ForeignKey(JobPost, on_delete=models.CASCADE, related_name='applicants_list')
    jobprofile=models.ForeignKey(JobProfile, on_delete=models.CASCADE, related_name='applications')


    application_date=models.DateTimeField(auto_now_add=True)

    present_salary=models.PositiveBigIntegerField(default=0)
    expected_salary=models.PositiveBigIntegerField(validators=[MinValueValidator(10)])
    working_experience=IntegerField(default=0)

    cover_letter=models.TextField(blank=True, null= True)
    cv=models.FileField(upload_to='jobspost/cv',blank=True,null=True)
    resume=models.FileField(upload_to='jobspost/resume',blank=True,null=True)
    nid_no=models.CharField(max_length=100,blank=True,null=True)
    passport_no=models.CharField(max_length=100,blank=True,null=True)
    driving_lisence_no=models.CharField(max_length=100,blank=True,null=True)

    shortlisted=models.BooleanField(default=False)
    shortlisted_at=models.DateTimeField(blank=True, null= True)
    
    rejected=models.BooleanField(default=False)
    feedback=models.TextField(blank=True, null= True)

    selected=models.BooleanField(default=False)
    selected_at=models.DateTimeField(blank=True, null= True)

    interviewed=models.BooleanField(default=False)
    interviewed_at=models.DateTimeField(blank=True, null= True)

    viewed=models.BooleanField(default=False)

    def __str__(self):
        return str(self.jobprofile)+" : for  " + str(self.job)
    



