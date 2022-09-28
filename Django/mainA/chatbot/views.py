from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt

import json
import numpy as np
import random

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Embedding, GlobalAveragePooling1D
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from sklearn.preprocessing import LabelEncoder

def home(request):
    context = {}

    return render(request, "chathome.html", context)

@csrf_exempt
def chattrain(request):
    context = {}

    print('chattrain ---> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++')

    # file = open(f"{CURRENT_WORKING_DIRECTORY}intents.json", encoding="UTF-8")
    file = open(f"./static/intents.json", encoding="UTF-8")
    data = json.loads(file.read())

    # js = json.loads(data.decode("utf-8"))

    training_sentences = [] #["안녕", "반가워", "도와줘", "이거", "안녕~~"],["잘가", "또 올게", "다음에 봐"],
    training_labels = [] #["greeting","greeting","greeting","greeting","greeting"], ["goodbye", "goodbye", "goodbye"]
    labels = [] #["greeting"],["goodbye"]
    responses = [] #["반가워요", "안녕하세요", "안녕하세요. 반갑습니다.", "하이루!"],["잘가세요~", "다음에 또 뵈요", "다음에 또 뵙길바랍니다"]

    for intent in data['intents']:
        for pattern in intent['patterns']:
            training_sentences.append(pattern)
            training_labels.append(intent['tag'])
        responses.append(intent['responses'])

        if intent['tag'] not in labels:
            labels.append(intent['tag'])

    num_classes = len(labels)

    lbl_encoder = LabelEncoder() # 데이터를 수치형으로 변환[0,1]
    lbl_encoder.fit(training_labels) #["greeting","greeting","greeting","greeting","greeting"], ["goodbye", "goodbye", "goodbye"] #[1,1,1,1,1]
    training_labels = lbl_encoder.transform(training_labels)

    vocab_size = 1000
    embedding_dim = 16
    max_len = 20
    oov_token = "<OOV>"

    tokenizer = Tokenizer(num_words=vocab_size, oov_token=oov_token)
    tokenizer.fit_on_texts(training_sentences)
    word_index = tokenizer.word_index
    sequences = tokenizer.texts_to_sequences(training_sentences)
    padded_sequences = pad_sequences(sequences, truncating='post', maxlen=max_len)

    # Model Training

    model = Sequential()
    model.add(Embedding(vocab_size, embedding_dim, input_length=max_len))
    model.add(GlobalAveragePooling1D())
    model.add(Dense(16, activation='relu'))
    model.add(Dense(16, activation='relu'))
    model.add(Dense(num_classes, activation='softmax'))

    model.compile(loss='sparse_categorical_crossentropy',
                  optimizer='adam', metrics=['accuracy'])

    model.summary()

    epochs = 500
    history = model.fit(padded_sequences, np.array(training_labels), epochs=epochs)

    # to save the trained model
    model.save("static/chat_model")

    import pickle

    import colorama
    colorama.init()
    from colorama import Fore, Style, Back

    # to save the fitted tokenizer
    with open('static/tokenizer.pickle', 'wb') as handle:
        pickle.dump(tokenizer, handle, protocol=pickle.HIGHEST_PROTOCOL)

    # to save the fitted label encoder
    with open('static/label_encoder.pickle', 'wb') as ecn_file:
        pickle.dump(lbl_encoder, ecn_file, protocol=pickle.HIGHEST_PROTOCOL)

    context['result_msg'] = 'Success'
    return JsonResponse(context, content_type="application/json")

@csrf_exempt
def chatanswer(request):
    context = {}
    questext = request.GET['questext']
    json_callback = request.GET.get('callback')
    print(f'json_callback => {json_callback}')

    # 라이브러리 추가
    import pickle

    import colorama
    colorama.init()
    from colorama import Fore, Style, Back

    file = open(f"./static/intents.json", encoding="UTF-8")
    data = json.loads(file.read())

    def chat3(inp):
        # 훈련모델 불러오기
        model = keras.models.load_model('static/chat_model')

        # tokenizer 객체 불러오기
        with open('static/tokenizer.pickle', 'rb') as handle:
            tokenizer = pickle.load(handle)

        # 라벨인코더 객체 불러오기
        with open('static/label_encoder.pickle', 'rb') as enc:
            lbl_encoder = pickle.load(enc)

        max_len = 20

        print(Fore.LIGHTBLUE_EX + "User: " + Style.RESET_ALL, end="")

        result = model.predict(keras.preprocessing.sequence.pad_sequences(tokenizer.texts_to_sequences([inp]),
                                                                          truncating='post', maxlen=max_len))

        tag = lbl_encoder.inverse_transform([np.argmax(result)])

        for i in data['intents']:
            if i['tag'] == tag:
                txt1 = np.random.choice(i['responses'])
                print(Fore.GREEN + "Meditok: "+Style.RESET_ALL, txt1)

        return txt1

    anstext = chat3(questext)
    print(anstext)

    anstextarr = []
    splitlist = []
    urllist = []
    namelist = []
    # url 전처리http://
    if anstext[0:4] == 'http': #["http://localhost:83?cnum=1@365미소내과의원", "http//localhost:83?cnum=8@정든의원", "http//localhost:83?cnum=8@중앙대학교병원"]
        anstextarr = anstext.split(',')
        anslen = len(anstextarr)
        print('anslen=>',anslen)
        for e in anstextarr:
            splitlist = e.split('@')
            print('splitlist->',splitlist[0])
            for s in splitlist:
                if s[0:4] == 'http':
                    urllist.append(s)
                    print('urllist1->', urllist[0])
                else:
                    namelist.append(s)
                    print('urllist2->', urllist[0])

    # view로 보내주는 json {anstext : 'anstext', flag : '0' }
    context['anstext'] = anstext
    context['flag'] = '0'
    context['url'] = urllist
    context['hname'] = namelist

    if json_callback:
        response = HttpResponse("%s(%s)" % (json_callback, json.dumps(context, ensure_ascii=False)))
        response["Content-Type"] = "text/javascript; charset=utf-8"
        print("Chatbot JsonP")
    else:
        response = JsonResponse(context, json_dumps_params={'ensure_ascii':False},safe=False)

    return response