from django.shortcuts import render, redirect
from .models import ExpenseModel
from .forms import ExpenseForm
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import login_required, permission_required
from django.core.paginator import Paginator
# Create your views here.
def search_by(request):
    search = request.GET.get('search')
    if search:
        page_obj = ExpenseModel.objects.filter(
            Q(itemname__icontains = search)|
            Q(quantity__icontains=search)|
            Q(price__icontains=search)|
            Q(amount__icontains=search)|
            Q(date__icontains=search)|
            Q(category__icontains=search)|
            Q(employee__icontains=search)
        )
    else:
        expenses = ExpenseModel.objects.all()
        paginator = Paginator(expenses, 4)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
    return render(request,'expense_list.html',{'page_obj':page_obj})

def order_by(request):
    order = request.GET.get('order')
    expenses = ExpenseModel.objects.all().order_by(order)
    paginator = Paginator(expenses, 4)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    order_selected = {str(order): 'btn-primary text-white'}
    return render(request, 'expense_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_expense.view_expensemodel', login_url='permission')
def expense(request, expense_id):
    if request.method == "GET": 
        expense = ExpenseModel.objects.get(id=expense_id)  
        return render(request,'expense_detail.html', {'expense': expense})

@login_required(login_url='login')
def all_expenses(request):
    if request.method == "GET": 
        all_expenses = ExpenseModel.objects.all()
        paginator = Paginator(all_expenses, 4)
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)
        return render(request,'expense_list.html', {'page_obj': page_obj})

@permission_required('hr_expense.add_expensemodel', login_url='permission')   
def add_expense(request):  
    if request.method == "GET": 
        form = ExpenseForm()
        return render(request,'expense_create.html',{'form':form}) 
    if request.method == "POST":  
        form = ExpenseForm(request.POST)
        if form.is_valid():  
            form.save()
            return redirect('/hr_expense/show_expense/')  

@permission_required('hr_expense.change_expensemodel', login_url='permission')
def update_expense(request, expense_id):  
    expense = ExpenseModel.objects.get(id=expense_id)  
    if request.method == "GET":
        form = ExpenseForm(instance=expense)
        return render(request, 'expense_update.html', {'form': form })
    elif request.method == "POST": 
        form = ExpenseForm(request.POST,instance=expense)
        if form.is_valid():
            form.save()
            return redirect('/hr_expense/detail/' + str(expense_id) + '/')

@permission_required('hr_expense.delete_expensemodel', login_url='permission')
def delete_expense(request, expense_id):
    if request.method == "GET":
        expense = ExpenseModel.objects.filter(id=expense_id)
        expense.delete()
        return redirect('/hr_expense/show_expense/')