# Generated by Django 3.2.6 on 2021-09-16 08:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0020_auto_20210915_1916'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='is_hidden',
            field=models.BooleanField(default=False),
        ),
    ]
