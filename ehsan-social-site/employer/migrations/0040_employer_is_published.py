# Generated by Django 3.2.6 on 2021-10-28 08:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0039_jobpost_activation_time'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='is_published',
            field=models.BooleanField(default=False),
        ),
    ]