from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from django.contrib.auth.models import User

from .models import Personal_Info




class BlockMatriAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Personal_Info.objects.get(user=self.request.user)
        except:
            from_user=Personal_Info.objects.create(user=self.request.user)
            
        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Personal_Info.objects.get(user=user)
        except:
            to_user=Personal_Info.objects.create(user=user)
        
        from_user.block_list.add(user)
        to_user.blocked_by.add(request.user)

        from_user.privary_limit.remove(user)
        from_user.viewed.remove(user)
        from_user.viewed_by.remove(user)
        from_user.shortlisted.remove(user)
        from_user.interested.remove(user)
        from_user.interested_by.remove(user)
        from_user.pending_interested_by.remove(user)

        to_user.privary_limit.remove(user)
        to_user.viewed.remove(user)
        to_user.viewed_by.remove(user)
        to_user.shortlisted.remove(user)
        to_user.interested.remove(user)
        to_user.interested_by.remove(user)
        to_user.pending_interested_by.remove(user)

        return Response({"success":"Successfully Blocked"})



class UnblockMatriAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,request,format=None):
        try:
            from_user=Personal_Info.objects.get(user=self.request.user)
        except:
            from_user=Personal_Info.objects.create(user=self.request.user)

        data=request.data
        username=data['to_username']
        user=User.objects.get(username=username)
        try:
            to_user=Personal_Info.objects.get(user=user)
        except:
            to_user=Personal_Info.objects.create(user=user)
        
        from_user.block_list.remove(user)
        to_user.blocked_by.remove(request.user)

        return Response({"success":"Successfully UnBlocked"})
        