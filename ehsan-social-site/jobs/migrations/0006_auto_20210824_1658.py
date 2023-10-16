# Generated by Django 3.2.6 on 2021-08-24 10:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('jobs', '0005_rename_cource_armyexperience_course'),
    ]

    operations = [
        migrations.AlterField(
            model_name='jobprofile',
            name='job_categories',
            field=models.ManyToManyField(blank=True, related_name='categoris', to='jobs.JobCategory'),
        ),
        migrations.AlterField(
            model_name='jobprofile',
            name='special_skills',
            field=models.ManyToManyField(blank=True, related_name='skills', to='jobs.Special_skills'),
        ),
    ]
