from django import forms
from django.forms import widgets

from .models import ContractsModel
from hr_employees.models import EmployeeModel
from hr_tags.models import ContractTagModel

STATUS_CHOICES = (
	('draft','Draft'),
	('confirm','Confirm'),
	('cancel','Cancel'),
)

class ContractForm(forms.ModelForm):

	class Meta:
		model = ContractsModel
		fields = '__all__'
		labels = {
			'name':'Enter Name',
			'rank':'Enter Rank',
			'start_date':'Enter Start Date',
			'end_date':'Enter End Date',
			'note':'Note',
			'status':'Status',
			'is_active':'Is Active',
			'create_date':'Create Date',
			'attachment':'Upload Attachment',
			'employee':'Employee',
			'tags':'Tags'
		}
		widgets = {
			'name': widgets.TextInput(attrs={'placeholder':'Your Name','class':'form-control'}),
			'rank': widgets.NumberInput(attrs={'placeholder':'Your Rank','class':'form-control'}),
			'start_date':widgets.DateInput(attrs={'type':'date','class':'form-control'}),
			'end_date':widgets.DateInput(attrs={'type':'date','class':'form-control'}),
			'note':widgets.TextInput(attrs={'placeholder':'Internal Note','class':'form-control'}),
			'status':widgets.Select(choices=STATUS_CHOICES,attrs={'class':'form-control'}),
			'is_active':widgets.CheckboxInput(),
			'create_date':widgets.DateTimeInput(attrs={'type':'datetime-local','class':'form-control'}),
			'attachment':widgets.ClearableFileInput(attrs={'placeholder':'Your Name','class':'form-control'}),
			'employee':widgets.Select(attrs={'class': 'form-control'}),
			'tags':widgets.CheckboxSelectMultiple()
		}

