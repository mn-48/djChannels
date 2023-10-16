from django.contrib import admin
from .models import *

admin.site.site_header = 'Ehsan Social Site Admin Panel'
admin.site.site_title = 'Admin Panel'
admin.site.index_title = 'Ehsan Social'
class EmployerAdmin(admin.ModelAdmin):
    list_display = ('user','username', 'is_active','contact_person_name','contact_person_phone')
    list_filter = ('is_active', 'year_of_establishment', 'company_size','company_country')
    search_fields = ('company_country', 'user__username', 'industry_category', 'industry_type','company_name')
    filter_horizontal=('moderators','pending_moderators')

    # fields = ('user', 'title')
    # exclude = ('user', 'title')
    # readonly_fields = ('slug',)
    # filter_horizontal= ('subject','class_in')
    # list_editable = ('salary',)
    # list_display_links = ('title',)
    # actions = ('change_salary_3000',)
    # inlines=[
    #     CommentInline,
    #     PostFileInline,
    # ]
    # def change_salary_3000(self, request, queryset):
    #     count = queryset.update(salary=3000.0)
    #     self.message_user(request, '{} posts updated'.format(count))
    # change_salary_3000.short_description='Change Salary'
class JobPostAdmin(admin.ModelAdmin):
    list_display = ('employer','job_title', 'vacancies','deadline','created_at','job_level')
    list_filter = ('employer','job_title', 'vacancies','deadline','created_at','job_level')
    search_fields = ('employer','job_title', 'vacancies','deadline','created_at','job_level')
    filter_horizontal=('applied',)

class ApplicantsAdmin(admin.ModelAdmin):
    list_display = ('jobprofile','job', 'application_date','expected_salary')
    list_filter = ('jobprofile','job', 'application_date','expected_salary')
    search_fields = ('jobprofile','job', 'application_date','expected_salary')

    
admin.site.register(Employer,EmployerAdmin)
admin.site.register(JobPost,JobPostAdmin)
admin.site.register(Applicants,ApplicantsAdmin)
