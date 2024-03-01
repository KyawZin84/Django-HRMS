from django.shortcuts import render,redirect
from .models import ContractsModel
from .forms import ContractForm
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.core.paginator import Paginator
import os
# Create your views here.

def search_by(request):
	search = request.GET.get('search')
	if search:    
		page_obj = ContractsModel.objects.filter(
			Q(name__icontains=search) | 
			Q(rank__icontains=search) |
			Q(start_date__icontains=search) |
			Q(end_date__icontains=search) |
			Q(note__icontains=search) |
			Q(status__icontains=search) |
			Q(create_date__icontains=search)
		)
	else:      
		contracts = ContractsModel.objects.all()
		paginator = Paginator(contracts, 3)
		page_number = request.GET.get('page')
		page_obj = paginator.get_page(page_number)
	return render(request, 'contract_list.html', {'page_obj': page_obj})

def order_by(request):
	order = request.GET.get('order')
	contracts = ContractsModel.objects.all().order_by(order)
	paginator = Paginator(contracts, 3)
	page_number = request.GET.get('page')
	page_obj = paginator.get_page(page_number)
	order_selected = {str(order): 'btn-primary text-white'}
	return render(request, 'contract_list.html', {'page_obj': page_obj, 'order_selected': order_selected})

@permission_required('hr_contracts.view_contractmodel', login_url='permission')
def contract(request,contract_id):
	if request.method == "GET":
		contract = ContractsModel.objects.get(id=contract_id)
		return render(request,'contract_detail.html',{'contract':contract})

@login_required(login_url='login')
def all_contracts(request):
	if request.method == "GET":
		all_contracts = ContractsModel.objects.all()
		paginator = Paginator(all_contracts, 3)
		page_number = request.GET.get('page')
		page_obj = paginator.get_page(page_number)
		return render(request,'contract_list.html',{'page_obj':page_obj})

@permission_required('hr_contracts.add_contractsmodel', login_url='permission')
def add_contract(request):
	if request.method == "GET":
		form = ContractForm()
		return render(request,'contract_create.html',{'form':form})
	if request.method == "POST" and request.FILES['attachment']:
		form = ContractForm(request.POST,request.FILES)
		if form.is_valid():
			form.save()
			return redirect('/hr_contracts/show_contract/')

@permission_required('hr_contracts.change_contractsmodel', login_url='permission')
def update_contract(request,contract_id):
	contract = ContractsModel.objects.get(id=contract_id)
	if request.method == "GET":
		form = ContractForm(instance=contract)
		return render(request,'contract_update.html',{'form':form,'uploaded_image':contract.attachment})
	elif request.method == "POST":
		form = ContractForm(request.POST,request.FILES,instance=contract)
		if form.is_valid():
			form.save()
			return redirect('/hr_contracts/detail/' + str(contract_id) + '/')

@permission_required('hr_contracts.delete_contractsmodel', login_url='permission')
def delete_contract(request,contract_id):
	if request.method == "GET":
		contract = ContractsModel.objects.get(id=contract_id)
		path = "media/" + str(contract.attachment)
		os.remove(path)
		contract.delete()
		return redirect('/hr_contracts/show_contract/')
