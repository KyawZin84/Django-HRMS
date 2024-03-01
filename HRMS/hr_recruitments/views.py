from django.shortcuts import render, redirect
from .models import ResumeModel
from .forms import ResumeForm
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.core.paginator import Paginator
import os
# Create your views here.
def search_by(request):
    search = request.GET.get('search')
    if search:
        page_obj = ResumeModel.objects.filter(
            Q(name__icontains = search)|
            Q(sequence__icontains=search)|
            Q(appointment_date__icontains=search)|
            Q(note__icontains=search)|
            Q(status__icontains=search)|
            Q(is_active__icontains=search)|
            Q(create_date__icontains=search)
        )
    else:
        resumes = ResumeModel.objects.all()
        paginator = Paginator(resumes, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    return render(request,'resume_list.html',{'page_obj':page_obj})

def order_by(request):
    order = request.GET.get('order')
    resumes = ResumeModel.objects.all().order_by(order)
    paginator = Paginator(resumes, 3)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    order_selected = {str(order): 'btn-primary text-white'}
    return render(request, 'resume_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_recruitments.view_resumemodel', login_url='permission')
def recruitment(request, resume_id):
    if request.method == "GET": 
        resume = ResumeModel.objects.get(id=resume_id)  
        return render(request,'resume_detail.html', {'resume':resume})

@login_required(login_url='login')
def all_recruitments(request):
    if request.method == "GET": 
        all_resumes = ResumeModel.objects.all()
        paginator = Paginator(all_resumes, 3)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request,'resume_list.html', {'page_obj': page_obj})

@permission_required('hr_recruitments.add_resumemodel', login_url='permission')   
def add_recruitment(request):  
    if request.method == "GET": 
        form = ResumeForm()
        return render(request,'resume_create.html',{'form':form}) 
    if request.method == "POST" and request.FILES['attachment']:  
        form = ResumeForm(request.POST, request.FILES)
        if form.is_valid():  
            form.save()
            return redirect('/hr_recruitments/show_resume/')  

@permission_required('hr_recruitments.change_resumemodel', login_url='permission')
def update_recruitment(request, resume_id):  
    resume = ResumeModel.objects.get(id=resume_id)  
    if request.method == "GET":
        form = ResumeForm(instance=resume)
        return render(request, 'resume_update.html', {'form': form, 'uploaded_image': resume.attachment })
    elif request.method == "POST": 
        form = ResumeForm(request.POST, request.FILES, instance=resume)
        if form.is_valid():
            form.save()
            return redirect('/hr_recruitments/detail/' + str(resume_id) + '/')

@permission_required('hr_recruitments.delete_resumemodel', login_url='permission')
def delete_recruitment(request, resume_id):
    if request.method == "GET":
        resume = ResumeModel.objects.get(id=resume_id)
        path = "media/" + str(resume.attachment)
        os.remove(path)
        resume.delete()
        return redirect('/hr_recruitments/show_resume/')