# Generated by Django 3.2.6 on 2021-10-10 06:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0038_employer_pending_moderators'),
    ]

    operations = [
        migrations.AddField(
            model_name='jobpost',
            name='activation_time',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
