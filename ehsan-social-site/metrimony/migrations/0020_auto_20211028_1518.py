# Generated by Django 3.2.6 on 2021-10-28 09:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('metrimony', '0019_auto_20211028_1511'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='matriblockedby',
            name='user',
        ),
        migrations.RemoveField(
            model_name='matriblocklist',
            name='user',
        ),
    ]