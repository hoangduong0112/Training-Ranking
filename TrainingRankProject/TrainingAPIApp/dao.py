from django import forms
from django.shortcuts import render, get_object_or_404
from django.contrib.admin.views.decorators import staff_member_required
from django.db.models import Sum, Case, When, F, Value, Count
from django.db.models.functions import Greatest
from .models import StudentActivity, Semester, Student, Statute
from rest_framework.generics import get_object_or_404
from TrainingAPIApp.models import *


class SemesterClassFilterForm(forms.Form):
    semester = forms.ModelChoiceField(queryset=Semester.objects.all(), required=True, label='Select Semester')
    klass = forms.ModelChoiceField(queryset=Klass.objects.all(), required=False, label='Select Class')

ACHIEVEMENTS = {
    'Excellent': 100,
    'Good': 80,
    'Average': 60,
    'Bad': 40,
    'Fail': 0
}

@staff_member_required
def get_points_by_semester(request):
    form = SemesterClassFilterForm(request.GET or None)
    student_classifications = []

    if form.is_valid():
        semester = form.cleaned_data.get('semester')
        klass = form.cleaned_data.get('klass')

        # Query to get points per student per statute along with department and class info
        student_statute_points = StudentActivity.objects.filter(
            semester=semester,
            status='attended'
        ).values(
            'user_id',
            'user__email',
            'user__student_profile__student_class__klass_name',
            'user__student_profile__student_department__department_name',
            'activity__statute__statute_name',
            'activity__statute__max_point'
        ).annotate(
            total_statute_points=Sum('activity__points')
        ).annotate(
            capped_statute_points=Greatest(
                Case(
                    When(total_statute_points__lte=F('activity__statute__max_point'), then=F('total_statute_points')),
                    default=F('activity__statute__max_point'),
                    output_field=models.PositiveSmallIntegerField()
                ),
                Value(0)
            )
        )

        student_points = {}
        for item in student_statute_points:
            student_id = item['user_id']
            email = item['user__email']
            klass_name = item['user__student_profile__student_class__klass_name']
            department_name = item['user__student_profile__student_department__department_name']
            statute_name = item['activity__statute__statute_name']
            capped_points = item['capped_statute_points']

            if klass and klass_name != klass.klass_name:
                continue

            if student_id not in student_points:
                student_points[student_id] = {
                    'username': email,
                    'total_points': 0,
                    'statutes': {},
                    'klass': klass_name,
                    'department': department_name
                }

            student_points[student_id]['total_points'] += capped_points
            student_points[student_id]['statutes'][statute_name] = capped_points

        for student_id, data in student_points.items():
            total_points = data['total_points']
            classification = 'Fail'  # Default to Fail
            for achievement_name, min_points in sorted(ACHIEVEMENTS.items(), key=lambda x: x[1], reverse=True):
                if total_points >= min_points:
                    classification = achievement_name
                    break

            student_classifications.append({
                'username': data['username'],
                'department': data['department'],
                'klass': data['klass'],
                'total_points': data['total_points'],
                'classification': classification,
                'statutes': data['statutes'],
            })

    context = {
        'form': form,
        'student_classifications': student_classifications,
    }

    return render(request, 'admin/student_statistics.html', context)


class SemesterAchievementFilterForm(forms.Form):
    semester = forms.ModelChoiceField(queryset=Semester.objects.all(), label='Semester')
    achievement = forms.ChoiceField(choices=[
        ('Excellent', 'Excellent'),
        ('Good', 'Good'),
        ('Average', 'Average'),
        ('Bad', 'Bad'),
        ('Fail', 'Fail')
    ], label='Achievement')


@staff_member_required
def get_points_by_department(request):
    form = SemesterAchievementFilterForm(request.GET or None)
    department_classifications = []
    all_departments = Department.objects.values_list('department_name', flat=True)

    if form.is_valid():
        semester = form.cleaned_data.get('semester')
        selected_achievement = form.cleaned_data.get('achievement')

        # Query to get points per student per statute along with department info
        student_statute_points = StudentActivity.objects.filter(
            semester=semester,
            status='attended'
        ).values(
            'user_id',
            'user__student_profile__student_department__department_name',
            'activity__statute__statute_name',
            'activity__statute__max_point'
        ).annotate(
            total_statute_points=Sum('activity__points')
        ).annotate(
            capped_statute_points=Greatest(
                Case(
                    When(total_statute_points__lte=F('activity__statute__max_point'), then=F('total_statute_points')),
                    default=F('activity__statute__max_point'),
                    output_field=models.PositiveSmallIntegerField()
                ),
                Value(0)
            )
        )

        student_points = {}
        for item in student_statute_points:
            student_id = item['user_id']
            department_name = item['user__student_profile__student_department__department_name']
            capped_points = item['capped_statute_points']

            if student_id not in student_points:
                student_points[student_id] = {
                    'total_points': 0,
                    'department': department_name
                }

            student_points[student_id]['total_points'] += capped_points

        department_achievements = {dept: {ach: 0 for ach in ACHIEVEMENTS.keys()} for dept in all_departments}
        for student_id, data in student_points.items():
            total_points = data['total_points']
            department_name = data['department']
            classification = 'Fail'  # Default to Fail
            for achievement_name, min_points in sorted(ACHIEVEMENTS.items(), key=lambda x: x[1], reverse=True):
                if total_points >= min_points:
                    classification = achievement_name
                    break

            if classification != selected_achievement:
                continue

            if department_name in department_achievements:
                department_achievements[department_name][classification] += 1

        for department_name, achievements in department_achievements.items():
            if achievements[selected_achievement] > 0 or department_name in all_departments:
                department_classifications.append({
                    'department': department_name,
                    'classification': selected_achievement,
                    'count': achievements[selected_achievement],
                })

    context = {
        'form': form,
        'department_classifications': department_classifications,
    }

    return render(request, 'admin/department_statistics.html', context)





