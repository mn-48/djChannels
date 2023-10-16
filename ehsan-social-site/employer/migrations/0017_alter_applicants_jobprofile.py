# Generated by Django 3.2.6 on 2021-09-07 21:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('jobs', '0006_auto_20210824_1658'),
        ('employer', '0016_alter_applicants_jobprofile'),
    ]

    operations = [
        migrations.AlterField(
            model_name='applicants',
            name='jobprofile',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='applications', to='jobs.jobprofile'),
        ),
    ]
