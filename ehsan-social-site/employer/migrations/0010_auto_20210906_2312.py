# Generated by Django 3.2.6 on 2021-09-06 17:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0009_auto_20210906_2302'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='jobpost',
            name='functional_job_category',
        ),
        migrations.RemoveField(
            model_name='jobpost',
            name='special_skills_job_category',
        ),
    ]