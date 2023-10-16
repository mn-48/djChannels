from django.contrib import admin
from .models import *
# Register your models here.
class Project_WorksAdmin(admin.ModelAdmin):
    list_display = ('jobprofile','name', 'description','contribution')
    list_filter =('jobprofile','name', 'description','contribution')
    search_fields = ('jobprofile','name', 'description','contribution')
   
class JobProfileAdmin(admin.ModelAdmin):
    list_display = ('user','nationality', 'expected_salary','looking_job_level','available_for_job_type','job_location')
    list_filter = ('user','nationality', 'expected_salary','looking_job_level','available_for_job_type','job_location')
    search_fields = ('user','nationality', 'expected_salary','looking_job_level','available_for_job_type','job_location')
   
class EducationProfileAdmin(admin.ModelAdmin):
    list_display = ('jobprofile','level_of_edu', 'degree_or_exam','major_in','institude_name','cgpa','year_of_passing')
    list_filter = ('jobprofile','level_of_edu', 'degree_or_exam','major_in','institude_name','cgpa','year_of_passing')
    search_fields = ('jobprofile','level_of_edu', 'degree_or_exam','major_in','institude_name','cgpa','year_of_passing')
   
class TrainingAdmin(admin.ModelAdmin):
    list_display = ('jobprofile','title', 'country','training_year','institute')
    list_filter = ('jobprofile','title', 'country','training_year','institute')
    search_fields = ('jobprofile','title', 'country','training_year','institute')
   
class ExperienceAdmin(admin.ModelAdmin):
    list_display = ('jobprofile','company_name', 'designation','company_location')
    list_filter = ('jobprofile','company_name', 'designation','company_location')
    search_fields = ('jobprofile','company_name', 'designation','company_location')
   
admin.site.register(JobProfile,JobProfileAdmin)
admin.site.register(Experience,ExperienceAdmin)
admin.site.register(EducationProfile,EducationProfileAdmin)
admin.site.register(Skills)
admin.site.register(Disability_information)
admin.site.register(Professional_certificate)
admin.site.register(Project_Works,Project_WorksAdmin)
admin.site.register(Reference)
admin.site.register(Training,TrainingAdmin)
admin.site.register(FunctionalJobCategory)
admin.site.register(SpecialSkillCategory)
admin.site.register([IndustryCategory,OrganizationType,ExperienceList,BusinessList,BenefitList,SkillsList,InstituionList,EducationLevel, DegreeOrExam, MajorIn])
admin.site.register([Continent,Country,State,City])