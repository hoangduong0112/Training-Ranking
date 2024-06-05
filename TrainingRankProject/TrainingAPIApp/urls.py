from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework import routers

from TrainingAPIApp import views

r = routers.DefaultRouter()

r.register('Khoa', views.DepartmentViewSet)
r.register('Lop', views.KlassViewSet)
r.register(r'register', views.StudentRegistrationViewSet, basename='register')
r.register('user', views.UserViewSet, basename='user')
r.register('bulletin', views.BulletinViewSet)

urlpatterns = [
    path('', include(r.urls))
]