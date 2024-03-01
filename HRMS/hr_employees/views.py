from django.shortcuts import render,redirect
from .models import EmployeeModel
from .forms import EmployeeForm
from datetime import datetime
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.core.paginator import Paginator
import os
# Create your views here.
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('/hr_employees/show_employee/')
        else:
            return render(request, 'login.html', {'error_message': 'Incorrect username or password.'})
    else:
        return render(request, 'login.html')

def logout_view(request):
    logout(request)
    return redirect('/login')

def permission_view(request):
	return render(request,'permission.html')

def help_view(request):
	return render(request,'help.html')

def search_by(request):
	search = request.GET.get('search')
	if search:
		page_obj = EmployeeModel.objects.filter(
			Q(name__icontains=search) | 
			Q(age__icontains=search) |
			Q(birthday__icontains=search) |
			Q(address__icontains=search) |
			Q(email__icontains=search) |
			Q(gender__icontains=search) |
			Q(joining_date__icontains=search)
			)
	else:
		employees = EmployeeModel.objects.all()
		paginator = Paginator(employees, 3)
		page_number = request.GET.get('page')
		page_obj = paginator.get_page(page_number)
	return render(request,'employee_list.html',{'page_obj':page_obj})

def order_by(request):
	order = request.GET.get('order')
	employees = EmployeeModel.objects.all().order_by(order)
	paginator = Paginator(employees, 3)
	page_number = request.GET.get('page')
	page_obj = paginator.get_page(page_number)
	order_selected = {str(order): 'btn-primary text-white'}
	return render(request, 'employee_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_employees.view_employeemodel', login_url='permission')
def employee(request,employee_id):
	if request.method == "GET":
		employee = EmployeeModel.objects.get(id=employee_id)
		return render(request,'employee_detail.html',{"employee":employee})

@login_required(login_url='login')
def all_employees(request):
	if request.method == "GET":
		all_employees = EmployeeModel.objects.all()
		paginator = Paginator(all_employees, 3)
		page_number = request.GET.get('page')
		page_obj = paginator.get_page(page_number)
		return render(request,'employee_list.html',{'page_obj': page_obj})

@permission_required('hr_employees.add_employeemodel', login_url='permission')
def add_employee(request):
	if  request.method == "GET":
		form = EmployeeForm()
		return render(request,'employee_create.html',{'form':form})
	if request.method == "POST" and request.FILES['image']:
		form = EmployeeForm(request.POST,request.FILES)
		if form.is_valid():
			form.save()
			return redirect('/hr_employees/show_employee/')

@permission_required('hr_employees.change_employeemodel', login_url='permission')
def update_employee(request, employee_id):  
	employee = EmployeeModel.objects.get(id=employee_id)  
	if request.method == "GET":
		form = EmployeeForm(instance=employee)
		return render(request, 'employee_update.html', {'form': form, 'uploaded_image': employee.image})
	elif request.method == "POST":
		form = EmployeeForm(request.POST,request.FILES,instance=employee)
		if form.is_valid():
			form.save()
			return redirect('/hr_employees/detail/' + str(employee_id) + '/')
			
@permission_required('hr_employees.delete_employeemodel', login_url='permission')
def delete_employee(request, employee_id):
		if request.method == "GET":
			employee = EmployeeModel.objects.get(id=employee_id)
			path = "media/" + str(employee.image)
			os.remove(path)
			employee.delete()
			return redirect('/hr_employees/show_employee/')
			
