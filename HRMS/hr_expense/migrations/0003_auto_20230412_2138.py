# Generated by Django 2.0 on 2023-04-12 15:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('hr_expense', '0002_auto_20230412_2126'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='expensemodel',
            options={'permissions': (('view_expensemodel', 'Can view expense model'),)},
        ),
    ]
