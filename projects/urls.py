from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('filtering', views.filtering, name='filtering'),
    path('filter', views.filter, name='filter'),
]

