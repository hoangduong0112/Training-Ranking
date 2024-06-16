import csv
import logging

from django.db.models import Sum, Q
from rest_framework import viewsets, generics, status, parsers, permissions
from rest_framework.decorators import action
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response

from . import paginators
from .models import Klass, Department, User, Bulletin, Comment, Like, Activity, StudentActivity, Semester, \
    MissingActivityReport, Statute, Student
from .paginators import ActivityPaginator
from .perms import IsStudentUser, IsAssistantUser, IsSpecialistUser, CanCreateUser
from .serializers import KlassSerializer, DepartmentSerializer, UserSerializer, \
    StudentSerializer, BulletinSerializer, CommentSerializer, AuthenticatedBulletinSerializer, ActivitySerializer, \
    StudentActivitySerializer, StudentActivityDetailSerializer, SemesterStatutePointsSerializer, \
    MissingActivityReportSerializer, AuthenticatedDetailActivitySerializer, StatuteSerialier, SemesterSerializer


# Create your views here.
class KlassViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Klass.objects.filter(is_active=True)
    serializer_class = KlassSerializer
    permission_classes = [permissions.IsAuthenticated]


class DepartmentViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Department.objects.filter(is_active=True)
    serializer_class = DepartmentSerializer

    permission_classes = [permissions.IsAuthenticated]


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView, generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = UserSerializer

    def get_permissions(self):
        if self.action in ['activities', 'points']:
            permission_classes = [IsAssistantUser | IsSpecialistUser]
        elif self.action in ['my-total-points', 'my-activities', 'my-total-points']:
            permission_classes = [IsStudentUser]
        elif self.action in ['current-user', 'update']:
            permission_classes = [IsAuthenticated]
        elif self.action in ['create']:
            permission_classes = [CanCreateUser]
        else:
            permission_classes = [permissions.AllowAny]
        return [permission() for permission in permission_classes]

    def perform_create(self, serializer):
        if self.request.data.get('user_role') == 'CV':
            serializer.save(is_staff=True)
        # elif self.request.data.get('user_role') == 'SV':
        #     serializer.save(is_active=False)
        else:
            serializer.save()

    #Tao profile - SV
    @action(methods=['post'], detail=False, url_path="profile", permission_classes=[IsAuthenticated])
    def post_profile_student(self, request, pk=None):
        user = request.user

        if hasattr(user, 'student_profile'):
            return Response({'detail': 'Profile already exists'}, status=status.HTTP_400_BAD_REQUEST)
        user.is_active = True
        user.save()

        serializer = StudentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    #Get hoat dong cua sinh vien (can pk) - TL & CV
    @action(methods=["get"], detail=True, url_path="activities")
    def get_activities(self, request, pk=None):
        user = self.get_object()
        registrations = StudentActivity.objects.select_related("activity").filter(student=user, is_active=True)

        activities = [registration.activity for registration in registrations]

        paginator = paginators.ActivityPaginator()
        page = paginator.paginate_queryset(queryset=activities, request=request)
        if page is not None:
            serializer = ActivitySerializer(page, many=True)
            return paginator.get_paginated_response(serializer.data)

        serializer = ActivitySerializer(activities, many=True)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    #get current user
    @action(methods=['get'], url_path="current-user", detail=False)
    def get_current(self, request):
        return Response(UserSerializer(request.user).data, status=status.HTTP_200_OK)

    @action(detail=False, methods=['get'], url_path='my-activities')
    def my_activities(self, request):
        user = request.user
        status_param = request.query_params.get('status', None)

        student_activities = StudentActivity.objects.filter(student=user)
        if status_param:
            student_activities = student_activities.filter(status=status_param)

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

    @action(detail=True, methods=['get'], url_path='points')
    def points_activity(self, request, pk):
        user = User.objects.get(id=pk)
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


