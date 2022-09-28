from __future__ import print_function
from google.cloud import vision
from google.cloud.vision_v1 import types
import os
import io

from PIL import Image
import  matplotlib.pyplot as plt
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'G:/usbkosmo/최종finalProject/장고/maina-363406-51a99b6a135d.json'
client = vision.ImageAnnotatorClient()
# img = Image.open('static/testDrugimg/2009071503519.jpg')
# plt.imshow(img)
filenames = os.path.join(os.path.dirname(__file__), 'static/testDrugimg/2009071505607.jpg')

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

print('Texts:')
for text in texts:
    print(text.description)




