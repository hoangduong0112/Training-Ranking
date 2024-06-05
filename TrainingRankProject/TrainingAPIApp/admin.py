from django.contrib import admin
from .models import Klass, Department, Semester, Statute, Activity, StudentActivity, User, Student, Bulletin, \
    MissingActivityReport, Like, Comment

class DepartmentAdmin(admin.ModelAdmin):
    list_display = [k.name for k in Department._meta.fields]
    list_filter = ['id', 'department_name']
    search_fields = ['department_name']
class TrainingPointManagerAdminSite(admin.AdminSite):
    site_header = 'Quản lý điểm rèn luyện cho sinh viên'


admin_site = TrainingPointManagerAdminSite(name='ranking-app')

admin_site.register(Department, DepartmentAdmin)
admin_site.register(Klass)
admin_site.register(Semester)
admin_site.register(Statute)
admin_site.register(Activity)
admin_site.register(Bulletin)
admin_site.register(MissingActivityReport)
admin_site.register(Like)
admin_site.register(Comment)
admin_site.register(StudentActivity)
admin_site.register(User)
admin_site.register(Student)