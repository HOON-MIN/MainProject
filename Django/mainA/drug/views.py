from __future__ import print_function
import time
from django.shortcuts import render
from google.cloud import vision
from google.cloud.vision_v1 import types
import os
import io
#----------------------------------------------------
from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
import pandas as pd
import json
import keras
import cv2 as cv
from PIL import Image
import numpy as np
from django.views.decorators.csrf import csrf_exempt

UPLOAD_DIR = 'static/testDrugImg/'

def testinputpage(request):
    # file = request.FILES['mfile']
    # print(file)
    return render(request, "drug/inputImg.html")

@csrf_exempt
def json_Drug_Extract(request):
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'G:/usbkosmo/최종finalProject/장고/maina-363406-51a99b6a135d.json'
    client = vision.ImageAnnotatorClient()

    print("파일검출 시작 ")

    file = request.FILES['mfile']

    file_name = file._name

    fp = open(UPLOAD_DIR + file_name, 'wb')
    for chunk in file.chunks():
        fp.write(chunk)
    fp.close();
    print(file_name)



    drug_Shape_Extract_Model = keras.models.load_model('static/aiModel/drug_shape_model2.h5')
    drug_Color_Extract_Model = keras.models.load_model('static/aiModel/drug_color_model.h5')
    #-------test code-------------------------------------
    #drug_Shape_Extract_Model = keras.models.load_model('static/aiModel/drug_shape_model2.h5')
    image = Image.open(UPLOAD_DIR+file_name)
    #image = Image.open('static/testDrugImg/A11AKP08C0146.jpg')
    image = image.convert("RGB")
    image = image.resize((240,128))
    image = np.array(image)
    #print(image.dtype)
    #print(image)
    #print(image = image.astype('float32') / 255
    image = image.astype('float32') / 255
    #print(image)
    #print(drug_Shape_Extract_Model.predict(image.reshape(1,128,240,3)).argmax(axis=1))
    # -------test code-------------------------------------
    colorImg = image.copy()
    shapePredictItem = drug_Shape_Extract_Model.predict(image.reshape(1, 128, 240, 3)).argmax(axis=1).item()
    colorPredictItem = drug_Color_Extract_Model.predict(colorImg.reshape(1, 128, 240, 3)).argmax(axis=1).item()
    #--------------shape search-----------
    if shapePredictItem == 0:
        shape = "원형"
    elif shapePredictItem == 1:
        shape = "삼각형"
    elif shapePredictItem == 2:
        shape = "사각형"
    #-------------color search--------------
    # white : 하양 0, red : 1 ,green : 2 , # blue : 3
    if colorPredictItem == 0:
        color = "하양"
    elif colorPredictItem == 1:
        color = "빨강"
    elif colorPredictItem == 2:
        color = "초록"
    elif colorPredictItem == 4:
        color = "파랑"
    print(f"shape : {shape}")
    print(f"color : {color}")

    # --------------------------Google Cloud Vision OCR------------------
    os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'G:/usbkosmo/최종finalProject/장고/maina-363406-51a99b6a135d.json'
    client = vision.ImageAnnotatorClient()
    filenames = UPLOAD_DIR+file_name
    with io.open(filenames, 'rb') as image_file:
        content = image_file.read()
    image = types.Image()
    image = vision.Image(content=content)
    response = client.label_detection(image=image)
    # for label in response.label_annotations:
    #     print("Label: ",label.description, "/ score: ", label.score)
    # Performs text detection on the image file

    # !!!!!구글 클라우드 vision API을 을 활용한  ocr 결과 확인
    response = client.text_detection(image=image)
    texts = response.text_annotations
    print(f'추출 식별 문자 : {texts[1].description}')
    if texts[1].description == None:
        identificationChar =""
    else:
        identificationChar = texts[1].description
    #실제 서비스시 [1]
    #----------------------------------------------------------------------------------------------------------------------

    result_predict_df = pd.DataFrame({'shape':[shape],
                                      'color':[color],
                                      'identificationChar': identificationChar})

    result_predict_df[['shape','color','identificationChar']].to_json('test.json', orient='split',force_ascii=False)
    f = open('test.json',encoding="UTF-8")
    aa = json.load(f)
    print(f"aa : {aa}")
    # callback function 정의
    # get방식으로 전달 되어 온 파라미터의 값
    json_callback = request.GET.get('callback')
    print(f'json_callback => {json_callback}')
    if json_callback:
        response = HttpResponse("%s(%s);" % (json_callback, json.dumps(aa, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("JsonP")
    else:
        response = JsonResponse(aa, json_dumps_params={'ensure_ascii':False}, safe=False)
        print("Json")

    return response



    # return render(request, "drug/resultDrugInfo.html", {"shape" : shape , "color" : color})