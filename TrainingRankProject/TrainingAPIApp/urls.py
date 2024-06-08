from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework import routers

from TrainingAPIApp import views

r = routers.DefaultRouter()

r.register('department', views.DepartmentViewSet)
r.register('class', views.KlassViewSet)
r.register('user', views.UserViewSet, basename='user')
r.register('bulletin', views.BulletinViewSet)
r.register('activity', views.ActivityViewSet)
r.register('report', views.MissingActivityReportViewSet)

urlpatterns = [
    path('', include(r.urls))
]