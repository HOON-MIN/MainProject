import json

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
import requests

# Create your views here.
def index(request):
    return render(request, "dhlee/index.html")

def covidresult(request):
    json_callback = request.GET.get('callback')
    print(f'json_callback => {json_callback}')
    userid = request.GET['id']
    #res_folder = '/home/kosmo113/MainProject/COVID19/Result/'
    res_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/Result/'

    with open(res_folder + userid + '_result.json', 'r') as file:
        resjson = json.load(file)
        print("Ubuntu:Resultjson=>", resjson['data'])

    if json_callback:
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(resjson, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP!")
    else:
        response = JsonResponse(resjson, json_dumps_params={'ensure_ascii': False}, safe=False)
        print("Json")

    return response

def covidradar(request):
    json_callback = request.GET.get('callback');
    print(f'json_callback => {json_callback}')
    # res_folder = '/home/kosmo113/MainProject/COVID19/'
    res_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/'

    with open(res_folder + 'agecovid.json', 'r') as file:
        agecovid = json.load(file)
        print("Ubuntu:agecovid=>", agecovid)

    if json_callback:
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(agecovid, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP!")
    else:
        response = JsonResponse(agecovid, json_dumps_params={'ensure_ascii': False}, safe=False)
        print("Json")
    return response

def covidpie(request):
    json_callback = request.GET.get('callback')
    print(f'json_callback => {json_callback}')
    res_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/'
    with open(res_folder + 'agegen.json') as file:
        agegen = json.load(file)
        print("Ubuntu:agegen=>",agegen)

    if json_callback:
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(agegen, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP!")
    else:
        response = JsonResponse(agegen, json_dumps_params={'ensure_ascii': False}, safe=False)
        print("Json")
    return response


def chart1(request):
    return render(request, "dhlee/chart1.html")

def covidchart(request):
    return render(request, "dhlee/covidchart1.html")

def covidchart2(request):
    return render(request, 'dhlee/covidchart2.html')