from django.contrib.auth.models import User
from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response


from .models import *
from .serializers import *


class FollowAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Friends.objects.get(user=self.request.user)
        except:
            from_user=Friends.objects.create(user=self.request.user)
        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Friends.objects.get(user=user)
        except:
            to_user=Friends.objects.create(user=user)
        
        
        if to_user.is_private== False:
            # Followers.objects.create(user=request.user,friends=to_user)
            # Followings.objects.create(user=user,friends=from_user)
            to_user.followers.add(request.user)
            from_user.followings.add(user)
            return Response({"success":"Successfully Followed"})
        else:
            to_user.to_be_followers.add(request.user)
            from_user.to_be_followings.add(user)
            return Response({"warning":"Follow request done"})
class UnFollowAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Friends.objects.get(user=self.request.user)
        except:
            from_user=Friends.objects.create(user=self.request.user)
        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Friends.objects.get(user=user)
        except:
            to_user=Friends.objects.create(user=user)
        
        if request.user in to_user.followers.all():  
            to_user.followers.remove(request.user)
            from_user.followings.remove(user)
            return Response({"success":"Successfully UnFollowed"})
        elif request.user in to_user.to_be_followers.all():
            to_user.to_be_followers.remove(request.user)
            from_user.to_be_followings.remove(user)
            return Response({"success":"Successfully Cancelled Following Request"})
        else:
            return Response({"error":"User is not in Your Following List/ To_be_following List"})

class FriendsListAPI(ListAPIView):
    permission_classes=[IsAuthenticated,]
    queryset=Friends.objects.all()
    serializer_class=FriendsSerializer
    def get_queryset(self):
        queryset=Friends.objects.filter(user=self.request.user)
        return queryset


class AcceptRequest(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Friends.objects.get(user=self.request.user)
        except:
            from_user=Friends.objects.create(user=self.request.user)
        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Friends.objects.get(user=user)
        except:
            to_user=Friends.objects.create(user=user)
        
        if user in from_user.to_be_followers.all():  
            from_user.to_be_followers.remove(user)
            from_user.followers.add(user)
            to_user.to_be_followings.remove(request.user)
            to_user.followings.add(request.user)
            return Response({"success":"Successfully Accepted"})
        elif user in from_user.followers.all():
            return Response({"success":"Already in Follower List"})
        else:
            return Response({"error":"User is not in Your to_be_follower List"})


class BlockUserAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Friends.objects.get(user=self.request.user)
        except:
            from_user=Friends.objects.create(user=self.request.user)
            
        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Friends.objects.get(user=user)
        except:
            to_user=Friends.objects.create(user=user)
        
        from_user.block_list.add(user)
        to_user.blocked_by.add(request.user)

        from_user.followers.remove(user)
        from_user.followings.remove(user)
        from_user.to_be_followers.remove(user)
        from_user.to_be_followings.remove(user)

        to_user.followers.remove(request.user)
        to_user.followings.remove(request.user)
        to_user.to_be_followers.remove(request.user)
        to_user.to_be_followings.remove(request.user)

        return Response({"success":"Successfully Blocked"})
class UnblockUserAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Friends.objects.get(user=self.request.user)
        except:
            from_user=Friends.objects.create(user=self.request.user)

        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Friends.objects.get(user=user)
        except:
            to_user=Friends.objects.create(user=user)
        
        from_user.block_list.remove(user)
        to_user.blocked_by.remove(request.user)

        return Response({"success":"Successfully UnBlocked"})
        