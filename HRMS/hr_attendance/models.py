from django.db import models

# Create your models here.
from django.utils import timezone
from datetime import datetime

class AttendanceModel(models.Model):
    class Meta:
        permissions=(
            ("view_attendancemodel","Can view attendance model"),
        )
    date= models.DateField(verbose_name='Date',default=timezone.now)
    day = models.CharField(max_length=50, default='Monday',verbose_name='Status')
    name = models.CharField(max_length=20, verbose_name='Name')
    intime = models.CharField(max_length=20,verbose_name='InTime',default='9:00')
    outtime = models.CharField(max_length=20,verbose_name='OutTime',default='5:00')
    status = models.CharField(max_length=50, default='Present',verbose_name='Status')
    reason = models.CharField(max_length=50,verbose_name='Reason')

    def __str__(self):
        return self.name