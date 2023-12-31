# Generated by Django 3.2.6 on 2021-09-15 13:16

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('employer', '0019_auto_20210908_2232'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='logo',
            field=models.ImageField(blank=True, null=True, upload_to='employer/images'),
        ),
        migrations.AlterField(
            model_name='employer',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employer', to=settings.AUTH_USER_MODEL),
        ),
    ]
