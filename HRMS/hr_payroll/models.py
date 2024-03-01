from django.db import models

# Create your models here.
from django.utils import timezone

class PayrollModel(models.Model):
    class Meta:
        permissions=(
            ("view_payrollmodel","Can view payroll model"),
        )
    name = models.CharField(max_length=20, verbose_name='Name')
    salary = models.CharField(max_length=20, verbose_name='Salary')
    bonus = models.TextField(max_length=50, verbose_name='Bonus')  
    mulct = models.CharField(max_length=50, verbose_name='Mulct')
    total = models.CharField(max_length=50,verbose_name='Total')  
    pay_day = models.DateTimeField(verbose_name='Pay Day', default=timezone.now)
    
    def __str__(self):
        return self.name