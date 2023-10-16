from django.contrib import admin

# Register your models here.
from .models import *

from django.contrib import admin

class FollowersInline(admin.TabularInline):
    model = Friends.followers.through
class FollowingsInline(admin.TabularInline):
    model = Friends.followings.through
class BlockListInline(admin.TabularInline):
    model = Friends.block_list.through
class BlockedByInline(admin.TabularInline):
    model = Friends.blocked_by.through
class ToBeFollowersInline(admin.TabularInline):
    model = Friends.to_be_followers.through
class ToBeFollowingsInline(admin.TabularInline):
    model = Friends.to_be_followings.through



class FriendsAdmin(admin.ModelAdmin):
    filter_horizontal= ('to_be_followers','to_be_followings')
    inlines = [
        FollowersInline,
        FollowingsInline,
        ToBeFollowersInline,
        ToBeFollowingsInline,
        BlockListInline,
        BlockedByInline
    ]
    # exclude = ('user',)

admin.site.register(Friends, FriendsAdmin)
admin.site.register(Followers)
admin.site.register(ToBeFollowers)
admin.site.register(Followings)
admin.site.register(ToBeFollowings)