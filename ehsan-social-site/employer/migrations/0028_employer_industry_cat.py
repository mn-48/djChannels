# Generated by Django 3.2.6 on 2021-09-19 07:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('employer', '0027_remove_employer_i'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer',
            name='industry_cat',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='orgs', to='employer.industrycategory'),
        ),
    ]
