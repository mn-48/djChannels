# Generated by Django 3.2.6 on 2021-10-23 11:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sellbuy', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='sellerprofile',
            name='nominee_name',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='sellerprofile',
            name='nominee_phone',
            field=models.CharField(blank=True, max_length=17, null=True),
        ),
    ]