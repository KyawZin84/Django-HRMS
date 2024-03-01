from django.db import models

# Create your models here.
from django.utils import timezone

class ExpenseModel(models.Model):
    class Meta:
        permissions=(
            ("view_expensemodel","Can view expense model"),
        )
    itemname = models.CharField(max_length=20, verbose_name='ItemName')
    quantity = models.IntegerField(verbose_name='Quantity')
    price = models.CharField(max_length=20,verbose_name='Price')
    amount = models.CharField(max_length=20, verbose_name='Salary')
    date = models.DateField(verbose_name='Date',default=timezone.now)  
    category = models.CharField(max_length=50, default='',verbose_name='Category')
    employee = models.CharField(max_length=50,verbose_name='Employee')

    def __str__(self):
        return self.name