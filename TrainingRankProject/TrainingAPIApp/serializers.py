from rest_framework import serializers

from . import models
from .models import Department, Klass, Semester, User, Statute, Student, Activity, Like, Comment, Bulletin
from .validators import *

#Image serializer
class ImageSerializer(serializers.ModelSerializer):
    def to_representation(self, instance):
        rep = super().to_representation(instance)
        rep['image'] = instance.image.url

        return rep


class KlassSerializer(serializers.ModelSerializer):
    class Meta:
        model = Klass
        fields = '__all__'


class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = '__all__'


class SemesterSerializer(serializers.ModelSerializer):
    class Meta:
        model = Semester
        field = '__all__'



class StatuteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Statute
        field = '__all__'

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['student_code', 'phone', 'student_class', 'student_department']

class UserSerializer(serializers.ModelSerializer):
    #Khong can thiet
    USER_CHOICES = (
        ('SV', 'Sinh Viên'),
        ('TLSV', 'Trợ Lý Sinh Viên'),
        ('CV', 'Chuyên viên CTSV')
    )

    user_role = serializers.ChoiceField(choices=USER_CHOICES, validators=[validate_user_role])
    email = serializers.CharField(validators=[validate_email])
    class Meta:
        model = User
        fields = ['email', 'password', 'avatar', 'user_role']
        extra_kwargs = {'password': {'write_only': True}}

    # def validate_user_role(self, value):
    #     if value == 'ADMIN':
    #         raise serializers.ValidationError("You cannot set the role to 'admin'.")
    #     return value

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        return user


class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = ['student_code', 'phone', 'student_class', 'student_department']

class UserRegistrationSerializer(serializers.Serializer):
    user = UserSerializer()
    student = StudentSerializer()

    def create(self, validated_data):
        user_data = validated_data.pop('user')
        user = User.objects.create_user(**user_data)
        student_data = validated_data.pop('student')
        student = Student.objects.create(user=user, **student_data)
        return user

class ActivitySerializer(serializers.ModelSerializer):
    class Meta:
        model = Activity
        fields = ['id', 'name', 'time','location', 'description', 'points', 'assistant_creator']

        time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', input_formats=['%Y-%m-%d %H:%M'])
        expiration_time = serializers.DateTimeField(format='%Y-%m-%d %H:%M', input_formats=['%Y-%m-%d %H:%M'])

#interaction
class LikeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Like
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'

class BulletinSerializer(ImageSerializer):
    class Meta:
        model = Bulletin
        fields = '__all__'

class BulletinDetailSerializer(BulletinSerializer):
    liked = serializers.SerializerMethodField()

    def get_liked(self, bulletin):
        request = self.context.get('request')
        if request and request.user.is_authenticated:
            return bulletin.like_set.filter(tai_khoan=request.user, active=True).exists()

    class Meta:
        model = BulletinSerializer.Meta.model
        fields = list(BulletinSerializer.Meta.fields) + ['liked']