# Bai viet cua dien dan
class BulletinViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView,
                      generics.RetrieveAPIView):
    queryset = Bulletin.objects.filter(is_active=True).order_by('created_date')
    serializer_class = BulletinSerializer
    pagination_class = paginators.BulletinPaginator

    def get_permissions(self):
        if self.action in ['get_post_comment', 'like']:
            permission_classes = [IsStudentUser | IsAssistantUser | IsSpecialistUser]
        elif self.action in ['create', 'update', 'partial_update', 'destroy']:
            permission_classes = [IsAssistantUser | IsSpecialistUser]
        else:
            permission_classes = [permissions.IsAuthenticated]
        return [permission() for permission in permission_classes]

    def get_serializer_class(self):
        if self.request.user.is_authenticated:
            return AuthenticatedBulletinSerializer

        return self.serializer_class

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

    def get_queryset(self):
        queries = self.queryset

        q = self.request.query_params.get("q")
        if q:
            queries = queries.filter(
                Q(title__icontains=q) |
                Q(content__icontains=q)
            )
        return queries

    @action(methods=['get', 'post'], url_path="comments", detail=True)
    def get_post_comment(self, request, pk):
        if request.method == 'GET':
            comments = self.get_object().comment_interactions.select_related('user').all()
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
            AuthenticatedBulletinSerializer(self.get_object(), context={'request': request}).data,
            status=status.HTTP_201_CREATED)


class StatuteViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Statute.objects.filter(is_active=True)
    serializer_class = StatuteSerialier
    permission_classes = [IsAuthenticated]


class SemesterViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Semester.objects.filter(is_active=True)
    serializer_class = SemesterSerializer

    permission_classes = [AllowAny]

    @action(methods=['get'], detail=False, url_path='present')
    def get_present(self, semester):
        data = Semester.objects.filter(is_finished=False).first()
        serializer = self.serializer_class(data)
        return Response(serializer.data, status=status.HTTP_200_OK)


