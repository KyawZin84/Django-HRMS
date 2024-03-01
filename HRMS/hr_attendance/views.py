from django.shortcuts import render, redirect
from .models import AttendanceModel
from .forms import AttendanceForm
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import login_required, permission_required
from django.core.paginator import Paginator
# Create your views here.
def search_by(request):
    search = request.GET.get('search')
    if search:
        page_obj = AttendanceModel.objects.filter(
            Q(date__icontains = search)|
            Q(day__icontains=search)|
            Q(name__icontains=search)|
            Q(intime__icontains=search)|
            Q(outtime__icontains=search)|
            Q(status__icontains=search)|
            Q(reason__icontains=search)
        )
    else:
        attendances = AttendanceModel.objects.all()
        paginator = Paginator(attendances, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    return render(request,'attendance_list.html',{'page_obj':page_obj})

def order_by(request):
    order = request.GET.get('order')
    attendances = AttendanceModel.objects.all().order_by(order)
    paginator = Paginator(attendances, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    order_selected = {str(order): 'btn-primary text-white'}
    return render(request, 'attendance_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_attendance.view_attendancemodel', login_url='permission')
def attendance(request, attendance_id):
    if request.method == "GET": 
        attendance = AttendanceModel.objects.get(id=attendance_id)  
        return render(request,'attendance_detail.html', {'attendance': attendance})

@login_required(login_url='login')
def all_attendances(request):
    if request.method == "GET": 
        all_attendances = AttendanceModel.objects.all()
        paginator = Paginator(all_attendances, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request,'attendance_list.html', {'page_obj': page_obj})

@permission_required('hr_attendance.add_attendancemodel', login_url='permission')   
def add_attendance(request):  
    if request.method == "GET": 
        form = AttendanceForm()
        return render(request,'attendance_create.html',{'form':form}) 
    if request.method == "POST":  
        form = AttendanceForm(request.POST)
        if form.is_valid():  
            form.save()
            return redirect('/hr_attendance/show_attendance/')  

@permission_required('hr_attendance.change_attendancemodel', login_url='permission')
def update_attendance(request, attendance_id):  
    attendance = AttendanceModel.objects.get(id=attendance_id)  
    if request.method == "GET":
        form = AttendanceForm(instance=attendance)
        return render(request, 'attendance_update.html', {'form': form})
    elif request.method == "POST": 
        form = AttendanceForm(request.POST, instance=attendance)
        if form.is_valid():
            form.save()
            return redirect('/hr_attendance/detail/' + str(attendance_id) + '/')

@permission_required('hr_attendance.delete_attendancemodel', login_url='permission')
def delete_attendance(request, attendance_id):
    if request.method == "GET":
        attendance = AttendanceModel.objects.filter(id=attendance_id)
        attendance.delete()
        return redirect('/hr_attendance/show_attendance/')