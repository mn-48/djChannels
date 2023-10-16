from django.contrib import admin
from .models import UserPro,CoverPhoto,ProfilePhoto
# Register your models here.
admin.site.register([UserPro,CoverPhoto,ProfilePhoto])