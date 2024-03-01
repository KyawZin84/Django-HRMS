# Generated by Django 2.0 on 2023-04-12 14:56

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('hr_employees', '0009_auto_20230404_1437'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employeemodel',
            name='birthday',
            field=models.DateField(default=datetime.datetime(2023, 4, 12, 14, 56, 13, 576691, tzinfo=utc), verbose_name='Birthday'),
        ),
        migrations.AlterField(
            model_name='employeemodel',
            name='joining_date',
            field=models.DateTimeField(default=datetime.datetime(2023, 4, 12, 14, 56, 13, 576691, tzinfo=utc), verbose_name='Joining Date'),
        ),
    ]
