# Generated by Django 3.2.6 on 2021-08-12 22:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('metrimony', '0002_alter_expectaion_min_age'),
    ]

    operations = [
        migrations.AlterField(
            model_name='expectaion',
            name='min_age',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
