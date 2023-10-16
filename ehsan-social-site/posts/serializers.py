from rest_framework import serializers
from .models import PostCategory
class PostCategorySerializers(serializers.ModelSerializer):
    class Meta:
        model=PostCategory
        fields='__all__'