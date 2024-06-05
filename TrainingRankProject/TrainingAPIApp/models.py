from django.db import models
from django.contrib.auth.models import AbstractUser
from cloudinary.models import CloudinaryField

from .managers import CustomUserManager
from django.utils.translation import gettext_lazy as _


# Create your models here.
class BaseModel(models.Model):
    created_date = models.DateField(auto_now_add=True)
    updated_date = models.DateField(auto_now=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Semester(BaseModel):
    semester_name = models.CharField(max_length=10, unique=True)
    description = models.CharField(max_length=25)
    is_finished = models.BooleanField()

    def __str__(self):
        return self.semester_name


class Department(BaseModel):
    department_name = models.CharField(max_length=255)

    def __str__(self):
        return self.department_name


class Klass(BaseModel):
    klass_name = models.CharField(max_length=255)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

    def __str__(self):
        return self.klass_name


class Statute(BaseModel):
    statute_name = models.CharField(max_length=20)
    max_point = models.PositiveSmallIntegerField()
    description = models.TextField()

    def __str__(self):
        return self.statute_name

class User(AbstractUser):
    email = models.EmailField(unique=True)
    avatar = CloudinaryField('avatar', null=True, blank=True)

    class UserRole(models.TextChoices):
        ADMIN = "ADMIN", _("Admin")
        STUDENT = "SV", _("Sinh Viên")
        ASSISTANT = "TLSV", _("Trợ Lý Sinh Viên")
        SPECIALIST = "CV", _("Chuyên viên CTSV")

    user_role = models.CharField(max_length=5, choices=UserRole.choices, default=UserRole.STUDENT)

    username = None

    user_permissions = models.ManyToManyField(
        'auth.Permission',
        verbose_name=_('user permissions'),
        blank=True,
        help_text=_('Specific permissions for this user.'),
        related_name='training_api_app_user_permissions'
    )

    groups = models.ManyToManyField(
        'auth.Group',
        verbose_name=_('groups'),
        blank=True,
        help_text=_(
            'The groups this user belongs to. A user will get all permissions '
            'granted to each of their groups.'
        ),
        related_name='training_api_app_users'  # Set related name avoid bug
    )

    objects = CustomUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    class Meta:
        verbose_name = _("User")
        verbose_name_plural = _("Users")
        permissions = [
            ("create_student_account", "Can create student account"),
            ("create_assistant_account", "Can create assistant account"),
            ("create_specialist_account", "Can create specialist account")
        ]

    def __str__(self):
        return self.email

    @property
    def original_role(self):
        return self.UserRole.labels[self.UserRole.values.index(self.user_role)]

    def has_in_group(self, name=None):
        return self.groups.filter(name=name).exists()

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='student_profile')
    student_code = models.CharField(max_length=10, null=True, blank=True, unique=True, db_index=True, editable=False)
    phone = models.CharField(max_length=255)
    student_class = models.ForeignKey(Klass, on_delete=models.CASCADE)
    student_department = models.ForeignKey(Department, on_delete=models.CASCADE)
    def __str__(self):
        return self.code


class Activity(BaseModel):
    title = models.CharField(max_length=100)
    date_register = models.DateTimeField()
    location = models.CharField(max_length=150)
    description = models.TextField()
    points = models.PositiveSmallIntegerField()
    statute = models.ForeignKey(Statute, on_delete=models.CASCADE)
    student = models.ManyToManyField(User, 'StudentActivity', blank=True)
    assistant_creator = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.activity_title


class StudentActivity(BaseModel):
    STATUS_CHOICES = (
        ('registered', 'Đã đăng ký'),
        ('attended', 'Đã tham gia'),
        ('missing_reported', 'Báo thiếu')
    )
    student = models.ForeignKey(User, on_delete=models.CASCADE)
    activity = models.ForeignKey(Activity, on_delete=models.CASCADE)
    semester = models.ForeignKey(Semester, on_delete=models.CASCADE)
    status = models.CharField(max_length=25, choices=STATUS_CHOICES, default='registered')


class MissingActivityReport(BaseModel):
    student_activity = models.ForeignKey(StudentActivity, on_delete=models.CASCADE)
    reason = models.TextField()
    proof = CloudinaryField(null=True, blank=True)
    STATUS_CHOICES = (
        ('pending', 'Đang chờ'),
        ('approved', 'Đã duyệt'),
        ('rejected', 'Đã bị từ chối')
    )
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='pending')


class Bulletin(BaseModel):
    title = models.CharField(max_length=100)
    content = models.TextField()
    image = CloudinaryField(null=True, blank=True)
    author = models.ForeignKey(User, on_delete=models.CASCADE)


    def __str__(self):
        return self.title


class Interaction(BaseModel):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    bulletin = models.ForeignKey(Bulletin, on_delete=models.CASCADE)

    class Meta:
        abstract = True


class Like(Interaction):

    class Meta:
        unique_together = ('user', 'bulletin')


class Comment(Interaction):
    content = models.CharField(max_length=255)
