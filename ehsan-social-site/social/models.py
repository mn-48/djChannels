from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class PrivacyModel(models.Model):
    name=models.CharField(max_length=100,unique=True)
    rank=models.FloatField(blank=True,null=True)
    nameSubtitle=models.CharField(max_length=250, blank=True, null= True)
    icon=models.CharField(max_length=20, blank=True, null= True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Check_in(models.Model):
    name=models.CharField(max_length=100,unique=True)
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Feeling(models.Model):
    name=models.CharField(max_length=100,unique=True)
    emoji=models.ImageField(blank=True, null=True, upload_to='images/emojis')
    icon=models.TextField(blank=True, null= True)
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class LifeEvent(models.Model):
    name=models.CharField(max_length=100,unique=True)
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class SubLifeEvent(models.Model):
    name=models.CharField(max_length=100,unique=True)
    lifeevent=models.ForeignKey(LifeEvent, on_delete=models.CASCADE, related_name='subevent')
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Activity(models.Model):
    name=models.CharField(max_length=100,unique=True)
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Category(models.Model):
    name=models.CharField(max_length=100,unique=True)
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class SubActivity(models.Model):
    name=models.CharField(max_length=100,unique=True)
    activity=models.ForeignKey(Activity, on_delete=models.CASCADE, related_name='subactivity')
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Backgroud(models.Model):
    name=models.CharField(max_length=100,unique=True)
    image=models.ImageField(upload_to='images/backgrounds')
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class GIF(models.Model):
    name=models.CharField(max_length=100,unique=True)
    image=models.ImageField(upload_to='images/gifs')
    rank=models.FloatField(blank=True,null=True)
    class Meta:
        ordering = ['rank']
    def __str__(self):
        return self.name
class Reactions(models.Model):
    name=models.CharField(max_length=100)
    image=models.ImageField(upload_to='images/reacts')
    def __str__(self):
        return self.name
class SocialPost(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE, related_name='users_post' )
    # basic ingo
    post_text=models.TextField(blank=True, null= True)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True,null=True)
    is_hqa=models.BooleanField(default=False)

    # foreign keys
    privacy=models.ForeignKey(PrivacyModel,on_delete=models.SET_NULL,related_name='privacy_post',null=True)
    category=models.ForeignKey(Category,on_delete=models.SET_NULL,related_name='category_post',null=True)
    # Not mendatory Fields
    activity=models.ForeignKey(Activity,on_delete=models.SET_NULL,related_name='activity_post',blank=True, null=True)
    subactivity=models.ForeignKey(SubActivity,on_delete=models.SET_NULL,related_name='subactivity_post',blank=True, null=True)
    check_in=models.ForeignKey(Check_in,on_delete=models.SET_NULL,related_name='location_post',blank=True, null=True)
    feeling=models.ForeignKey(Feeling,on_delete=models.SET_NULL,related_name='feeling_post',blank=True, null=True)
    background=models.ForeignKey(Backgroud,on_delete=models.SET_NULL,related_name='background_post',blank=True, null=True)
    gif=models.ForeignKey(GIF,on_delete=models.SET_NULL,related_name='gif_post',blank=True, null=True)
    lifeevent=models.ForeignKey(LifeEvent,on_delete=models.SET_NULL,related_name='lifeevent_post',blank=True, null=True)
    sublifeevent=models.ForeignKey(SubLifeEvent,on_delete=models.SET_NULL,related_name='sublifeevent_post',blank=True, null=True)

    # tags and others
    tags=models.ManyToManyField(User, related_name='taglist',blank=True)
    shared_by = models.ManyToManyField(User, related_name='shared_post',blank=True)
    # reaction Fields
    likes = models.ManyToManyField(User,related_name='post_likes',blank=True)
    love=models.ManyToManyField(User,related_name='post_loves',blank=True)
    angry=models.ManyToManyField(User,related_name='post_angries',blank=True)
    haha=models.ManyToManyField(User,related_name='post_hahas',blank=True)
    sad=models.ManyToManyField(User,related_name='post_sads',blank=True)
    care=models.ManyToManyField(User,related_name='post_cares',blank=True)
    senti=models.ManyToManyField(User,related_name='post_senties',blank=True)
    wow=models.ManyToManyField(User,related_name='post_wows',blank=True)

    is_active=models.BooleanField(default=True)
    is_draft=models.BooleanField(default=True)

    def __str__(self):
        return str(self.user)+": "+str(self.id)

class SocialUpdateHistory(models.Model):
    post=models.ForeignKey(SocialPost, on_delete=models.CASCADE, related_name='post_history')
    post_text=models.TextField(blank=True, null= True)
    updated_at=models.DateTimeField(auto_now_add=True,blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True,blank=True, null=True)

    is_hqa=models.BooleanField(default=False)
    def __str__(self):
        return str(self.post)+": "+ str(self.id)

class SocialPhoto(models.Model):
    post=models.ForeignKey(SocialPost, on_delete=models.CASCADE, related_name='post_photo')
    caption=models.TextField(blank=True, null= True)
    photo=models.ImageField(upload_to='images/Social')
    created_at=models.DateTimeField(auto_now_add=True)
    user=models.ForeignKey(User,on_delete=models.CASCADE, related_name='user_photo')
    def __str__(self):
        return str(self.user)+": "+ str(self.post)  