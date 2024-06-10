import csv

from django.db.models import Sum
from rest_framework import viewsets, generics, status, parsers, permissions
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView

from . import paginators
from .models import Klass, Department, User, Bulletin, Comment, Like, Activity, StudentActivity, Semester, \
    MissingActivityReport
from .paginators import ActivityPaginator
from .serializers import KlassSerializer, DepartmentSerializer, UserSerializer, \
    StudentSerializer, BulletinSerializer, CommentSerializer, BulletinDetailSerializer, ActivitySerializer, \
    StudentActivitySerializer, CSVUploadSerializer, StudentActivityDetailSerializer, SemesterStatutePointsSerializer, \
    MissingActivityReportSerializer


# Create your views here.
class KlassViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Klass.objects.filter(is_active=True)
    serializer_class = KlassSerializer


class DepartmentViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Department.objects.filter(is_active=True)
    serializer_class = DepartmentSerializer


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = UserSerializer

    @action(methods=["get"], detail=True, url_path="activities")
    def get_activities(self, request, pk=None):
        partd = request.query_params.get("partd")

        registrations = self.get_object().select_related("activity").filter(is_active=True)

        if partd and partd.capitalize() in ["True", "False"]:
            registrations = registrations.filter(is_attendance=partd.capitalize())

        activities = [registration.activity for registration in registrations]

        paginator = paginators.ActivityPagination()
        page = paginator.paginate_queryset(queryset=activities, request=request)
        if page is not None:
            serializer = ActivitySerializer(page, many=True)
            return paginator.get_paginated_response(serializer.data)

        serializer = ActivitySerializer(activities, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    @action(methods=['get'], url_path="current-user", detail=False)
    def get_current(self, request):
        return Response(UserSerializer(request.user).data, status=status.HTTP_200_OK)


class BulletinViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView,
                      generics.RetrieveAPIView):
    queryset = Bulletin.objects.all()
    serializer_class = BulletinSerializer

    # permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)


    @action(methods=['get', 'post'], url_path="comments", detail=True)
    def get_add_comment(self, request, pk):
        if request.method == 'GET':
            comments = self.get_object().comment_set.select_related('user').all()
            return Response(CommentSerializer(comments, many=True).data,
                            status=status.HTTP_200_OK)
        elif request.method == 'POST':
            c = Comment.objects.create(user=request.user, bulletin=self.get_object()
                                       , content=request.data.get('content'))

            return Response(CommentSerializer(c).data, status=status.HTTP_201_CREATED)

    @action(methods=['post'], url_path='likes', detail=True)
    def like(self, request, pk):
        li, created = Like.objects.get_or_create(bulletin=self.get_object(),
                                                 user=request.user)

        if not created:
            li.is_active = not li.is_active
            li.save()

        return Response(
            BulletinDetailSerializer(self.get_object(), context={'request': request}).data,
            status=status.HTTP_201_CREATED)


class ActivityViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView,
                      generics.RetrieveAPIView):
    queryset = Activity.objects.all()
    serializer_class = ActivitySerializer
    # pagination_class = ActivityPaginator

    def perform_create(self, serializer):
        serializer.save(assistant_creator=self.request.user)

    def perform_update(self, serializer):
        serializer.save(assistant_creator=self.request.user)
    @action(methods=['post'], detail=True, url_path='register')
    def register(self, request, pk):
        activity = self.get_object()
        student = request.user
        semester = Semester.objects.filter(is_finished=False).first()
        serializer = StudentActivitySerializer(data={
            'student': student.id,
            'activity': activity.id,
            'semester': semester.id
        })

        if serializer.is_valid():
            student_activity = serializer.save()
            result_serializer = StudentActivitySerializer(student_activity)
            return Response(result_serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    @action(detail=False, methods=['get'], url_path='my-activities')
    def my_activities(self, request):
        user = request.user
        student_activities = StudentActivity.objects.filter(student=user)

        serializer = StudentActivityDetailSerializer(student_activities, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], url_path='my-total-points')
    def my_total_points_by_semester(self, request):
        user = request.user
        attended_activities = StudentActivity.objects.filter(student=user, status='attended')
        total_points_by_semester = attended_activities.values('semester__semester_name', 'activity__statute').annotate(
            total_points=Sum('activity__points')).order_by('semester__semester_name', 'activity__statute')

        result = {}
        for entry in total_points_by_semester:
            semester_name = entry['semester__semester_name']
            statute_id = entry['activity__statute']
            total_points = entry['total_points']
            if semester_name not in result:
                result[semester_name] = []
            result[semester_name].append({
                'statute': statute_id,
                'total_points': total_points
            })

        formatted_result = [{'semester_name': semester, 'points_by_statute': points} for semester, points in
                            result.items()]
        serializer = SemesterStatutePointsSerializer(formatted_result, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    @action(detail=False, methods=['post'], url_path='upload-attendance')
    def upload_attendance(self, request):
        serializer = CSVUploadSerializer(data=request.data)
        if serializer.is_valid():
            file = serializer.validated_data['file']
            decoded_file = file.read().decode('utf-8').splitlines()
            reader = csv.DictReader(decoded_file)

            errors = []
            for row in reader:
                email = row.get('email')
                student_code = row.get('student_code')
                try:
                    user = User.objects.get(email=email)
                    student_activity = StudentActivity.objects.get(student__student_profile__student_code=student_code,
                                                                   student=user)
                    student_activity.status = 'attended'
                    student_activity.save()
                except User.DoesNotExist:
                    errors.append(f"User with email {email} does not exist.")
                except StudentActivity.DoesNotExist:
                    errors.append(f"StudentActivity with email {email} and student code {student_code} does not exist.")

            if errors:
                return Response({'errors': errors}, status=status.HTTP_400_BAD_REQUEST)
            return Response({'status': 'Attendance updated successfully'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


    #tao 1 report missing
    @action(methods=["post"], detail=True, url_path="report")
    def report_missing_activity(self, request, pk):
        activity = self.get_object()
        student = request.user

        try:
            student_activity = StudentActivity.objects.get(student=student, activity=activity)
        except StudentActivity.DoesNotExist:
            return Response({"detail": "Student is not registered for this activity."},
                            status=status.HTTP_400_BAD_REQUEST)

        data = request.data.copy()
        data['student_activity'] = student_activity.id
        serializer = MissingActivityReportSerializer(data=data)

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class MissingActivityReportViewSet(viewsets.ViewSet, generics.ListAPIView, generics.UpdateAPIView, generics.RetrieveAPIView):
    queryset = MissingActivityReport.objects.filter(is_active=True)
    serializer_class = MissingActivityReportSerializer

    # @action(methods=["post"], detail=True, url_path="accept")
    # def acceptsReport(self, request, pk):
    #     report = self.get_object()
    #     if report.status != 'pending':
    #         return Response(data={"detail": "Báo thiếu đã được giải quyết"}, status=status.HTTP_400_BAD_REQUEST)
    #     else:
    #         report