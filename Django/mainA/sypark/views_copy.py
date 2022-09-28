from collections import Counter

from PIL import Image
from django.core.paginator import Paginator
from django.shortcuts import render, redirect
from numpy import double

from sypark.models import Main
import numpy as np
import matplotlib.pyplot as plt
from wordcloud import wordcloud, WordCloud
import math
# Create your views here.

# 워드클라우드 / 최근 영화 후기 사용 단어 빈도, 영화 후기 갯수및 평점 분석
def dashboard(request):
    # 워드클라우드
    main = Main()
    wordv = main.recentreviews()
    listwordv = list(wordv)
    wordv=",".join(''.join(res) for res in listwordv)
    wordv = wordv.replace('\r\n', ' ')
    wordv = wordv.split(' ')
    stop_word = ["너무","바로","다른","받고","정말","다시","모두","가","있어서","를","사실","전에","갔는데"
                 ,"없이","조금","하고","앞으로","해주셔서","있는","엄청","모두","많이","받았는데"
                 ,"받을","해서","저는"]
    wordv_total = []
    for tag in wordv:
        if tag not in stop_word and len(tag) > 1:
            wordv_total.append(tag)
    print(wordv_total[:100])
    print("*"*30)
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
    plt.figure(figsize=(25, 15)) # 이미지 사이즈
    plt.imshow(worldcloudv)
    plt.axis('off') # x y 축 숫자 제거
    plt.savefig('static/dashboard/img/wordcnt.png')  # 저장하는데, 넢어 씌우는 것

    # 병원 후기중 후기 평가 평균 별점 높은 순서의 병원 리스트
    review_grade = main.reviewgrade()
    print(f"grade=> {review_grade}")

    # 차트용: 연간의료소비액 테이블에서 연도및 한국소비금액 정보 가져옴
    medicalspending_list = main.medicalspending()
    print(medicalspending_list)
    print(type(medicalspending_list))
    dict1={}
    dict2=dict(medicalspending_list)
    for i,v in dict2.items():
        dict1[i]=v
    print(dict1)
    return render(request, 'sypark/dashboard.html',{'wordv_cnt_totalList': wordv_cnt_totalList, 'review_grade': review_grade, 'medicalspending_list': dict1})