from rest_framework.response import Response
from rest_framework.permissions import  IsAuthenticated
from rest_framework.views import APIView

from .serializers import *
from .models import Personal_Info
from django.contrib.auth.models import User
class MatrimonyProfileViewedAPI(APIView): 
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            from_user=request.user
            to_user=User.objects.get(id=id)

            matripfofile=to_user.personal_info
            matripfofile.viewed_by.add(from_user)
            matripfofile.save()

            By_matripfofile= from_user.personal_info
            By_matripfofile.viewed.add(to_user)
            By_matripfofile.save()

            return Response({"Success":"Successfully Added to viewed!"})
        except:
            return Response({"Error":"matripfofile Not Found"})

class InterestedAddAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            from_user=request.user
            to_user=User.objects.get(id=id)

            matripfofile=to_user.personal_info
            matripfofile.pending_interested_by.add(from_user)
            matripfofile.save()

            By_matripfofile= from_user.personal_info
            By_matripfofile.interested.add(to_user)
            By_matripfofile.save()

            return Response({"Success":"Successfully Added to Intertested List!"})
        except:
            return Response({"Error":"matripfofile Not Found"})

class InterestedAcceptAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            from_user=request.user
            to_user=User.objects.get(id=id)
            By_matripfofile= from_user.personal_info
            if to_user in By_matripfofile.pending_interested_by.all(): 
                By_matripfofile.pending_interested_by.remove(to_user)
                By_matripfofile.interested_by.add(to_user)
                By_matripfofile.privary_limit.add(to_user)
                By_matripfofile.save()

            return Response({"Success":"Successfully Accepted!"})
        except:
            return Response({"Error":"matripfofile Not Found"})

class InterestedRejectAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            from_user=request.user
            to_user=User.objects.get(id=id)
            By_matripfofile= from_user.personal_info
            if to_user in By_matripfofile.pending_interested_by.all(): 
                By_matripfofile.pending_interested_by.remove(to_user)
                By_matripfofile.save()

            return Response({"Success":"Successfully Rejected"})
        except:
            return Response({"Error":"matripfofile Not Found"})
    


class MakeProfileShortlistedAPI(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            from_user=request.user
            to_user=User.objects.get(id=id)
            By_matripfofile= from_user.personal_info
            By_matripfofile.shortlisted.add(to_user)
            By_matripfofile.save()

            return Response({"Success":"Successfully Added to shortlisted List!"})
        except:
            return Response({"Error":"matripfofile Not Found"})
