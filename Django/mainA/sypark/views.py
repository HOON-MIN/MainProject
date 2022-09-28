from collections import Counter

from PIL import Image
from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from numpy import double
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
import pandas as pd
import json

from sypark.models import Main
import numpy as np
import matplotlib.pyplot as plt
from wordcloud import wordcloud, WordCloud
import math
# Create your views here.

# 워드클라우드
def wordcnt_dashboard():
    main = Main()
    wordv = main.recentreviews()
    listwordv = list(wordv)
    wordv = ",".join(''.join(res) for res in listwordv)
    wordv = wordv.replace('\r\n', ' ')
    wordv = wordv.split(' ')
    stop_word = ["너무", "바로", "다른", "받고", "정말", "다시", "모두", "가", "있어서", "를", "사실", "전에", "갔는데"
        , "없이", "조금", "하고", "앞으로", "해주셔서", "있는", "엄청", "모두", "많이", "받았는데"
        , "받을", "해서", "저는","대해", "보고","많아서","있었는데"]
    wordv_total = []
    for tag in wordv:
        if tag not in stop_word and len(tag) > 1:
            wordv_total.append(tag)
    print(wordv_total[:100])
    print("*" * 30)
    # 전처리 끝
    # 집계
    word_cnt = Counter(wordv_total)
    # most_common() : 빈도수 상위 n 개
    print(f'most_common() =>{word_cnt.most_common(50)}')
    wordv_cnt_totalList = word_cnt.most_common(50)
    print(f'wordv => {wordv_cnt_totalList}')
    word_cnt_bg = np.array(Image.open('sypark/static/wcnt/cloud1.png'))

    print(f"num Array =>{word_cnt_bg}")
    font_location = '/usr/share/fonts/truetype/nanum/NanumGothic.ttf'
    worldcloudv = WordCloud(font_path=font_location, background_color='white',
                            mask=word_cnt_bg, colormap='Blues',
                            max_words=60, relative_scaling=0.3, width=800, height=450
                            ).generate_from_frequencies(word_cnt)
    plt.figure(figsize=(25, 15))  # 이미지 사이즈
    plt.imshow(worldcloudv)
    plt.axis('off')  # x y 축 숫자 제거
    plt.savefig('static/dashboard/img/wordcnt1.png')  # 저장하는데, 덮어 씌우는 것
    path = "../static/dashboard/img/wordcnt1.png"
    #return path

# 워드클라우드 JsonP
def jsonP_word(request):
    wordcnt_dashboard()

# 병원 후기중 후기 평가 평균 별점 높은 순서의 병원 리스트
# sql = "select row_number() over (order by avg(likes) desc) as num,
# hname, avg(likes) as avg from reviewboard group by hname limit 10"
def list_dashboard(request):
    main = Main()
    review_grade = main.reviewgrade()
    print(f"grade=> {review_grade}")
    df = pd.DataFrame(review_grade)
    df.to_json('test.json',orient='split',force_ascii=False)
    f = open('test.json')
    # json으로 다시 불러와서 웹에 커스텀뷰로 출력하도록 한다.
    aa = json.load(f)
    print(aa)
    # callback function 정의하기
    # get 방식으로 전달 되어 온파라미터의 값
    json_callback =request.GET.get('callback')
    print('json_callback => ',json_callback)
    if json_callback:
        #callback(jsonData); 응답객체를 임의로 만들어준다 **
        response = HttpResponse('%s(%s);' % (json_callback,json.dumps(aa,ensure_ascii=False)))
        response['Content-Type'] = "text/javascript; charset=utf-8"
        print('JsonP')
    else:
        response = JsonResponse(aa,json_dumps_params={'ensure_ascii':False},safe=False)
        print('Json')
    return response

# 차트용: 연간의료소비액 테이블에서 연도및 한국소비금액 정보 가져옴
def chart_dashboard(request):
    main = Main()
    medicalspending_list = main.medicalspending()
    print(medicalspending_list)
    print(type(medicalspending_list))
    dict1 = {}
    dict2 = dict(medicalspending_list)
    for i, v in dict2.items():
        dict1[i] = v
    print(dict1)
    list1 = []
    list2 = []
    for k, v in dict1.items():
        list1.append(k)
        list2.append(v)
    df = pd.DataFrame([list2,list1])
    df.to_json('test.json', orient='split', force_ascii=False)
    f = open('test.json')
    # json으로 다시 불러와서 웹에 커스텀뷰로 출력하도록 한다.
    aa = json.load(f)
    print(aa)
    # callback function 정의하기
    # get 방식으로 전달 되어 온파라미터의 값
    json_callback = request.GET.get('callback')
    print('json_callback => ', json_callback)
    if json_callback:
        # callback(jsonData); 응답객체를 임의로 만들어준다 **
        response = HttpResponse('%s(%s);' % (json_callback, json.dumps(aa, ensure_ascii=False)))
        response['Content-Type'] = "text/javascript; charset=utf-8"
        print('JsonP')
    else:
        response = JsonResponse(aa, json_dumps_params={'ensure_ascii': False}, safe=False)
        print('Json')

    return response