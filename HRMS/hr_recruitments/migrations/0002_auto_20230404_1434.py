# Generated by Django 2.0 on 2023-04-04 08:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hr_recruitments', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='resumemodel',
            options={'permissions': (('view_resumemodel', 'Can view resume model'),)},
        ),
    ]