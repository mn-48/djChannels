from django.db import models
from django.contrib.auth.models import User
 
class Continent(models.Model):
    name = models.CharField(max_length=100)
    def __str__(self):
        return self.name

class Country(models.Model):
    continent = models.ForeignKey(Continent, on_delete=models.CASCADE, related_name='countries')
    name = models.CharField(max_length=100)
    capital = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return self.name
        
class State(models.Model):
    name = models.CharField(max_length=100)
    country= models.ForeignKey(Country, related_name='states', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class City(models.Model):
    name = models.CharField(max_length=100)
    state= models.ForeignKey(State, related_name='cities', on_delete=models.CASCADE)

    def __str__(self):
        return self.name
# class Location(models.Model):
#     name=models.CharField(max_length=100)
#     created_at=models.DateTimeField(auto_now_add=True)
#     def __str__(self):
#         return self.name

class ExperienceList(models.Model):
    name=models.CharField(max_length=100,blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class BusinessList(models.Model):
    name=models.CharField(max_length=100,blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class BenefitList(models.Model):
    name=models.CharField(max_length=100,blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class SkillsList(models.Model):
    name=models.CharField(max_length=100,blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class InstituionList(models.Model):
    name=models.CharField(max_length=100,blank=True,null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name


class SpecialSkillCategory(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name

class IndustryCategory(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name

class FunctionalJobCategory(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class OrganizationType(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class EducationLevel(models.Model):
    name=models.CharField(max_length=100)
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class DegreeOrExam(models.Model):
    name=models.CharField(max_length=100)
    edu_level=models.ForeignKey(EducationLevel, on_delete=models.CASCADE, related_name='degrees')
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
class MajorIn(models.Model):
    name=models.CharField(max_length=100)
    degree=models.ForeignKey(DegreeOrExam, on_delete=models.CASCADE, related_name='majors')
    created_at=models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name

 
class JobProfile(models.Model):
    user=models.OneToOneField(User,on_delete=models.CASCADE,related_name='jobprofile')
    nationality=models.CharField(max_length=100,blank=True,null=True)
    passport_no=models.CharField(max_length=100,blank=True,null=True)
    passport_issue_date=models.DateField(blank=True,null=True)
    emergency_contact_no=models.CharField(max_length=100,blank=True,null=True)
    alternative_email=models.EmailField(blank=True,null=True)
    portfolio_link=models.URLField(blank=True,null=True)

    career_objective=models.TextField(blank=True, null=True)
    present_salary=models.IntegerField(blank=True,null=True)
    expected_salary=models.IntegerField(blank=True,null=True)
    looking_job_level=models.CharField(max_length=100,blank=True, null=True)
    available_for_job_type=models.CharField(max_length=100,blank=True, null=True)

    job_categories=models.ManyToManyField(FunctionalJobCategory,related_name='categoris',blank=True)
    special_skills=models.ManyToManyField(SpecialSkillCategory,related_name='skills',blank=True)
    job_location= models.ForeignKey(City,on_delete=models.SET_NULL, blank=True, null= True, related_name='locations_profiles')
    country= models.CharField(max_length=100,blank=True,null=True)
    organizations= models.CharField(max_length=100,blank=True,null=True)

    career_summary=models.TextField(blank=True,null=True)
    special_qualifications=models.TextField(blank=True,null=True)
    keywords=models.TextField(blank=True,null=True)
    age=models.IntegerField(blank=True, null=True)
    
    cv_photo=models.ImageField(upload_to='jobs/images',blank=True,null=True)
    cv_upload=models.FileField(upload_to='jobs/cv',blank=True,null=True)





    def __str__(self):
        return str(self.user.username)+"'s Job Profile"


class Disability_information(models.Model):
    jobprofile=models.OneToOneField(JobProfile,on_delete=models.CASCADE, related_name='disability')
    national_disability_id=models.CharField(max_length=100,blank=True,null=True)
    show_on_resume=models.BooleanField(default=False)
    disability_to_see=models.CharField(max_length=100,blank=True,null=True)
    disability_to_hear=models.CharField(max_length=100,blank=True,null=True)
    disability_to_communicate=models.CharField(max_length=100,blank=True,null=True)
    disability_to_concentrade=models.CharField(max_length=100,blank=True,null=True)
    disability_to_remember=models.CharField(max_length=100,blank=True,null=True)
    disability_to_sit_stand_walk_climbStairs=models.CharField(max_length=100,blank=True,null=True)
    disability_to_taking_care=models.CharField(max_length=100,blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Disability:"+str(self.national_disability_id)
class EducationProfile(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='education')
    level_of_edu=models.CharField(max_length=100,blank=True,null=True)
    degree_or_exam=models.CharField(max_length=100,blank=True,null=True)
    major_in=models.CharField(max_length=100,blank=True,null=True)
    institude_name=models.CharField(max_length=100,blank=True,null=True)
    result=models.CharField(max_length=100,blank=True,null=True)
    cgpa=models.FloatField(blank=True,null=True)
    scale=models.IntegerField(blank=True,null=True)
    year_of_passing=models.IntegerField(blank=True,null=True)
    duration=models.CharField(max_length=100,blank=True,null=True)
    achievement=models.CharField(max_length=100,blank=True,null=True)

    def __str__(self):
        return str(self.jobprofile)+"'s Education:"+str(self.level_of_edu)
class Training(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='training')
    title=models.CharField(max_length=100,blank=True,null=True)
    country=models.CharField(max_length=100,blank=True,null=True)
    topic_covered=models.CharField(max_length=100,blank=True,null=True)
    training_year=models.IntegerField(blank=True,null=True)
    institute=models.CharField(max_length=100,blank=True,null=True)
    duration=models.IntegerField(blank=True,null=True)
    location=models.CharField(max_length=100,blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Training:"+str(self.title)

class Professional_certificate(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='pro_certificate')
    certification=models.CharField(max_length=100,blank=True,null=True)
    institute=models.CharField(max_length=100,blank=True,null=True)
    location=models.CharField(max_length=100,blank=True,null=True)
    start_date=models.DateField(blank=True,null=True)
    end_date=models.DateField(blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Professional_certificate:"+str(self.certification)

class Experience(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='experiences')
    company_name=models.CharField(max_length=100,blank=True,null=True)
    company_business=models.CharField(max_length=100,blank=True,null=True)
    designation=models.CharField(max_length=100,blank=True,null=True)
    department=models.CharField(max_length=100,blank=True,null=True)
    Area_of_experience=models.TextField(blank=True,null=True)
    responsibilities=models.TextField(blank=True,null=True)
    company_location=models.CharField(max_length=100,blank=True,null=True)
    start_date=models.DateField(blank=True,null=True)
    end_date=models.DateField(blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Experience:"+str(self.designation)


class Project_Works(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='projects')
    name=models.CharField(max_length=100,blank=True,null=True)
    description=models.TextField(blank=True,null=True)
    tools=models.TextField(blank=True,null=True)
    link=models.URLField(blank=True,null=True)
    contribution=models.CharField(max_length=100,blank=True,null=True)
    is_live=models.CharField(max_length=100,blank=True,null=True)
    learings=models.TextField(blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Project_Works:"+str(self.name)
        
class Skills(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='skills')
    skill_name=models.CharField(max_length=100,blank=True,null=True)
    learned_by=models.CharField(max_length=100,blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Skills:"+str(self.skill_name)

class Reference(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='reference')
    name=models.CharField(max_length=100,blank=True, null=True)
    organization=models.CharField(max_length=100,blank=True, null=True)
    designation=models.CharField(max_length=100,blank=True, null=True)
    relation=models.CharField(max_length=100,blank=True, null=True)
    mobile=models.CharField(max_length=100,blank=True, null=True)
    phone_off=models.CharField(max_length=100,blank=True, null=True)
    phone_res=models.CharField(max_length=100,blank=True, null=True)
    address=models.CharField(max_length=100,blank=True, null=True)
    email=models.EmailField(blank=True,null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Reference:"+str(self.name)

class ArmyExperience(models.Model):
    jobprofile=models.ForeignKey(JobProfile,on_delete=models.CASCADE, related_name='army')
    ba_no=models.CharField(max_length=100, blank=True,null=True)
    ba_num=models.IntegerField(blank=True,null=True)
    ranks=models.CharField(max_length=100, blank=True,null=True)
    types=models.CharField(max_length=100, blank=True,null=True)
    arms=models.CharField(max_length=100, blank=True,null=True)
    trade=models.CharField(max_length=100, blank=True,null=True)
    course=models.CharField(max_length=100, blank=True,null=True)
    date_of_commission=models.DateField(blank=True, null=True)
    date_of_retirement=models.DateField(blank=True, null=True)
    def __str__(self):
        return str(self.jobprofile)+"'s Army:"+str(self.ba_no)