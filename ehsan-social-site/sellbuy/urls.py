from django.urls import path, include
from .views import *
from .filter import *
from .review import *
from .list import *
from .qa import *
from .faq import *
from .comment import *
from .profile import *
from .operations import *
from rest_framework.routers import DefaultRouter

router=DefaultRouter()
router.register(r'dealerprofile', DealerProfileViewSet)
router.register(r'product', ProductViewSet)
router.register(r'review', ReviewSet)
router.register(r'faq', FAQViewSet)
router.register(r'question', QuestionViewSet)
router.register(r'answer', AnswerViewSet)
router.register(r'comment', ProductCommentViewSet)
urlpatterns = [
    path('sellerprofile/',SellerProfileCRUD.as_view()),

    path('categories/',CategoryListAPI.as_view()),
    path('selled/<int:id>/',ProductSelled.as_view()),
    path('available/<int:id>/',ProductAvailable.as_view()),

    path('selfprodall/',SelfProductLISTAPIView.as_view()),
    path('search/',ProductQuerySearchAPI.as_view()),
    path('filter/',FilterProducts.as_view()),
    path('consumerprod/<int:id>/',OtherConsumersProductLISTAPIView.as_view()),
    path('sellerprod/<int:id>/',OtherSellersProductLISTAPIView.as_view()),
    path('dealerprod/<int:id>/',OtherDealersProductLISTAPIView.as_view()),
    path('cat_prod/<int:id>/',CategoryWiseProductAPIView.as_view()),

    path('selfdealersprofiles/',DealerProfileListAll.as_view()),

    path('buyeradd/<int:id>/',BuyersAddAPIView.as_view()),
    path('increase_qty/<int:id>/',IncreaseQuantityAPIView.as_view()),
    path('like_unlike/<int:id>/',LikeunlikeAPIView.as_view()),
    path('product-reviews/<int:id>/',ProductReviewLISTAPI.as_view()),
    path('product-faqs/<int:id>/',ProductFAQLISTAPI.as_view()),
    path('product-qas/<int:id>/',ProductQALISTAPI.as_view()),
    path('product-comments/<int:id>/',ProductCommentLISTAPI.as_view()),


    path('localproducts/',LocationBasedProductAPIView.as_view()),

    
    path('',include(router.urls)),
]
