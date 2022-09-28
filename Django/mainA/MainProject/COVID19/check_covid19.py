import random
import pandas as pd
import numpy as np
import os
import librosa
import json
import sys
import warnings
warnings.filterwarnings(action='ignore')

from sklearn.preprocessing import OneHotEncoder

CFG = {
    'SR':16000, #sr(sampling rate), 설정안하면 기본 22500
    'N_melspectrogram':16, # Melspectrogram 벡터를 추출할 개수
    'SEED':41
}

def seed_everything(seed):
    random.seed(seed)
    os.environ['PYTHONHASHSEED'] = str(seed)
    np.random.seed(seed)

seed_everything(CFG['SEED']) # Seed 고정


# Test feature engineering
# Data Folder path
# root_folder = '/home/kosmo113/MainProject/COVID19/'
# data_folder = '/home/kosmo113/MainProject/COVID19/Dataset/'
# res_folder = '/home/kosmo113/MainProject/COVID19/Result/'
root_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/'
data_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/Dataset/'
res_folder = '/home/kosmo113/python/workspace/MainA-Test/MainProject/COVID19/Result/'
#User data
fileid = sys.argv[1]

with open(data_folder + fileid + '.json', 'r') as file:
    userjson = json.load(file)
    print("Ubuntu:userjson=>", userjson['userid'])

userid = userjson['userid']
gender = userjson['gender']
age = int(userjson['age'])
resp = int(userjson['respiratory_condition'])
fever = int(userjson['fever_or_muscle_pain'])

#features
features = []
log_specgrams_hp = []
f_list1=[]
f_list2=[]
f_list3=[]



path = os.path.join(data_folder, fileid+'.wav') #/home/kosmo113/MainProject/COVID19/Dataset/{userid}.wav

# librosa패키지를 사용하여 wav 파일 load
y, sr = librosa.load(path, sr=CFG['SR'])

# feature1, feature3
# librosa패키지를 사용하여 melspectrogram 추출:mel-scale은 이러한 사람의 귀를 칼라맵인 스펙트로그램에 반영하는 것을 의미
melspectrogram = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=CFG['N_melspectrogram'])

# feature3 : 로그스케일링된 melspectrogram의 델타값을 Feature로 사용
y_feature3 = []
for e in melspectrogram:
    y_feature3.append(np.mean(librosa.feature.delta(e)))
f_list3.append(y_feature3)

# log sccale로 변환
feature1 = librosa.power_to_db(S=melspectrogram, ref=1.0)

# feature1 : 추출된 melspectrogram들의 평균을 Feature로 사용
y_feature1 = []
for e in feature1:
    y_feature1.append(np.mean(e))
f_list1.append(y_feature1)

# feature2
# librosa.effects.hpss를 사용한 feature 추출: 고조파 및 타악기 구성 요소 분해
y_harmonic, y_percussive = librosa.effects.hpss(y)
melspec_harmonic = librosa.feature.melspectrogram(y_harmonic, n_mels = CFG['N_melspectrogram'])
melspec_percussive = librosa.feature.melspectrogram(y_percussive, n_mels = CFG['N_melspectrogram'])
logspec_harmonic = librosa.amplitude_to_db(melspec_harmonic)
logspec_percussive = librosa.amplitude_to_db(melspec_percussive)
logspec_hp = np.average([logspec_harmonic, logspec_percussive], axis=0)


y_feature2 = []
for e in logspec_hp:
    y_feature2.append(np.mean(e))
f_list2.append(y_feature2)


# 유저 임상데이터
userlist = [userid, age, gender, resp, fever]
usercolumn = ['id','age','gender','respiratory_condition','fever_or_muscle_pain']
user_df = pd.DataFrame(userlist, usercolumn)
user_df = user_df.T


# 기존의 자가진단 정보를 담은 데이터프레임에 추출된 오디오 Feature를 추가
f_list1 = pd.DataFrame(f_list1)
f_list2 = pd.DataFrame(f_list2)
f_list3 = pd.DataFrame(f_list3)

f_list1.columns = ['melspectrogram_1_'+str(x) for x in range(1,CFG['N_melspectrogram']+1)]
f_list2.columns = ['melspectrogram_2_'+str(x) for x in range(1,CFG['N_melspectrogram']+1)]
f_list3.columns = ['melspectrogram_3_'+str(x) for x in range(1,CFG['N_melspectrogram']+1)]

melspectrogram_test_df = pd.concat([f_list1,f_list2,f_list3], axis=1)
test_df = pd.concat([user_df, melspectrogram_test_df], axis=1)

# 파일이 존재하면 삭제로 초기화
if os.path.exists(res_folder + userid + '_vector.csv'):
    os.remove(res_folder + userid + '_vector.csv')

test_df.to_csv(res_folder + userid + '_vector.csv', index=False)
print('Done.')


# wav 파일의 Melspectrogram Feature와 상태정보를 합친 학습데이터를 불러옵니다.
train_df = pd.read_csv(root_folder+'train_melspectrogram_3features.csv')


# 학습데이터를 모델의 input으로 들어갈 x와 label로 사용할 y로 분할
train_x = train_df.drop(columns=['id', 'covid19'])
train_y = train_df['covid19']


def onehot_encoding(ohe, x):
    # 학습데이터로 부터 fit된 one-hot encoder (ohe)를 받아 transform 시켜주는 함수
    encoded = ohe.transform(x['gender'].values.reshape(-1,1))
    encoded_df = pd.DataFrame(encoded, columns=ohe.categories_[0])
    x = pd.concat([x.drop(columns=['gender']), encoded_df], axis=1)
    return x


# 'gender' column의 경우 추가 전처리가 필요 -> OneHotEncoder 적용
# female, male => 1.0, 0.0으로 표현
ohe = OneHotEncoder(sparse=False)
ohe.fit(train_x['gender'].values.reshape(-1,1))
train_x = onehot_encoding(ohe, train_x)


# 학습 모델불러오기
import keras
model2 = keras.models.load_model(root_folder+'model_30.h5')


# 위의 학습데이터를 전처리한 과정과 동일하게 test data에도 적용
user_x = pd.read_csv(res_folder + userid + '_vector.csv')
user_x = user_x.drop(columns=['id'])

# Data Leakage에 유의하여 train data로만 학습된 ohe를 사용
user_x = onehot_encoding(ohe, user_x)

# Model 추론
preds = model2.predict(user_x)

pred_w = pd.DataFrame(np.where((model2.predict(user_x)>0.85),0,1))
pred_w = pd.DataFrame(pred_w.iloc[:,0])

# 파일이 존재하면 삭제로 초기화
if os.path.exists(res_folder + userid + '_result.json'):
    os.remove(res_folder + userid + '_result.json')

user_df['covid19'] = pred_w
user_df.to_json(res_folder + userid + '_result.json', orient='table')
print(user_df)

os.remove(data_folder + fileid + '.json')
os.remove(data_folder + fileid + '.wav')