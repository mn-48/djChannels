from django.contrib import admin

# Register your models here.
from .models import *


class SocialPhotoInline(admin.TabularInline):
    model=SocialPhoto
class SocialPostAdmin(admin.ModelAdmin):
    # fields = ('user', 'title')
    # exclude = ('user', 'title')
    # readonly_fields = ('slug',)
    list_display = ('user','is_hqa','category','privacy','get_tags','is_active','get_Shared_by')
    list_filter = ('user','is_hqa','category','privacy')
    search_fields = ('user__username', 'post_text', 'tags__username','shared_by__username',)
    filter_horizontal= ('tags','shared_by','love','likes','sad','angry','wow','senti','haha','care')
    list_editable = ('is_active',)
    actions = ('MakePublic',)
    inlines=[
        SocialPhotoInline,
    ]
    def get_tags(self, obj):
        return ", ".join([p.username for p in obj.tags.all()])
    get_tags.short_description = 'Tags'
    def get_Shared_by(self, obj):
        return ", ".join([p.username for p in obj.shared_by.all()])
    get_Shared_by.short_description = 'Shares'
    def MakePublic(self, request, queryset):
        try:
            count = queryset.update(privacy=PrivacyModel.objects.get(name="Public"))
        except:

            count=0
        self.message_user(request, '{} posts updated'.format(count))
    MakePublic.short_description='Change Post Privacy To Public'



admin.site.register([PrivacyModel,Check_in,Feeling,LifeEvent,SubLifeEvent,Activity,Category,SubActivity,Backgroud,GIF,Reactions])
admin.site.register(SocialPost,SocialPostAdmin)
admin.site.register(SocialUpdateHistory)
admin.site.register(SocialPhoto)