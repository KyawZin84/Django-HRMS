# Generated by Django 2.0 on 2023-03-30 09:46

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('hr_departments', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='departmentmodel',
            name='create_date',
            field=models.DateTimeField(default=datetime.datetime(2023, 3, 30, 9, 46, 54, 430113, tzinfo=utc), verbose_name='Create Date'),
        ),
        migrations.AlterField(
            model_name='departmentmodel',
            name='meeting_date',
            field=models.DateField(default=datetime.datetime(2023, 3, 30, 9, 46, 54, 430113, tzinfo=utc), verbose_name='Meeting Date'),
        ),
    ]
