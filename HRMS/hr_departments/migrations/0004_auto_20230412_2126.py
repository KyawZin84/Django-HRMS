# Generated by Django 2.0 on 2023-04-12 14:56

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('hr_departments', '0003_auto_20230404_1437'),
    ]

    operations = [
        migrations.AlterField(
            model_name='departmentmodel',
            name='create_date',
            field=models.DateTimeField(default=datetime.datetime(2023, 4, 12, 14, 56, 13, 570172, tzinfo=utc), verbose_name='Create Date'),
        ),
        migrations.AlterField(
            model_name='departmentmodel',
            name='meeting_date',
            field=models.DateField(default=datetime.datetime(2023, 4, 12, 14, 56, 13, 570172, tzinfo=utc), verbose_name='Meeting Date'),
        ),
    ]