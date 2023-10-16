from django.db import models
from django.contrib.auth.models import User


class Friends(models.Model):
    user=models.OneToOneField(User, on_delete=models.CASCADE, related_name='friends')
    followers=models.ManyToManyField(User,related_name='following',blank=True, through='Followers')
    followings=models.ManyToManyField(User,related_name='follower',blank=True, through='Followings')
    to_be_followings=models.ManyToManyField(User,related_name='to_be_follower',blank=True, through='ToBeFollowings')
    is_private=models.BooleanField(default=False)
    # if Private Profile then
    to_be_followers=models.ManyToManyField(User,related_name='to_be_following',blank=True, through='ToBeFollowers')
    block_list=models.ManyToManyField(User,related_name='blocked_by',blank=True, through='BlockList')
    blocked_by=models.ManyToManyField(User,related_name='block_list',blank=True, through='BlockedBy')

    def __str__(self):
        return str(self.user)

class Followers(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE, related_name="followers_list")
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + "'s Follower: " +str(self.user)
class ToBeFollowers(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + "'s ToBeFollower: " +str(self.user)
class Followings(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE, related_name="followings_list")
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + "'s Following: " +str(self.user)
class ToBeFollowings(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + "'s TOBEFollowing: " +str(self.user)

class BlockList(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + " has Blocked: " +str(self.user)
class BlockedBy(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE)
    friends=models.ForeignKey(Friends, on_delete=models.CASCADE)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.friends) + " has Blocked By: "  +str(self.user)