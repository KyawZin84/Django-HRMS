# Generated by Django 2.0 on 2023-04-12 08:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('hr_attendance', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='attendancemodel',
            name='intime',
            field=models.CharField(default='9:00', max_length=20, verbose_name='InTime'),
        ),
        migrations.AlterField(
            model_name='attendancemodel',
            name='outtime',
            field=models.CharField(default='5:00', max_length=20, verbose_name='OutTime'),
        ),
    ]
