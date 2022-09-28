from django.urls import path

from hospital import views

urlpatterns = [
    path('hospitalList',views.hospitalList),
    path('hospitalListJsonP',views.hospitalListJsonP),
    path('hospitalListChartJsonP',views.hospitalListChartJsonP),
    path('hospital_chart_json',views.hospital_chart_json),
    path('hospitalLoadJson',views.hospitalLoadJson),
    path('hospitalChart',views.hospitalChart),
    path('hospitalListTotalSearch', views.hospitalListTotalSearch),

]