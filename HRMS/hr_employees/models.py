from django.db import models
from django.utils import timezone
from hr_jobs.models import JobModel
from hr_tags.models import EmployeeTagModel
# Create your models here.

class EmployeeModel(models.Model):
	class Meta:
		permissions = (
			("view_employeemodel", "Can view employee model"),
		)

	name = models.CharField(verbose_name="Your name",max_length=20)
	age = models.IntegerField(verbose_name="Your age")
	birthday = models.DateField(verbose_name="Birthday",default=timezone.now)
	address = models.CharField(verbose_name="Address",max_length=100)
	email= models.EmailField(verbose_name="Email")
	gender = models.CharField(verbose_name="Gender",default="other",max_length=20)
	is_married = models.BooleanField(verbose_name="Is Married",default=False)
	joining_date = models.DateTimeField(verbose_name="Joining Date",default=timezone.now)
	image = models.ImageField(verbose_name="Image",default=None,upload_to='images')
	job = models.ForeignKey(JobModel, on_delete=models.CASCADE, default=None)
	tags = models.ManyToManyField(EmployeeTagModel)

	def __str__(self):
		return self.name