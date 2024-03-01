from django import forms
from django.forms import widgets
from .models import PayrollModel

class PayRollForm(forms.ModelForm):
    
    class Meta:
        model = PayrollModel
        fields = "__all__"
        labels  = {
            'name':'Enter Name', 
            'salary':'Enter Salary',  
            'bonus':'Enter Bonus', 
            'mulct':'Enter Mulct', 
            'total':'Enter Total', 
            'pay_day':'Enter Pay Day',
        }
        widgets = {
            'name': widgets.TextInput(attrs={'placeholder':'Name','class': 'form-control'}),
            'salary': widgets.TextInput(attrs={'placeholder':'Salary','class': 'form-control'}),
            'bonus': widgets.TextInput(attrs={'placeholder':'Bouns','class': 'form-control'}),
            'mulct': widgets.TextInput(attrs={'placeholder':'Mulct','class': 'form-control'}),
            'total': widgets.TextInput(attrs={'placeholder':'Total','class': 'form-control'}),
            'pay_day': widgets.DateTimeInput(attrs={'type':'datetime-local','class': 'form-control'}),
        }