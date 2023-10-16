# Generated by Django 3.2.6 on 2021-10-11 00:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('metrimony', '0007_auto_20211009_1312'),
    ]

    operations = [
        migrations.AddField(
            model_name='expectaion',
            name='annual_income',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='expectaion',
            name='mother_tongue',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='expectaion',
            name='physical_status',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='expectaion',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='expectationprofile', to=settings.AUTH_USER_MODEL),
        ),
    ]
