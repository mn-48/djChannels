# Generated by Django 3.2.6 on 2021-09-19 07:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0024_alter_employer_industry_category'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employer',
            name='industry_category',
        ),
    ]
