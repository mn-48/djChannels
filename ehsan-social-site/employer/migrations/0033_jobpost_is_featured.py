# Generated by Django 3.2.6 on 2021-09-21 03:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0032_location'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='is_featured',
            field=models.BooleanField(default=False),
        ),
    ]