# Generated by Django 3.2.6 on 2021-09-19 07:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0025_remove_employer_industry_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='i',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
