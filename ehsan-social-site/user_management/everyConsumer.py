from django.shortcuts import render,redirect, HttpResponse
# from django.views.generic import ListView, DetailView, View
# from django.views.generic.edit import CreateView, UpdateView, DeleteView

from user_management.models import Consumer 
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib.auth.decorators import login_required

from withdraw_transaction.models import Withdraw
from account_balance.models import Account, TaxSetup
from google_currency import convert  
import json
from django.db.models import  Sum
from commissions.models import CommissionDistributionList
from reference_commissions.models import Everyday_Reference_Commission
from prantic_consumer_commission.models import  PranticDistList
from middle_purchase_consumers.models import  MiddleConsumerResearve_DistList
from references_calculations.models import EveryOneReference
from django.core.paginator import Paginator



@login_required
def EveryConsumerMasterView(request):
    if request.user.is_superuser:
        return redirect(reverse('user:home'))
    user_cin = request.user.username

    obj = EveryOneReference.objects.filter(username=user_cin).first()
    if obj.i_Refered_by_IDs == None:
        return render(request, 'user_management/roots.html')
        # return HttpResponse("")
        # return redirect(reverse('user:home'))

    consumer_list = Consumer.objects.filter(id__in = obj.i_Refered_by_IDs)
    # if consumer_list.count() <= 0:
    #     return HttpResponse("You are the root consumer!")
    #     # return redirect(reverse('user:home'))
    
    paginator = Paginator(consumer_list, 25) # Show 25 contacts per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'user_management/everyconsumermaster.html', {'page_obj': page_obj})


@login_required
def EveryConsumerReference1View(request):
    if request.user.is_superuser:
        return redirect(reverse('user:home'))
    user_cin = request.user.username
    obj = EveryOneReference.objects.filter(username=user_cin).first()
    consumer_list = Consumer.objects.filter(id__in = obj.Reference_1_IDs )
    paginator = Paginator(consumer_list, 25) # Show 25 contacts per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'user_management/everyconsumerleft.html', {'page_obj': page_obj})


@login_required
def EveryConsumerReference2View(request):
    if request.user.is_superuser:
        return redirect(reverse('user:home'))
    user_cin = request.user.username
    obj = EveryOneReference.objects.filter(username=user_cin).first()
    consumer_list = Consumer.objects.filter(id__in = obj.Reference_2_IDs )

    paginator = Paginator(consumer_list, 25) # Show 25 contacts per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'user_management/everyconsumerright.html', {'page_obj': page_obj})


