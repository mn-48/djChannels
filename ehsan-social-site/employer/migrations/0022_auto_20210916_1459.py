# Generated by Django 3.2.6 on 2021-09-16 08:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0021_employer_is_hidden'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='is_active',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='jobpost',
            name='is_freezed',
            field=models.BooleanField(default=False),
        ),
    ]
