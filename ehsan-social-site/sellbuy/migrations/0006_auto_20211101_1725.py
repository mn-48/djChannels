# Generated by Django 3.2.6 on 2021-11-01 11:25

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('user_management', '0005_auto_20211006_1454'),
        ('sellbuy', '0005_auto_20211031_1030'),
    ]

    operations = [
        migrations.CreateModel(
            name='Buyers',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('price', models.DecimalField(decimal_places=2, max_digits=20)),
                ('quantity', models.IntegerField()),
                ('details_address', models.TextField()),
                ('details', models.TextField()),
                ('buy_price', models.FloatField(default=0.0)),
                ('months_used', models.IntegerField()),
                ('selled', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('is_published', models.BooleanField(default=False)),
                ('is_featured', models.BooleanField(default=False)),
                ('is_toprated', models.BooleanField(default=False)),
                ('buyers', models.ManyToManyField(blank=True, related_name='buyed_products', through='sellbuy.Buyers', to=settings.AUTH_USER_MODEL)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='cat_prods', to='sellbuy.category')),
                ('consumer', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='consumer_prods', to='user_management.consumer')),
                ('dealer', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='dealer_prods', to='sellbuy.dealerprofile')),
                ('like', models.ManyToManyField(blank=True, related_name='liked_products', to=settings.AUTH_USER_MODEL)),
                ('seller', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='seller_prods', to='sellbuy.sellerprofile')),
            ],
        ),
        migrations.AddField(
            model_name='buyers',
            name='product',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='buyer', to='sellbuy.product'),
        ),
        migrations.AddField(
            model_name='buyers',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='buyed', to=settings.AUTH_USER_MODEL),
        ),
    ]
