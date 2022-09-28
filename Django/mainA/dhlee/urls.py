from django.urls import path

from dhlee import views

urlpatterns = [
    path('', views.index),
    path('chart1', views.chart1),
    path('chart2', views.covidchart),
    path('chart3', views.covidchart2),
    path('covidres', views.covidresult),
    path('covidradar', views.covidradar),
    path('covidpie', views.covidpie),
]