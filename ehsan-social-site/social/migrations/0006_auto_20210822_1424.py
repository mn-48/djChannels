# Generated by Django 3.2.6 on 2021-08-22 08:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('social', '0005_auto_20210821_1844'),
    ]

    operations = [
        migrations.AddField(
            model_name='socialpost',
            name='is_active',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='angry',
            field=models.ManyToManyField(blank=True, related_name='post_angries', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='care',
            field=models.ManyToManyField(blank=True, related_name='post_cares', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='haha',
            field=models.ManyToManyField(blank=True, related_name='post_hahas', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='likes',
            field=models.ManyToManyField(blank=True, related_name='post_likes', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='love',
            field=models.ManyToManyField(blank=True, related_name='post_loves', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='sad',
            field=models.ManyToManyField(blank=True, related_name='post_sads', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='senti',
            field=models.ManyToManyField(blank=True, related_name='post_senties', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='shared_by',
            field=models.ManyToManyField(blank=True, related_name='shared_post', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='tags',
            field=models.ManyToManyField(blank=True, related_name='taglist', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='socialpost',
            name='wow',
            field=models.ManyToManyField(blank=True, related_name='post_wows', to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='SocialUpdateHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('post_text', models.TextField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
                ('is_hqa', models.BooleanField(default=False)),
                ('post', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='post_history', to='social.socialpost')),
            ],
        ),
    ]
