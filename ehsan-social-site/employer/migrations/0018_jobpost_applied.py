# Generated by Django 3.2.6 on 2021-09-07 22:28

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('employer', '0017_alter_applicants_jobprofile'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='applied',
            field=models.ManyToManyField(blank=True, related_name='applied_jobs', to=settings.AUTH_USER_MODEL),
        ),
    ]
