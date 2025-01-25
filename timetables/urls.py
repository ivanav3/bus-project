from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('new',views.new),
    path('cities',views.cities),
    path('users',views.users),
    path('user/new',views.new_user),
    path('user/login',views.login_user),
    path('user/delete',views.delete_user),
    path('user/verify',views.verify_user),
    path('user/resetPassword',views.update_password)
]