from django.contrib import admin

# Register your models here.
from .models import Personal_Info, Expectaion, VisaVerification

class MatriBlockListInline(admin.TabularInline):
    model = Personal_Info.block_list.through
class matriBlockedByInline(admin.TabularInline):
    model = Personal_Info.blocked_by.through
class Personal_InfoAdmin(admin.ModelAdmin):
    list_display = ('user','salary', 'age','district','state','residency_country','family_type')
    list_filter = ('user','salary', 'age','district','state','residency_country','family_type')
    search_fields = ('user','salary', 'age','district','state','residency_country','family_type')
    filter_horizontal=('viewed','viewed_by','shortlisted','interested','privary_limit','interested_by','pending_interested_by')
    filter_horizontal= ('block_list','blocked_by')
    inlines = [
        MatriBlockListInline,
        matriBlockedByInline
    ]
class ExpectaionAdmin(admin.ModelAdmin):
    list_display = ('user','min_age', 'min_height','marital_status','residency_country','education','profession')
    list_filter = ('user','min_age', 'min_height','marital_status','residency_country','education','profession')
    search_fields = ('user','min_age', 'min_height','marital_status','residency_country','education','profession')
    
admin.site.register(Personal_Info,Personal_InfoAdmin)
admin.site.register(Expectaion,ExpectaionAdmin)
admin.site.register(VisaVerification)