from django import forms
from django.forms import widgets

from .models import AttendanceModel

Status = (
	('Present','Present'),
	('Absent','Absent'),
	('Half Day','Half Day'),
)

Days = (
	('Monday','Monday'),
	('Tueday','Tueday'),
	('WednesDay','WednesDay'),
	('ThursDay','ThursDay'),
	('FriDay','FriDay'),
	)

class AttendanceForm(forms.ModelForm):

	class Meta:
		model = AttendanceModel
		fields = '__all__'
		labels = {
			'date':'Enter Date',
			'day':'Enter Day',
			'name':'Enter Name',
			'intime':'Enter InTime',
			'outtime':'Enter OutTime',
			'status':'Enter Status',
			'reason':'Enter Reason'
		}

		widgets = {
			'date':widgets.DateInput(attrs={'type':'date','class':'form-control'}),
			'day':widgets.Select(choices=Days,attrs={'class':'form-control'}),
			'name': widgets.TextInput(attrs={'placeholder':'Name','class':'form-control'}),
			'intime':widgets.TextInput(attrs={'class':'form-control'}),
			'outtime':widgets.TextInput(attrs={'class':'form-control'}),
			'status':widgets.Select(choices=Status,attrs={'class':'form-control'}),
			'reason':widgets.TextInput(attrs={'placeholder':'Reason','class':'form-control' }),
		}

