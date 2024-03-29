# Generated by Django 2.0 on 2023-04-11 14:52

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='AttendanceModel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateField(default=django.utils.timezone.now, verbose_name='Date')),
                ('day', models.CharField(default='Monday', max_length=50, verbose_name='Status')),
                ('name', models.CharField(max_length=20, verbose_name='Name')),
                ('intime', models.TimeField(verbose_name='InTime')),
                ('outtime', models.TimeField(verbose_name='OutTime')),
                ('status', models.CharField(default='Present', max_length=50, verbose_name='Status')),
                ('reason', models.CharField(max_length=50, verbose_name='Reason')),
            ],
            options={
                'permissions': (('view_attendancemodel', 'Can view attendance model'),),
            },
        ),
    ]
