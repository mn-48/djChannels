# Generated by Django 3.2.6 on 2021-10-31 04:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('sellbuy', '0004_auto_20211023_1742'),
    ]

    operations = [
        migrations.AddField(
            model_name='sellerprofile',
            name='is_published',
            field=models.BooleanField(default=False),
        ),
        migrations.CreateModel(
            name='DealerProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company_name', models.CharField(max_length=100)),
                ('company_email', models.EmailField(max_length=254)),
                ('company_website', models.URLField(blank=True, null=True)),
                ('company_phone', models.CharField(max_length=17)),
                ('regional_office_location', models.CharField(max_length=100)),
                ('regional_office_phone', models.CharField(max_length=17)),
                ('region_address', models.CharField(max_length=100)),
                ('dealership_paper', models.ImageField(upload_to='sellbuy/dealers')),
                ('is_active', models.BooleanField(default=True)),
                ('is_varified', models.BooleanField(default=False)),
                ('is_published', models.BooleanField(default=False)),
                ('seller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='dealers', to='sellbuy.sellerprofile')),
            ],
        ),
    ]
