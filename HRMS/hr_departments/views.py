from django.shortcuts import render, redirect
from .models import DepartmentModel
from .forms import DepartmentForm
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.core.paginator import Paginator
import os
# Create your views here.
def search_by(request):
    search = request.GET.get('search')
    if search:
        page_obj = DepartmentModel.objects.filter(
            Q(name__icontains = search)|
            Q(sequence__icontains=search)|
            Q(meeting_date__icontains=search)|
            Q(total_employees__icontains=search)|
            Q(note__icontains=search)|
            Q(status__icontains=search)|
            Q(is_active__icontains=search)|
            Q(create_date__icontains=search)
        )
    else:
        departments = DepartmentModel.objects.all()
        paginator = Paginator(departments, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    return render(request,'department_list.html',{'page_obj':page_obj})

def order_by(request):
    order = request.GET.get('order')
    departments = DepartmentModel.objects.all().order_by(order)
    paginator = Paginator(departments, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    order_selected = {str(order): 'btn-primary text-white'}
    return render(request, 'department_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_departments.view_departmentmodel', login_url='permission')
def department(request, department_id):
    if request.method == "GET": 
        department = DepartmentModel.objects.get(id=department_id)  
        return render(request,'department_detail.html', {'department': department})

@login_required(login_url='login')
def all_departments(request):
    if request.method == "GET": 
        all_departments = DepartmentModel.objects.all()
        paginator = Paginator(all_departments, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request,'department_list.html', {'page_obj': page_obj})
    
@permission_required('hr_departments.add_departmentmodel', login_url='permission')
def add_department(request):  
    if request.method == "GET": 
        form = DepartmentForm()
        return render(request,'department_create.html',{'form':form}) 
    if request.method == "POST" and request.FILES['attachment']:  
        form = DepartmentForm(request.POST, request.FILES)
        if form.is_valid():  
            form.save()
            return redirect('/hr_departments/show_department/')  

@permission_required('hr_departments.change_departmentmodel', login_url='permission')
def update_department(request, department_id):  
    department = DepartmentModel.objects.get(id=department_id)  
    if request.method == "GET":
        form = DepartmentForm(instance=department)
        return render(request, 'department_update.html', {'form': form, 'uploaded_image': department.attachment })
    elif request.method == "POST": 
        form = DepartmentForm(request.POST, request.FILES, instance=department)
        if form.is_valid():
            form.save()
            return redirect('/hr_departments/detail/' + str(department_id) + '/')

@permission_required('hr_departments.delete_departmentmodel', login_url='permission')
def delete_department(request, department_id):
    if request.method == "GET":
        department = DepartmentModel.objects.get(id=department_id)
        path = "media/" + str(department.attachment)
        os.remove(path)
        department.delete()
        return redirect('/hr_departments/show_department/')