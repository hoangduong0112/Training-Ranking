from rest_framework import permissions

class IsAdminUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.user_role == 'ADMIN'


class IsStudentUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.user_role == 'SV'


class IsAssistantUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.user_role == 'TLSV'


class IsSpecialistUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and request.user.user_role == 'CV'


class IsAssistantOrSpecialistUser(permissions.BasePermission):
    def has_permission(self, request, view):
        return request.user and request.user.is_authenticated and (request.user.user_role == 'TLSV' or request.user.user_role == 'CV')

class CanCreateUser(permissions.BasePermission):
    def has_permission(self, request, view):
        user_role = request.data.get('user_role')
        if request.user.user_role == 'ADMIN':
            return True
        if request.user.user_role == 'CV' and user_role == 'TLSV':
            return True
        if user_role == 'TLSV':
            return False
        return True
