from django.db import models
from django.db.models.fields.related import ForeignKey
class UserPro(models.Model):
    user_id=models.IntegerField(unique=True)
    username=models.CharField(max_length=200, unique=True,blank=True)
    def __str__(self):
        return self.username
from django.contrib.auth.models import User
class CoverPhoto(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="cover_photos") 
    photo=models.ImageField(blank=True,null=True,upload_to='images/coverPhoto')
    caption=models.TextField(blank=True,null=True)
    tags=models.ManyToManyField(User, related_name='cover_tag')
    location=models.CharField(max_length=100, blank=True, null=True)
    privacy=models.CharField(max_length=100, blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    last_used=models.DateTimeField(blank=True,null=True)
    is_active=models.BooleanField(default=True)
    def __str__(self):
        return str(self.user)+"'s cover photo id: "+str(self.id)

class ProfilePhoto(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="profile_photos")
    photo=models.ImageField(blank=True,null=True,upload_to='images/profilePhoto')
    caption=models.TextField(blank=True,null=True)
    tags=models.ManyToManyField(User, related_name='dp_tag',blank=True)
    location=models.CharField(max_length=100, blank=True, null=True)
    privacy=models.CharField(max_length=100, blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    last_used=models.DateTimeField(blank=True,null=True)
    is_active=models.BooleanField(default=True)
    def __str__(self):
        return str(self.user)+"'s Profile photo id: "+str(self.id)




























































































# class User(AbstractBaseUser, PermissionsMixin):
#     class Gender(models.TextChoices):
#         MALE = 'male', _('male')
#         FEMALE = 'female', _('female')
#         OTHERS = 'others', _('others')

#     verified = models.BooleanField(default=False)
#     profile_pic_url = models.TextField(null=True)
#     address = models.TextField(null=True)
#     gender = models.CharField(max_length=10, choices=Gender.choices, default=Gender.MALE)
#     username = models.CharField(max_length=40, unique=True)
#     email = models.EmailField(_('email address'), null=True, blank=True, )
#     date_joined = models.DateTimeField(auto_now_add=True)
#     first_name = models.CharField(max_length=150)
#     last_name = models.CharField(max_length=150)
#     is_active = models.BooleanField(default=False)
#     is_staff = models.BooleanField(default=False)
#     is_superuser = models.BooleanField(default=False)

#     USERNAME_FIELD = 'username'
#     REQUIRED_FIELDS = ['verified', 'gender', 'user_status', 'is_superuser', 'is_staff', 'is_active', ]
#     objects = UserManager()

#     class Meta:
#         db_table = 'users'
#         verbose_name_plural = 'Users'
#         verbose_name = 'User'
#         ordering = ['-date_joined']
#         default_permissions = ('add', 'change', 'view', )

#     def __str__(self):
#         return self.username