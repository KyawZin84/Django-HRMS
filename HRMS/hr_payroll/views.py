from django.shortcuts import render, redirect
from .models import PayrollModel
from .forms import PayRollForm
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import login_required, permission_required
from django.core.paginator import Paginator
# Create your views here.
def search_by(request):
    search = request.GET.get('search')
    if search:
        page_obj = PayrollModel.objects.filter(
            Q(name__icontains = search)|
            Q(salary__icontains=search)|
            Q(bonus__icontains=search)|
            Q(mulct__icontains=search)|
            Q(total__icontains=search)|
            Q(pay_day__icontains=search)
        )
    else:
        payrolls = PayrollModel.objects.all()
        paginator = Paginator(payrolls, 4)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    return render(request,'payroll_list.html',{'page_obj':page_obj})

def order_by(request):
    order = request.GET.get('order')
    payrolls = PayrollModel.objects.all().order_by(order)
    paginator = Paginator(payrolls, 4)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    order_selected = {str(order): 'btn-primary text-white'}
    return render(request, 'payroll_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_payroll.view_payrollmodel', login_url='permission')
def payroll(request, payroll_id):
    if request.method == "GET": 
        payroll = PayrollModel.objects.get(id=payroll_id)  
        return render(request,'payroll_detail.html', {'payroll': payroll})

@login_required(login_url='login')
def all_payrolls(request):
    if request.method == "GET": 
        all_payrolls = PayrollModel.objects.all()
        paginator = Paginator(all_payrolls, 4)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request,'payroll_list.html', {'page_obj': page_obj})

@permission_required('hr_payroll.add_payrollmodel', login_url='permission')   
def add_payroll(request):  
    if request.method == "GET": 
        form = PayRollForm()
        return render(request,'payroll_create.html',{'form':form}) 
    if request.method == "POST":  
        form = PayRollForm(request.POST)
        if form.is_valid():  
            form.save()
            return redirect('/hr_payroll/show_payroll/')  

@permission_required('hr_payroll.change_payrollmodel', login_url='permission')
def update_payroll(request, payroll_id):  
    payroll = PayrollModel.objects.get(id=payroll_id)  
    if request.method == "GET":
        form = PayRollForm(instance=payroll)
        return render(request, 'payroll_update.html', {'form': form })
    elif request.method == "POST": 
        form = PayRollForm(request.POST,instance=payroll)
        if form.is_valid():
            form.save()
            return redirect('/hr_payroll/detail/' + str(payroll_id) + '/')

@permission_required('hr_payroll.delete_payrollmodel', login_url='permission')
def delete_payroll(request, payroll_id):
    if request.method == "GET":
        payroll = PayrollModel.objects.filter(id=payroll_id)
        payroll.delete()
        return redirect('/hr_payrolls/show_payroll/')