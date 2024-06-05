from rest_framework import viewsets, generics, status, parsers, permissions
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import Klass, Department, User, Bulletin
from .serializers import KlassSerializer, DepartmentSerializer, UserSerializer, UserRegistrationSerializer, \
    StudentSerializer, BulletinSerializer


# Create your views here.
class KlassViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Klass.objects.filter(is_active=True)
    serializer_class = KlassSerializer


class DepartmentViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Department.objects.filter(is_active=True)
    serializer_class = DepartmentSerializer


class StudentRegistrationViewSet(viewsets.ViewSet):
    def create(self, request):
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            return Response({
                'user': UserSerializer(user).data,
                'student': StudentSerializer(user.student_profile).data
            }, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = UserSerializer


class BulletinViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView,
                      generics.RetrieveAPIView):
    queryset = Bulletin.objects.all()
    serializer_class = BulletinSerializer