@login_required
def EveryConsumerView(request):

    #================================================================
    # Consumer Account Balance calculation
    ##================================================================
    
    if request.user.is_superuser:
        return redirect(reverse('user:home'))

    user_cin = request.user.username

        
    #------------------------------------
    purchase_amnt_obj = CommissionDistributionList.objects.filter(ReceiverCIN=user_cin, payment_status_commission=True).all()
    # print(purchase_amnt_obj)
    

    # if purchase_amnt_obj != None:
    PurchaseCommissions_usd = purchase_amnt_obj.aggregate(purchase=Sum('PurchaseCommissions_usd'))

    purchase_amnt = PurchaseCommissions_usd['purchase']

    if purchase_amnt== None:
        purchase_amnt = 0
    # print(purchase_amnt)
    # print("--------- PURCHASE-----------")
    #------------------------------------------


    ref_amnt_obj = Everyday_Reference_Commission.objects.filter(consumer__username = user_cin)
    # print(ref_amnt_obj)
    # if ref_amnt_obj != None:
    daily_tAmt_usd = ref_amnt_obj.aggregate(reference_amt = Sum('daily_tAmt_usd'))
    ref_amnt = daily_tAmt_usd['reference_amt']

    if ref_amnt == None:
        ref_amnt = 0
    # print("ref_amnt: ",ref_amnt )

    # print("--------- REFERENCE-----------")

    #-----------------------------------------------

    prantic_amnt_obj = PranticDistList.objects.filter(consumer__username = user_cin).all()
    # if prantic_amnt_obj != None:
    # print(prantic_amnt_obj)

    percent_Amt_usd = prantic_amnt_obj.aggregate(prantic = Sum('percent_Amt_usd'))
    prantic_amnt = percent_Amt_usd['prantic']
    if prantic_amnt == None:
        prantic_amnt = 0
    # print(prantic_amnt)

    # print("---------  Prantic -----------")


    middle_amnt_obj = MiddleConsumerResearve_DistList.objects.filter(consumer__username = user_cin).all()
    # print(middle_amnt_obj)

    # if middle_amnt_obj != None:
    middle_amnt = middle_amnt_obj.aggregate(middle = Sum('percent_Amt_usd'))
    middle_amnt = middle_amnt['middle']
    if middle_amnt ==None:
        middle_amnt = 0

    # print(middle_amnt)

    # print("--------- Middle-----------")


    acc = Account.objects.filter(consumer__username = user_cin).first()
    if acc != None:
        acc.purchase_amnt = purchase_amnt
        acc.ref_amnt = ref_amnt
        acc.prantic_amnt = prantic_amnt
        acc.middle_amnt = middle_amnt

        # acc.ehp_amnt
        # acc.esp_amnt
        # acc.incentive_amnt
        # acc.consumer 
        # acc.tax_set
        acc.save()

    else: 
    # if acc == None:
        new_acc = Account()
        new_acc.purchase_amnt = purchase_amnt
        new_acc.ref_amnt = ref_amnt
        new_acc.prantic_amnt = prantic_amnt
        new_acc.middle_amnt = middle_amnt

        new_acc.ehp_amnt = 0 # baki ase
        new_acc.esp_amnt = 0  # baki ase
        new_acc.incentive_amnt = 0  # baki ase
        i_user = Consumer.objects.filter(user=request.user).first()
        new_acc.consumer = i_user
        
        txst  = TaxSetup.objects.filter(country__name=i_user.country).first()
        new_acc.tax_set = txst
        new_acc.save()


    user_account = Account.objects.filter(consumer__user = request.user).first()

    #++++++++++++++++++++++++++++++++++
    #==================================

    L_CIN = []
    R_CIN = []
    left_ref = []
    right_ref = []
    obj  = Consumer.objects.filter(username = request.user.username).first()
    acc = Account.objects.filter(consumer=obj).first()

    total_income = Account.Total_Amt(acc) 
    if total_income == None:
        total_income = 0
    curr_code = obj.country.currencies_code
    curr = convert('usd', curr_code, total_income)
    y = json.loads(curr)
    local_curr_tot =  y["amount"]


    withdraw_sum_amt = Withdraw.objects.filter(consumer=obj).aggregate(Sum('requisition'))

    withdraw_tax = Withdraw.objects.filter(consumer=obj).aggregate(Sum('tax')) # usd
    withdraw_tax_paid_amt = Withdraw.objects.filter(consumer=obj).aggregate(Sum('tax_paid_amt')) # local
    
    tax_usd = withdraw_tax['tax__sum']
    tax_local = withdraw_tax_paid_amt['tax_paid_amt__sum']

    wd_total_amt = withdraw_sum_amt['requisition__sum']

    if wd_total_amt==None:
        wd_total_amt = 0
    available_balance = max(total_income-wd_total_amt, 0)

    curr = convert('usd', curr_code, available_balance)
    y = json.loads(curr)
    local_curr_available_balance =  y["amount"]

    #--------------------- Left reference Consumer ------------------------------
    left_ref.append(obj.left_refer)

    while(len(left_ref) > 0):
        x = left_ref.pop()
        obj1 = Consumer.objects.filter(refered_by = x).first()
        if obj1:
            left_ref.append(obj1.left_refer)
            left_ref.append(obj1.right_refer)
            L_CIN.append(obj1.username)

    left_cin = Consumer.objects.filter(username__in=L_CIN)

    #--------------------- Right reference Consumer ------------------------------

    right_ref.append(obj.right_refer)

    while(len(right_ref) > 0):
        x = right_ref.pop() 
        obj1 = Consumer.objects.filter(refered_by = x).first()
        if obj1:
            right_ref.append(obj1.left_refer)
            right_ref.append(obj1.right_refer)
            R_CIN.append(obj1.username)
    right_cin = Consumer.objects.filter(username__in=R_CIN)
    left_ref_total = len(L_CIN)
    right_ref_total = len(R_CIN)
    total_ref_con= left_ref_total+right_ref_total
    ac = Consumer.objects.get(username=request.user.username)
    #----------------- My Master consumers ---------------------
    
    last_wd_tax = Withdraw.objects.filter(consumer=obj).last()
    x = 0
    y = 0
    if last_wd_tax != None:
        x = last_wd_tax.tax
        y = last_wd_tax.tax_paid_amt


    context={
        "active_user_cin": ac,
        "L_CIN": left_cin,
        "L_CIN_Total": left_ref_total,
        "R_CIN": right_cin,
        "R_CIN_Total": right_ref_total,
        "Total_ref_con": total_ref_con,
        "total_income": total_income,
        "local_curr_tot": local_curr_tot,
        "available_balance": available_balance,
        "local_curr_available_balance": local_curr_available_balance,
        "tax_usd": tax_usd,
        "tax_local": tax_local,
        "last_wd_tax_usd": x, #usd
        "last_wd_tax_local": y, #local


    }

    return render(request,"backend/home/userdashboard.html", context)
    
