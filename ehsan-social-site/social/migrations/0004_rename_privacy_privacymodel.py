# Generated by Django 3.2.6 on 2021-08-21 11:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('social', '0003_reactions_socialpost'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Privacy',
            new_name='PrivacyModel',
        ),
    ]