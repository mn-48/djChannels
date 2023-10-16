from django.db import models
from PIL import Image
from django.contrib.auth.models import User
from social.models import SocialPost,SocialPhoto
class PostComment(models.Model):
    # Basic
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_postcomment')
    text=models.TextField()
    image=models.ImageField(blank=True,null=True,upload_to='images/postcomment')
    post=models.ForeignKey(SocialPost, on_delete=models.CASCADE, related_name="post_comments")
    parent = models.ForeignKey('self', on_delete=models.CASCADE,blank=True, null=True, related_name='selfreplies')
    
    # for  History
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)

    # For reactions :reaction Fields
    likes = models.ManyToManyField(User,related_name='post_comment_likes',blank=True)
    love=models.ManyToManyField(User,related_name='post_comment_loves',blank=True)
    angry=models.ManyToManyField(User,related_name='post_comment_angries',blank=True)
    haha=models.ManyToManyField(User,related_name='post_comment_hahas',blank=True)
    sad=models.ManyToManyField(User,related_name='post_comment_sads',blank=True)
    care=models.ManyToManyField(User,related_name='post_comment_cares',blank=True)
    senti=models.ManyToManyField(User,related_name='post_comment_senties',blank=True)
    wow=models.ManyToManyField(User,related_name='post_comment_wows',blank=True)

    is_active=models.BooleanField(default=True)

    def save(self, *args, **kwargs):
        super(PostComment, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.image.path)
    def __str__(self):
        return str(self.user)+" postID: "+str(self.post.id) +" commentID : "+ str(self.id)

class PostCommentHistory(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='users_post_comment_history')
    postcomment=models.ForeignKey(PostComment, on_delete=models.CASCADE, related_name='history')
    text=models.TextField()
    image=models.ImageField(blank=True,null=True,upload_to='images/postcommenthistory')
    updated_at=models.DateTimeField(auto_now_add=True)
    def save(self, *args, **kwargs):
        super(PostCommentHistory, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.image.path)
    def __str__(self):
        return str(self.user)+" postcommentID: "+str(self.postcomment.id) +" commentID : "+ str(self.id)
class PostPhotoComment(models.Model):
    # Basic
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_photocomment')
    text=models.TextField()
    image=models.ImageField(blank=True,null=True,upload_to='images/photocomment')
    photo=models.ForeignKey(SocialPhoto, on_delete=models.CASCADE, related_name="photo_comments")
    parent = models.ForeignKey('self', on_delete=models.CASCADE,blank=True, null=True, related_name='selfreplies')
    
    # for  History
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)

    # For reactions :reaction Fields
    likes = models.ManyToManyField(User,related_name='photo_comment_likes',blank=True)
    love=models.ManyToManyField(User,related_name='photo_comment_loves',blank=True)
    angry=models.ManyToManyField(User,related_name='photo_comment_angries',blank=True)
    haha=models.ManyToManyField(User,related_name='photo_comment_hahas',blank=True)
    sad=models.ManyToManyField(User,related_name='photo_comment_sads',blank=True)
    care=models.ManyToManyField(User,related_name='photo_comment_cares',blank=True)
    senti=models.ManyToManyField(User,related_name='photo_comment_senties',blank=True)
    wow=models.ManyToManyField(User,related_name='photo_comment_wows',blank=True)

    is_active=models.BooleanField(default=True)

    def save(self, *args, **kwargs):
        super(PostPhotoComment, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.image.path)
    def __str__(self):
        return str(self.user)+" PhotoID: "+str(self.photo.id) +" commentID : "+ str(self.id)


class PostPhotoCommentHistory(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='usr_pst_ph_cmnt_hstry')
    postphotocomment=models.ForeignKey(PostPhotoComment, on_delete=models.CASCADE, related_name='history')
    text=models.TextField()
    image=models.ImageField(blank=True,null=True,upload_to='images/postphotocommenthistory')
    updated_at=models.DateTimeField(auto_now_add=True)
    def save(self, *args, **kwargs):
        super(PostPhotoCommentHistory, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.image.path)
    def __str__(self):         
        return str(self.user)+" postphcommentID: "+str(self.postphotocomment.id) +" commentID : "+ str(self.id)