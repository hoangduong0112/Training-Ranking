from rest_framework import serializers, request

from . import models
from .models import Department, Klass, Semester, User, Statute, Student, Activity, Like, Comment, Bulletin, \
    StudentActivity, MissingActivityReport
from .validators import *


# Image serializer
class ImageSerializer(serializers.ModelSerializer):
    def to_representation(self, instance):
        data = super().to_representation(instance)
        image = data.get("image")

        if "image" in self.fields and image:
            data["image"] = instance.image.url

        return data


class KlassSerializer(serializers.ModelSerializer):
    class Meta:
        model = Klass
        fields = ['id', 'klass_name', 'department']


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['id', 'department_name']


class SemesterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Semester
        fields = ['id', 'semester_name', 'description', 'is_finished']


class StatuteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Statute
        fields = '__all__'


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['student_code', 'phone', 'student_class', 'student_department']


class UserSerializer(serializers.ModelSerializer):
    # Khong can thiet
    USER_CHOICES = (
        ('SV', 'Sinh Viên'),
        ('TLSV', 'Trợ Lý Sinh Viên'),
        ('CV', 'Chuyên viên CTSV')
    )

    user_role = serializers.ChoiceField(choices=USER_CHOICES, validators=[validate_user_role])
    email = serializers.CharField(validators=[validate_email])

    class Meta:
        model = User
        fields = ['id', 'email', 'password', 'avatar', 'user_role', 'first_name', 'last_name']
        extra_kwargs = {'password': {'write_only': True}}

    # def validate_user_role(self, value):
    #     if value == 'ADMIN':
    #         raise serializers.ValidationError("You cannot set the role to 'admin'.")
    #     return value

    def to_representation(self, instance):
        data = super().to_representation(instance)
        avatar = data.get("avatar")

        if "avatar" in self.fields and avatar:
            data["avatar"] = instance.avatar.url

        return data

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user

class ActivitySerializer(serializers.ModelSerializer):
    assistant_creator = UserSerializer(read_only=True)

    class Meta:
        model = Activity
        fields = ['id', 'title', 'date_register', 'location', 'description', 'points', 'statute',
                  'assistant_creator']
        read_only_fields = ['assistant_creator']
        date_register = serializers.DateTimeField(format='%Y-%m-%d %H:%M', input_formats=['%Y-%m-%d %H:%M'])



class AuthenticatedDetailActivitySerializer(ActivitySerializer):
    status = serializers.SerializerMethodField()

    def get_status(self, activity):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            student_activity = activity.student_activities.filter(user=request.user).first()
            if student_activity:
                return student_activity.status

        return None

    class Meta:
        model = Activity
        fields = ['id', 'title', 'date_register', 'location', 'description', 'points', 'statute', 'status', 'assistant_creator']


class StudentActivitySerializer(serializers.ModelSerializer):
    registered_students = serializers.SerializerMethodField(read_only=True)

    class Meta:
        model = StudentActivity
        fields = ['user', 'activity', 'semester', 'status', 'registered_students']
        read_only_fields = ['status']


    def get_registered_students(self, obj):
        user = obj.user
        return user.email if user else None




    def create(self, validated_data):
        validated_data['status'] = 'registered'

        return super().create(validated_data)
class StudentActivityDetailSerializer(serializers.ModelSerializer):
    activity = ActivitySerializer()

    class Meta:
        model = StudentActivity
        fields = ['activity', 'status']


# interaction
class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Like
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Comment
        fields = '__all__'

class BulletinSerializer(ImageSerializer):
    author = UserSerializer(read_only=True)
    class Meta:
        model = Bulletin
        fields = ['id', 'title', 'content', 'image', 'activity', 'is_active', 'created_date', 'updated_date', 'author']
        read_only_fields = ['author']


class AuthenticatedBulletinSerializer(BulletinSerializer):
    liked = serializers.SerializerMethodField()

    def get_liked(self, bulletin):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return bulletin.like_interactions.filter(user=request.user, is_active=True).exists()

    class Meta:
        model = BulletinSerializer.Meta.model
        fields = list(BulletinSerializer.Meta.fields) + ['liked']

    # def save(self, **kwargs):
    #     author = self.context["request"].user
    #     return super().save(**kwargs)

class StatuteSerialier(serializers.ModelSerializer):
    class Meta:
        model = Statute
        fields = ['id', 'statute_name', 'max_point', 'description']

class SemesterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Semester
        fields = '__all__'
class StatutePointsSerializer(serializers.Serializer):
    statute = serializers.IntegerField()
    total_points = serializers.IntegerField()

    class Meta:
        fields = ['statute', 'total_points']

class SemesterStatutePointsSerializer(serializers.Serializer):
    semester_name = serializers.CharField()
    points_by_statute = StatutePointsSerializer(many=True)

    class Meta:
        fields = ['semester_name', 'points_by_statute']

class MissingActivityReportSerializer(serializers.ModelSerializer):
    class Meta:
        model = MissingActivityReport
        fields = ['id' ,'student_activity', 'reason', 'proof', 'status']
        read_only_fields = ['status']


def to_representation(self, instance):
    data = super().to_representation(instance)
    image = data.get("proof")

    if "proof" in self.fields and image:
        data["proof"] = instance.image.url

    return data
