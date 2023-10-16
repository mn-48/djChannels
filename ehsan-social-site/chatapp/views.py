from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def chatView(request,roomname):
    user=request.user
    print(user)
    roomname=roomname
    rooms=user.group_chats.all()
    context={
        'usr':request.user,
        'rooms':rooms,
        'roomname':roomname
    }
    return render(request,'chatapp/chatpage.html',context)


def LoginView(request):
    if request.method == 'POST':
        form = AuthenticationForm(request=request, data=request.POST)
        if form.is_valid():
            print("post method called")
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            print(username, password)
            
            if user is not None:
                login(request, user)
                print(user)
                messages.success(
                    request, f"You are now logged in as {username}") 
                
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Invalid username or password.")
    form = AuthenticationForm()
    return render(request=request,
                  template_name="chatapp/login.html",
                  context={"form": form})

def LogoutView(request):
    logout(request)
    messages.success(request, "Successfully logged out!")
    return redirect('login')