class ActivityViewSet(viewsets.ViewSet, generics.ListCreateAPIView, generics.UpdateAPIView, generics.DestroyAPIView,
                      generics.RetrieveAPIView):
    queryset = Activity.objects.select_related('statute','assistant_creator').filter(is_active=True)
    serializer_class = ActivitySerializer
    pagination_class = ActivityPaginator
    
    def get_permissions(self):
        if self.action in ['register', 'report']:
            permission_classes = [IsStudentUser]
        elif self.action in ['create', 'update', 'destroy', 'students', 'upload-attendance']:
            permission_classes = [IsAssistantUser | IsSpecialistUser]
        else:
            permission_classes = [permissions.IsAuthenticated]
        return [permission() for permission in permission_classes]

    def get_serializer_class(self):
        if self.request.user.is_authenticated:
            return AuthenticatedDetailActivitySerializer
        return ActivitySerializer

    def perform_create(self, serializer):
        serializer.save(assistant_creator=self.request.user)

    def perform_update(self, serializer):
        serializer.save(assistant_creator=self.request.user)

    # dang ky
    @action(methods=['post'], detail=True, url_path='register')
    def register(self, request, pk):
        semester = Semester.objects.filter(is_finished=False).first()
        registration, created = self.get_object().student_activities.get_or_create(user=request.user,
                                                                                   semester=semester)
        if not created:
            registration.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

        serializer = StudentActivitySerializer(registration)
        return Response(data=serializer.data, status=status.HTTP_201_CREATED)

    #lay danh sach sinh vien dang ky
    @action(methods=['get'], detail=True, url_path='students')
    def get_students(self, request, pk):
        student_activity = StudentActivity.objects.filter(activity_id=pk)

        return Response(StudentActivitySerializer(student_activity, many=True).data, status=status.HTTP_200_OK)

    @action(detail=True, methods=['post'], url_path='upload-attendance')
    def upload_attendance(self, request, pk=None):
        activity = self.get_object()
        file = request.FILES.get('file', None)

        if not file or not file.name.endswith(".csv"):
            return Response(data={"detail": "Sai định dạng"}, status=status.HTTP_400_BAD_REQUEST)

        decoded_file = file.read().decode('utf-8').splitlines()
        reader = csv.reader(decoded_file)
        next(reader)  # Bỏ qua hàng tiêu đề

        errors = []
        users = []

        for row in reader:
            email = row[0]  # Truy xuất email từ danh sách các giá trị của hàng

            try:
                user = User.objects.get(email=email)
                users.append(user)
                student_activity = StudentActivity.objects.select_related("user", "activity") \
                    .get(user=user, activity=activity)
                student_activity.status = 'attended'
                student_activity.save()
            except User.DoesNotExist:
                errors.append(f"User with email {email} does not exist.")
                continue

        if errors:
            return Response({'errors': errors, 'users': users}, status=status.HTTP_400_BAD_REQUEST)

        return Response(data={"detail": "Upload điểm danh thành công"}, status=status.HTTP_200_OK)

    @action(methods=['get', 'post'], detail=True, url_path="report")
    def get_or_post_report_missing_activity(self, request, pk):
        activity = self.get_object()
        user = request.user
        student_activity = None
        try:
            student_activity = StudentActivity.objects.get(user=user, activity=activity)
        except StudentActivity.DoesNotExist:
            return Response({"detail": "Student is not registered for this activity."},
                            status=status.HTTP_400_BAD_REQUEST)

        if request.method == 'GET':
            report = MissingActivityReport.objects.get(student_activity=student_activity)
            return Response(MissingActivityReportSerializer(report).data, status=status.HTTP_200_OK)
        elif request.method == 'POST':
            if MissingActivityReport.objects.filter(student_activity=student_activity).exists():
                return Response({"details": "Sinh viên đã báo thiếu"}, status=status.HTTP_400_BAD_REQUEST)
            data = request.data.copy()
            data['student_activity'] = student_activity.id
            serializer = MissingActivityReportSerializer(data=data)

            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class MissingActivityReportViewSet(viewsets.ViewSet, generics.ListAPIView, generics.UpdateAPIView,
                                   generics.RetrieveAPIView):
    queryset = MissingActivityReport.objects.filter(is_active=True)
    serializer_class = MissingActivityReportSerializer

    def get_permissions(self):
        if self.action == ['approve', 'reject']:
            permission_classes = [IsAssistantUser | IsSpecialistUser]
        else:
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]

    @action(methods=["post"], detail=True, url_path="approve")
    def confirm_missing_report(self, request, pk=None):
        missing_report = self.get_object()
        if missing_report.status != 'pending':
            return Response(data={"detail": "Báo thiếu đã được xử lý"}, status=status.HTTP_400_BAD_REQUEST)

        student_activity = missing_report.student_activity

        missing_report.status = 'approved'
        student_activity.status = 'attended'
        missing_report.save()
        student_activity.save()
        serializer = self.serializer_class(missing_report)
        return Response(data=serializer.data, status=status.HTTP_200_OK)

    @action(methods=["post"], detail=True, url_path="reject")
    def reject_missing_report(self, request, pk=None):
        missing_report = self.get_object()
        if missing_report.status != 'pending':
            return Response(data={"detail": "Báo thiếu đã được xử lý"}, status=status.HTTP_400_BAD_REQUEST)

        # missing_report.status = 'rejected'
        missing_report.delete()
        return Response({'details': 'Đã xóa báo thiếu'}, status=status.HTTP_200_OK)


class StudentActivitiesViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = StudentActivity.objects.filter(is_active=True)
    serializer_class = StudentActivitySerializer

    def get_permissions(self):
        if self.action == ['attendance']:
            permission_classes = [IsAssistantUser | IsSpecialistUser]
        else:
            permission_classes = [IsAuthenticated]
        return [permission() for permission in permission_classes]

    @action(methods=["post"], detail=False, url_path="attendance")
    def attendace(self, request):
        file = request.FILES.get("file", None)
        if not file or not file.name.endswith(".csv"):
            return Response(data={"detail": "Vui lòng upload file có định dạng là csv"},
                            status=status.HTTP_400_BAD_REQUEST)

        csv_data = csv.reader(file.read().decode("utf-8").splitlines())
        next(csv_data)
        for row in csv_data:
            user_name, activity_id = row

            try:
                registration = StudentActivity.objects.select_related("user", "activity") \
                    .get(user=user_name, activity_id=activity_id)
            except (Student.DoesNotExist, Activity.DoesNotExist, StudentActivity.DoesNotExist):
                continue

                registration.save()

        return Response(data={"detail": "Upload file điểm danh thành công"}, status=status.HTTP_200_OK)
