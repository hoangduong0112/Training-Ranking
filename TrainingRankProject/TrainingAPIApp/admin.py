from django.contrib import admin
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.auth.models import Group
from django.urls import path
from django import template
from rest_framework.generics import get_object_or_404

from .dao import get_points_by_semester, get_points_by_department
from .models import Klass, Department, Semester, Statute, Activity, StudentActivity, User, Student, Bulletin, \
    MissingActivityReport, Like, Comment


class DepartmentAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Department._meta.fields]
    list_filter = ['id', 'department_name']
    search_fields = ['department_name']

class ActivitiesAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Activity._meta.fields if field.name != 'description']
    list_filter = ['id', 'title']
    search_fields = ['title', 'description']

class StudentAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Student._meta.fields]
    list_filter = ['id', 'student_code']
    search_fields = ['student_code']


class StudentActivityAdmin(admin.ModelAdmin):
    list_display = [field.name for field in StudentActivity._meta.fields]
    list_filter = ['activity', 'user', 'semester', 'status']

class StudentInline(admin.TabularInline):
    model = Student
    extra = 0
    readonly_fields = ('student_code', 'user', 'phone', 'student_department')
class KlassAdmin(admin.ModelAdmin):
    list_display = [field.name for field in Klass._meta.fields]
    inlines = [StudentInline]


# class customAdmin(admin.)
class TrainingPointManagerAdminSite(admin.AdminSite):
    site_header = 'Quản lý điểm rèn luyện cho sinh viên'

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('department_statistics/', self.admin_view(get_points_by_department), name='get_points_by_department'),
            path('student_statistics/', self.admin_view(get_points_by_semester), name='get_points_by_semester')
        ]
        return custom_urls + urls


admin_site = TrainingPointManagerAdminSite(name='ranking-app')

admin_site.register(Group)
admin_site.register(Department, DepartmentAdmin)
admin_site.register(Klass, KlassAdmin)
admin_site.register(Semester)
admin_site.register(Statute)
admin_site.register(Activity, ActivitiesAdmin)
admin_site.register(Bulletin)
admin_site.register(MissingActivityReport)
admin_site.register(Like)
admin_site.register(Comment)
admin_site.register(StudentActivity, StudentActivityAdmin)
admin_site.register(User)
admin_site.register(Student, StudentAdmin)

