from django import forms
from django.forms import widgets

from .models import EmployeeModel

GENDER_CHOICES = (
	('male','Male'),
	('female','Female'),
	('other','Other'),
)

class EmployeeForm(forms.ModelForm):

	class Meta:
		model = EmployeeModel
		fields = '__all__'
		labels = {
			'name':'Enter Name',
			'age':'Enter Age',
			'birthday':'Enter Birthday',
			'address':'Enter Address',
			'email':'Enter Email',
			'gender':'Gender',
			'is_married':'Is married',
			'joining_date':'Joining Date',
			'image':'Upload Image',
			'job':'Job',
			'tags': 'Tags'
		}
		widgets = {
			'name': widgets.TextInput(attrs={'placeholder':'Your Name','class':'form-control'}),
			'age': widgets.NumberInput(attrs={'placeholder':'Your Age','class':'form-control'}),
			'birthday':widgets.DateInput(attrs={'type':'date','class':'form-control'}),
			'address':widgets.TextInput(attrs={'placeholder':'Your Address','class':'form-control'}),
			'email':widgets.TextInput(attrs={'placeholder':'Your Email','class':'form-control'}),
			'gender':widgets.Select(choices=GENDER_CHOICES,attrs={'class':'form-control'}),
			'is_married':widgets.CheckboxInput(),
			'joining_date':widgets.DateTimeInput(attrs={'type':'datetime-local','class':'form-control'}),
			'image':widgets.ClearableFileInput(attrs={'class':'form-control'}),
			'job': widgets.Select(attrs={'class': 'form-control'}),
			'tags': widgets.CheckboxSelectMultiple()
		}

