장고 가상환경 생성  후 장고 설치 설치 
1. pip install Django

이미지분석 장고 readME

1. tensorflow 설치  : pip install tensorflow

2. pandas 설치 : conda install pandas

3. 모바 엑스텀을 통해 구글 OCR API 키 전달 

4. drug App views.py 실행되는 컨트롤러 제일 상단 에

os.environ['GOOGLE_APPLICATION_CREDENTIALS'] =  구글 OCR API key 경로 설정 
 "/home/pulse9/dev/GoogleCampus/GoogleCampus-77XXXXXXXXXX.json"

5. 구글 OCR 라이브 러리 설치 및 인증 설정 
  $ pip3 install --upgrade google-cloud-vision    #Python3

6. PIL 설치 
	pip install pillow

7. django-cors-headers 설치
 
	pip install django-cors-headers
출처: https://hyeonyeee.tistory.com/65 [hyeoneee's blog:티스토리]
8. pymysql 설치 
	pip install pymysql 

9. protobuf 관련 오류 수정 
  9-1. pip uninstall protobuf
  9-2. pip install protobuf==3.19.1

10. openCV설치 
  conda install opencv
11. matplot설치 
  conda install matplotlib

12. wordcloud ,pandas설치 
   pip install wordcloud
   pip install pandas	
    pip install sklearn

13. 스프링 mypage - dashboard 장고 ip로 수정 

14.  스프링 drug -  drugimgSearchForm  장고 ip로 수정 

15. 우분투 기준  ubuntu 20.04에 Google cloud SDK설치  - 검색어 : 우분투 google cloud 설치
	url : https://helpingbox.net/ko/ubuntu-20-04%EC%97%90-google-cloud-sdk-%EC%84%A4%EC%B9%98
	1) - sudo apt update
	2) - wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-307.0.0-linux-x86_64.tar.gz
	3) - tar –xvzf google-cloud-sdk-307.0.0-linux-x86_64.tar.gz
	4) -cd google-cloud-sdk
	5) -./install.sh
                   -만약 설치 안될시 conda  activate 3.8 버전 
	6) export GOOGLE_APPLICATION_CREDENTIALS="KEY_PATH"

16. 미르님 소영님 mysql 데이터 워크벤치나 다른 방식으로 입력 
       16-1)mysql 설치 
       16-2)mysql을 이용하여 워크벤치 입력 
			
17. sklean 설치 
    pip install sklean






