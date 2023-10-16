from typing import TYPE_CHECKING
from django.db import models

# Create your models here.
class PostCategory(models.Model):
    TYPECHOICE=(
        ('General','General'),
        ('Individual','Individual')
    )
    name=models.CharField(max_length=100)
    type=models.CharField(choices=TYPECHOICE, max_length=100)
    urls=models.CharField(max_length=100, blank=True, null=True)
    def __str__(self):
        return self.name