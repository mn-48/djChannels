# Generated by Django 3.2.6 on 2021-08-22 10:58

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('social', '0008_socialupdatehistory_created_at'),
    ]

    operations = [
        migrations.CreateModel(
            name='SocialPhoto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('caption', models.TextField(blank=True, null=True)),
                ('photo', models.ImageField(upload_to='images/Social')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='post_photo', to='social.socialpost')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_photo', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
