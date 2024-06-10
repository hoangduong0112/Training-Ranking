from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework import routers

from TrainingAPIApp import views

r = routers.DefaultRouter()

r.register('departments', views.DepartmentViewSet)
r.register('classes', views.KlassViewSet)
r.register('users', views.UserViewSet, basename='user')
r.register('bulletins', views.BulletinViewSet)
r.register('activities', views.ActivityViewSet)
r.register('reports', views.MissingActivityReportViewSet)

urlpatterns = [
    path('', include(r.urls))
]