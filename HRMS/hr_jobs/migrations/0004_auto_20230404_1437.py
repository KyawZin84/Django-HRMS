# Generated by Django 2.0 on 2023-04-04 08:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hr_jobs', '0003_auto_20230330_1616'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='jobmodel',
            options={'permissions': (('view_jobmodel', 'Can View job model'),)},
        ),
    ]
