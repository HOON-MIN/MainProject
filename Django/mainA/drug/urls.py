
from django.urls import path

from drug import views

urlpatterns = [
    path("json_Drug_Extract", views.json_Drug_Extract),
    path("drugForm", views.testinputpage),

]
