# Generated by Django 3.2.6 on 2021-08-12 22:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobpost',
            name='is_age',
            field=models.BooleanField(default=1),
            preserve_default=False,
        ),
    ]
