from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('new',views.new),
    path('user', views.get_tickets_by_user)

]