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
        if not request.user.is_authenticated:
            if user_role == 'SV':
                return True
        elif request.user.user_role in ['ADMIN', 'CV']:
            return True
        elif request.user.user_role == 'TLSV':
            return False
        return False


class IsOwnerOrCVOrTLSV(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.user.user_role in ['CV', 'TLSV']:
            return True

        if request.user.user_role == 'SV' and obj.author == request.user:
            return True

        return False
