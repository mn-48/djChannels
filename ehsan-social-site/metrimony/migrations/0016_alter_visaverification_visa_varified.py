# Generated by Django 3.2.6 on 2021-10-22 18:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('metrimony', '0015_auto_20211012_0930'),
    ]

    operations = [
        migrations.AlterField(
            model_name='visaverification',
            name='visa_varified',
            field=models.BooleanField(blank=True, null=True),
        ),
    ]
