from django.urls import path

from sypark import views
# http://localhost:9000/address/write ==> views.py write() 호출
urlpatterns = [
    # path('medicalspending',views.medicalspending),
    # path('charts', views.charts),
    # path('dashboard', views.dashboard),
    path('wordcnt_dashboard', views.wordcnt_dashboard),
    path('jsonP_word', views.jsonP_word),
    path('list_dashboard', views.list_dashboard),
    path('chart_dashboard', views.chart_dashboard),
]