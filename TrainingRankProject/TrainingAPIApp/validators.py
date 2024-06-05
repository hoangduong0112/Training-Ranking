import re

from rest_framework.exceptions import ValidationError


def validate_email(value):
    value = value.strip().lower()
    pattern = r'^[a-zA-Z0-9._%+-]+@ou\.edu\.vn$'
    if not re.match(pattern, value):
        raise ValidationError('Email must be in the format ...@ou.edu.vn')
    return value


def validate_user_role(value):
    if value == 'ADMIN':
        raise ValidationError("You cannot set the role to 'admin'.")
    return value
