from django.urls import path
#importing views from the current folder
from . import views

#list object to map various urls to their view functions
urlpatterns = [
    path('', views.index),
    path('new', views.new)
]