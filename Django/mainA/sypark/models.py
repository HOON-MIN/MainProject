from django.db import models
from config.models import MyModel

class Main(MyModel):
    #
    def recentreviews(self):
        conn = self.myconn()
        cursor = conn.cursor()
        sql = "select cont from reviewboard"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        return res

    # 병원 후기중 후기 평가 평균 별점 높은 순서의 병원 리스트
    def reviewgrade(self):
        conn = self.myconn()
        cursor = conn.cursor()
        sql = "select row_number() over (order by avg(likes) desc) as num, hname, avg(likes) as avg from reviewboard group by hname limit 10"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        return res

    # 차트용: 연간의료소비액 테이블에서 연도및 한국소비금액 정보 가져옴
    def medicalspending(self):
        conn = self.myconn()
        cursor = conn.cursor()
        sql = "select year,korea_krwmillion from annualMedicalSpending order by year"
        cursor.execute(sql)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        return res






