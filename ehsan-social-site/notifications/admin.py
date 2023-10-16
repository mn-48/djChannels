from django.contrib import admin
from .models import *
# Register your models here.
class NotificationAdmin(admin.ModelAdmin):
    list_display=['id','to_user','from_user','is_read']
    list_filter=['to_user','from_user']
admin.site.register(Notification,NotificationAdmin)