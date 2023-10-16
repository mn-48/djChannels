from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from .models import *
from .serializers import *
from rest_framework.permissions import IsAuthenticated
class ProductSelled(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            product= Product.objects.get(id=id)
            product.selled=True
            product.save()
            return Response({"Success":"Successfully selled!"})
        except:
            return Response({"Error":"Product Not Found"})

class ProductAvailable(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self, request, id, format=None):
        try:
            product= Product.objects.get(id=id)
            product.selled=False
            product.save()
            return Response({"Success":"Product is available now!! "})
        except:
            return Response({"Error":"Product Not Found"})

class BuyersAddAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,  request,id, format=None):
        data=request.data
        product=Product.objects.get(id=id)
        try:
            to_user_id=data['to_user_id']
        except Exception as e:
            to_user_id=None
            print(e)
        try:
            quantity=data['quantity']
        except Exception as e:
            quantity=None
            print(e)
        
        if quantity and to_user_id:
            to_user=User.objects.get(id=to_user_id)
            try:
                buyer=Buyers.objects.get(product=product,user=to_user)
            except Exception as e:
                buyer=Buyers.objects.create(product=product,user=to_user,quantity=0)
                print(e)
            buyer.quantity = buyer.quantity+int(quantity)
            product.selled_quantity = product.selled_quantity+int(quantity)
            product.save()
            buyer.save()
            return Response({"Success":"Successfully added a Buyer"}, status=status.HTTP_201_CREATED)
        else:
            return Response({"Error":"Can't added any Buyer"}, status=status.HTTP_406_NOT_ACCEPTABLE)

class IncreaseQuantityAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def post(self,  request, id, format=None):
        data=request.data
        product=Product.objects.get(id=id)
        try:
            increase_am=data['increase_am']
        except Exception as e:
            increase_am=None
            print(e)
        
        if increase_am:
            product.quantity = product.quantity+int(increase_am)
            product.save()
            return Response({"Success":f"Successfully Increased! Now total = {product.quantity}"}, status=status.HTTP_201_CREATED)
        else:
            return Response({"Error":"Something Went Worng!"}, status=status.HTTP_406_NOT_ACCEPTABLE)


class LikeunlikeAPIView(APIView):
    permission_classes=[IsAuthenticated,]
    def get(self,request,id, format=None):
        product=Product.objects.get(id=id)
        if product.like.filter(id=request.user.id).exists():
            product.like.remove(request.user)
            return Response({"Success":"Successfully Unliked! "}, status=status.HTTP_202_ACCEPTED)
        else:
            product.like.add(request.user)
            return Response({"Success":"Successfully Liked! "}, status=status.HTTP_202_ACCEPTED)
           