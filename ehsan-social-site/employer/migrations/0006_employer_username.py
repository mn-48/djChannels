# Generated by Django 3.2.6 on 2021-09-01 01:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0005_alter_jobpost_is_age'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='username',
            field=models.CharField(default='FahadsWorld', max_length=100, unique=True),
            preserve_default=False,
        ),
    ]