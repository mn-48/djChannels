# Generated by Django 3.2.6 on 2021-10-11 00:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('metrimony', '0008_auto_20211011_0622'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='expectaion',
            name='with_childern',
        ),
        migrations.AlterField(
            model_name='expectaion',
            name='drinking_havits',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='expectaion',
            name='education',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='expectaion',
            name='profession',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='expectaion',
            name='smoking_habits',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='personal_info',
            name='do_u_drink',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='personal_info',
            name='do_u_smoke',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='personal_info',
            name='have_child',
            field=models.BooleanField(default=False),
        ),
    ]