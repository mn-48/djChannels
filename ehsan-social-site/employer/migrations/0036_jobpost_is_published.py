# Generated by Django 3.2.6 on 2021-10-03 09:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0035_alter_jobpost_job_location'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='is_published',
            field=models.BooleanField(default=False),
        ),
    ]