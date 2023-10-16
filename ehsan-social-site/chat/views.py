from django.shortcuts import render,redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from .models import GroupName, PrivateChtRoom
from django.db.models import Q
def chatView(request,username):
    user=request.user
    to_user=User.objects.get(username=username)
    try:
        room= PrivateChtRoom.objects.filter(Q(user1=user, user2=to_user) | Q(user2=user, user1=to_user)).first()
        print(room)
    except:
        room=None
    if room is None:
        room=PrivateChtRoom.objects.create(room_name=str(user.username)+""+str(to_user.username),user1=user, user2=to_user)
    roomname=room.room_name
    print(roomname)
    group=user.groups_c8.all()
    groups=group | user.admins_group.all()
    groups=groups.distinct()
    users=User.objects.all().exclude(username=request.user.username)
    context={
        'usr':request.user,
        'groups':groups,
        'roomname':roomname,
        'users':users
    }
    return render(request,'chat/chatpage.html',context)

def GroupChat(request,group_name):
    user=request.user
    try:
        group_name= GroupName.objects.filter(group_name=group_name).first()
    except:
        group_name=None
    users=User.objects.all().exclude(username=request.user.username)
    group=user.groups_c8.all()
    groups=group | user.admins_group.all()
    groups=groups.distinct()
    context={
        'usr':request.user,
        'roomname':group_name.group_name,
        'users':users,
        'groups':groups,
        'id':group_name.id,
    }
    return render(request,'chat/grouppage.html',context)

def chatHome(request):
    user=request.user
    users=User.objects.all().exclude(username=request.user.username)
    group=user.groups_c8.all()
    groups=group | user.admins_group.all()
    groups=groups.distinct()
    context={
        'usr':user,
        'users':users,
        'groups':groups,
    }
    return render(request,'chat/index.html',context)

from .forms import *
from django.views.generic import CreateView, UpdateView
from django.urls import reverse_lazy
class CreateGroupView(CreateView):
    model = GroupName
    form_class = GroupNameForm
    template_name = 'chat/groupcreate.html'
    def form_valid(self, form):
        if GroupName.objects.all():
            id=GroupName.objects.last().id
        else:
            id=1
        form.instance.group_name="Group"+str(id+1)
        messages.success(self.request, 'Successfully Created Your Group.')
        return super().form_valid(form)
    def get_success_url(self):
        self.object.admins.add(self.request.user)
        self.object.save()
        return reverse_lazy('chathome')

def addusertogroup(request, id):
    instance = GroupName.objects.get(id=id)
    form=ParticipantsAddForm(request.POST or None, instance=instance)
    if request.method=="POST":
        pass
class ParticipantsAddView(UpdateView):
    model = GroupName
    form_class = ParticipantsAddForm
    template_name = 'chat/groupcreate.html'
    slug_field = 'pk'
    def get_success_url(self):
        return reverse_lazy('groupchat', kwargs={'group_name': self.object.group_name})


def GroupCreate(request):
    form=GroupNameForm(request.POST,None)
    if request.method=="POST":
        if form.is_valid():
            if GroupName.objects.all():
                id=GroupName.objects.last().id
            else:
                id=1
            obj=form.save(commit=False)
            obj.group_name="Group"+str(id+1)
            obj.save()
            obj.admins.add(request.user)
            obj.save()
    context={
        'form':form
    }
    return render(request, 'chat/groupcreate.html', context)


def LoginView(request):
    if request.method == 'POST':
        form = AuthenticationForm(request=request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                print(user)
                messages.success(
                    request, f"You are now logged in as {username}") 
                return redirect('chathome')
            else:
                messages.error(request, "Invalid username or password.")
        else:
            messages.error(request, "Invalid username or password.")
    form = AuthenticationForm()
    return render(request=request,
                  template_name="chat/login.html",
                  context={"form": form})

def LogoutView(request):
    logout(request)
    messages.success(request, "Successfully logged out!")
    return redirect('login')