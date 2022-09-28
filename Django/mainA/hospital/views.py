import json

import pandas as pd
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

from hospital.models import HospitalDao


# Create your views here.
def hospitalList():
    dao = HospitalDao()
    res = dao.getHospitalList()
    # print('hospitalList views =>', list)
    print('hospitalList list type =>', type(res))
    lista = []
    lista.append(res)
    print('lista => ',lista)
    return lista

def hospitalSearchList(keyword):
    dao = HospitalDao()
    res = dao.hospitalListTotalSearch(keyword)
    # print('hospitalList views =>', list)
    print('hospitalList list type =>', type(res))
    lista = []
    lista.append(res)
    print('lista => ',lista)
    return lista

def hospitalChart():
    dao = HospitalDao()
    res = dao.getHospitalChart()
    # print('hospitalList views =>', list)
    print('hospitalList list type =>', type(res))
    lista = []
    lista.append(res)
    # print('lista => ',lista)
    return lista

def hospitalLoadJson(request):
    df = hospitalChart() # models.py 에서 나는 리스트 뽑을거니까 그에 해당하는
    # save orient = split
    df.to_json('test.json',orient='split', force_ascii=False)
    f = open('test.json')
    # json으로 다시 불러와서 웹에 커스텀 뷰로 출력하도록 한다.
    aa = json.load(f)
    print(aa)
    # JsonResponse 객체를 사용해서 반환
    # 기본값이 딕셔너리 인데 safe=False  :  딕셔너리 기본값 말고 다른 값도 허용하겠다.
    return JsonResponse(aa, json_dumps_params={'ensure_ascii':False},safe=False)
    # return render(request, 'myjson/test1.html')

def hospitalListJsonP(request):
    # df = hospitalChart()
    df = hospitalList()
    df = pd.DataFrame(df)
    df.to_json('test.json', orient='split', force_ascii=False)
    f = open('test.json')
    # json으로 다시 불러와서 웹에 커스텀뷰로 출력하도록 한다.
    aa = json.load(f)
    # print(aa)
    # callback function 정의하기
    # get 방식으로 전달 되어 온 파라미터의 값

    json_callback = request.GET.get('callback')
    print(f"json_callback => {json_callback}")
    if json_callback:
        #callback(jsonData); 응답객체를 임의로 만들어준다 **
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(aa, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP")
    else:  # 콜백이 아닌것들은 다 이곳으로 !
        response = JsonResponse(aa, json_dumps_params={'ensure_ascii':False},safe=False)
        print("Json")
    return response

def hospitalListChartJsonP(request):
    df = hospitalChart()
    df = pd.DataFrame(df)
    df.to_json('test.json', orient='split', force_ascii=False)
    f = open('test.json')
    # json으로 다시 불러와서 웹에 커스텀뷰로 출력하도록 한다.
    aa = json.load(f)
    # print(aa)
    # callback function 정의하기
    # get 방식으로 전달 되어 온 파라미터의 값

    json_callback = request.GET.get('callback')
    print(f"json_callback => {json_callback}")
    if json_callback:
        #callback(jsonData); 응답객체를 임의로 만들어준다 **
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(aa, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP")
    else:  # 콜백이 아닌것들은 다 이곳으로 !
        response = JsonResponse(aa, json_dumps_params={'ensure_ascii':False},safe=False)
        print("Json")
    return response

def hospitalListTotalSearch(request):
    keyword = request.GET.get('keyword')
    print('keyword =>', keyword)
    df = hospitalSearchList(keyword)
    print('keyword =>', keyword)
    df = pd.DataFrame(df)
    df.to_json('test.json', orient='split', force_ascii=False)
    f = open('test.json')
    aa = json.load(f)

    json_callback = request.GET.get('callback')
    print(f"json_callback => {json_callback}")
    if json_callback:
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(aa, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP")
    else:  # 콜백이 아닌것들은 다 이곳으로 !
        response = JsonResponse(aa, json_dumps_params={'ensure_ascii':False},safe=False)
        print("Json")
    return response


def hospital_chart_json(request):
    return render(request, 'hospital/hospital_chart_json.html')