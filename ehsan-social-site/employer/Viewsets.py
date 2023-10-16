
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.viewsets import ModelViewSet
from .serializers import *
from .models import *
from jobs.models import *


class EmployerViewSet(ModelViewSet):
    permission_classes=[IsAuthenticatedOrReadOnly,]
    serializer_class=EmployerWithTypeSerializer
    queryset=Employer.objects.all()
    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
