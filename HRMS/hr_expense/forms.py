from django import forms
from django.forms import widgets
from .models import ExpenseModel

STATUS_CHOICES =(
    ('Office Supplies', 'Office Supplies'),
    ('Medicine', 'Medicine'),
    ('Food', 'Food'),
    ('Repair','Repair'),
)


class ExpenseForm(forms.ModelForm):
    
    class Meta:
        model = ExpenseModel
        fields = "__all__"
        labels  = {
            'itemname':'Enter ItemName', 
            'quantity':'Enter Quantity',  
            'price':'Enter Price', 
            'amount':'Enter Amount', 
            'date':'Enter Date', 
            'category':'Enter Category',
            'employee':'Enter Employee',
        }
        widgets = {
            'itemname': widgets.TextInput(attrs={'placeholder':'Name','class': 'form-control'}),
            'quantity': widgets.NumberInput(attrs={'placeholder':'Quantity','class': 'form-control'}),
            'price': widgets.TextInput(attrs={'placeholder':'Price','class': 'form-control'}),
            'amount': widgets.TextInput(attrs={'placeholder':'Amount','class': 'form-control'}),
            'date': widgets.DateInput(attrs={'type':'date','class': 'form-control'}),
            'category': widgets.Select(choices=STATUS_CHOICES, attrs={'class': 'form-control'}),
            'employee': widgets.TextInput(attrs={'placeholder':'Employee','class': 'form-control'}),
            }