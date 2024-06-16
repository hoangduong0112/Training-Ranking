from rest_framework.pagination import PageNumberPagination

class ActivityPaginator(PageNumberPagination):
    page_size = 4

class CommentPaginator(PageNumberPagination):
    page_size = 4

class BulletinPaginator(PageNumberPagination):
    page_size = 5
