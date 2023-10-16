from django.contrib import admin
from django.apps import apps
from .models import *
from django.contrib.admin.sites import AlreadyRegistered
class BuyersInline(admin.TabularInline):
    model = Product.buyers.through
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name','category', 'consumer','seller','dealer','quantity','price','is_published')
    list_filter = ('category', 'consumer','seller','dealer',)
    filter_horizontal= ('buyers','like')
    inlines = [
        BuyersInline,
    ]

admin.site.register(Product, ProductAdmin)
app_models = apps.get_app_config('sellbuy').get_models()
for model in app_models:
    try:
        admin.site.register(model)
    except AlreadyRegistered:
        pass