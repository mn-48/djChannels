from django.db import models
from django.contrib.auth.models import User
from django.db.models.base import Model
from django.db.models.fields.related import ManyToManyField
from user_management.models import Consumer
from PIL import Image

class SellerProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="seller_profile")

    trade_license=models.FileField(upload_to='sellbuy/tradelicense',blank=True, null=True)
    electric_bill1=models.FileField(upload_to='sellbuy/electric_bill',blank=True, null=True)
    electric_bill2=models.FileField(upload_to='sellbuy/electric_bill',blank=True, null=True)
    owner_proof=models.FileField(upload_to='sellbuy/owner_proof',blank=True, null=True)
    contract_copy=models.FileField(upload_to='sellbuy/owner_proof',blank=True, null=True)
    shop_address = models.CharField(max_length=100, blank=True, null=True)

    owner_photo=models.ImageField(upload_to='sellbuy/photo',blank=True, null=True)
    owner_nid_photo=models.FileField(upload_to='sellbuy/nid',blank=True, null=True)

    nominee_name=models.CharField(max_length=100, blank=True, null=True)
    nominee_phone=models.CharField(max_length=17, blank=True, null=True)
    nominee_photo=models.ImageField(upload_to='sellbuy/photo',blank=True, null=True)
    nominee_nid_no = models.CharField(max_length=100, blank=True, null=True)
    nominee_nid_photo=models.FileField(upload_to='sellbuy/nid',blank=True, null=True)
    nominee_present_address = models.CharField(max_length=100, blank=True, null=True)
    nominee_permanent_address = models.CharField(max_length=100, blank=True, null=True)

    is_active=models.BooleanField(default=True)
    is_varified=models.BooleanField(default=False)
    is_published=models.BooleanField(default=False)


    def __str__(self):
        return str(self.user)+"'s Seller Profile"


class DealerProfile(models.Model):
    seller=models.ForeignKey(SellerProfile, on_delete=models.CASCADE, related_name="dealers")

    company_name=models.CharField(max_length=100)
    company_email=models.EmailField()
    company_website=models.URLField(blank=True, null= True)
    company_phone=models.CharField(max_length=17)

    regional_office_location = models.CharField(max_length=100)
    regional_office_phone = models.CharField(max_length=17)
    region_address=models.CharField(max_length=100)

    dealership_paper=models.ImageField(upload_to='sellbuy/dealers')

    is_active=models.BooleanField(default=True)
    is_varified=models.BooleanField(default=False)
    is_published=models.BooleanField(default=False)

    def __str__(self):
        return str(self.seller)+"'s Dealer Profile of company: "+str(self.company_name)
class Category(models.Model):
    name=models.CharField(max_length=100)
    def __str__(self):
        return self.name
    
class Product(models.Model):
    category=models.ForeignKey(Category, on_delete=models.CASCADE, related_name='cat_prods')

    consumer=models.ForeignKey(Consumer, on_delete=models.SET_NULL, related_name='consumer_prods', blank=True, null=True)
    seller=models.ForeignKey(SellerProfile, on_delete=models.SET_NULL, related_name='seller_prods', blank=True, null=True)
    dealer=models.ForeignKey(DealerProfile, on_delete=models.SET_NULL, related_name='dealer_prods', blank=True, null=True)


    name=models.CharField(max_length=100)
    price = models.DecimalField(max_digits=20, decimal_places=2)
    quantity = models.IntegerField()
    selled_quantity=models.IntegerField(blank=True, null=True, default=0)
    details_address = models.TextField()
    details = models.TextField()
    buy_price = models.FloatField(default=0.00, blank=True, null= True)
    months_used = models.IntegerField()

    buyers= models.ManyToManyField(User, related_name="buyed_products", blank=True, through="Buyers")
    like= models.ManyToManyField(User, related_name="liked_products", blank=True)

    is_active=models.BooleanField(default=True)
    selled= models.BooleanField(default=False)
    is_published=models.BooleanField(default=False)
    is_featured=models.BooleanField(default=False)
    is_toprated=models.BooleanField(default=False)


    

    def __str__(self):
        return self.name
    

class Buyers(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="buyed")
    product=models.ForeignKey(Product, on_delete=models.CASCADE,related_name="buyer")
    quantity=models.IntegerField(blank=True, null=True)
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)
    def __str__(self):
        return  str(self.user)+" has Buyed: "  +str(self.product)

class Question(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_question')
    product=models.ForeignKey(Product,on_delete=models.CASCADE, related_name='product_question')
    
    question=models.TextField()

    created_at=models.DateTimeField(auto_now_add=True)
    is_active=models.BooleanField(default=True)
    def __str__(self):
        return str(self.id)+ str(self.question)


class Answer(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_answar')
    question=models.ForeignKey(Question,on_delete=models.CASCADE, related_name='answar')
    answer=models.TextField()
    created_at=models.DateTimeField(auto_now_add=True)
    is_active=models.BooleanField(default=True)
    def __str__(self):
        return str(self.id)+ str(self.answer)

class Review(models.Model):
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_shopreview')
    product=models.ForeignKey(Product, on_delete=models.CASCADE, related_name="shop_review")
    
    stars=models.IntegerField(blank=True, null=True)
    review=models.TextField()
    image=models.ImageField(blank=True,null=True,upload_to='sellbuy/review')
    parent = models.ForeignKey('self', on_delete=models.CASCADE,blank=True, null=True, related_name='reviewreplies')

    likes=models.ManyToManyField(User,related_name='user_likes', blank=True)
    dislikes=models.ManyToManyField(User,related_name='user_dislikes',blank=True)
    is_active=models.BooleanField(default=True)
    created_at=models.DateTimeField(auto_now_add=True)
    def save(self,*args, **kwargs):
        super(Review, self).save(*args, **kwargs)
        if self.image:
            img = Image.open(self.image.path)
            if img.height > 500 or img.width > 500:
                output_size = (500, 500)
                img.thumbnail(output_size)
                img.save(self.image.path)
    def __str__(self):
        return str(self.id)+ str(self.review)

class FAQ(models.Model):
    product=models.ForeignKey(Product, on_delete=models.CASCADE, related_name="faqs")
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name="user_faqs")

    question=models.TextField(blank=True, null=True)
    answer=models.TextField(blank=True, null=True)

    created_at= models.DateTimeField(auto_now_add=True)
    is_active=models.BooleanField(default=True)
    def __str__(self):
        return str(self.id)+ str(self.question)
    

class ProductComment(models.Model):
    # Basic
    product=models.ForeignKey(Product, on_delete=models.CASCADE, related_name="product_comments")
    user=models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_productcomment')

    text=models.TextField()


    parent = models.ForeignKey('self', on_delete=models.CASCADE,blank=True, null=True, related_name='selfreplies')
    
    # for  History
    created_at=models.DateTimeField(auto_now_add=True)
    updated_at=models.DateTimeField(blank=True, null=True)

    is_active=models.BooleanField(default=True)
 
    def __str__(self):
        return str(self.id)+ str(self.user)