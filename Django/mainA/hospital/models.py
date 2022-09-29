import pymysql
from django.shortcuts import render

from config.models import MyModel


def makeDictFactory(cursor):
    columnNames = [d[0] for d in cursor.description]

    def createRow(*args):
        return dict(zip(columnNames, args))

    return createRow


class HospitalDao(MyModel):
    # 지도 데이터
    def getHospitalList(self):
        conn = self.myconn()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # select hnum, hname, hloc, otime, ctime, hcate, hurl, hemail, hgrade from hospital order by 1 desc
        sql = """
            select hos_id,hos_loc,hos_name,hos_code,hos_code_name, hos_address,hos_addr,\
            hos_tel,hos_url from hospital_list limit 50
        """
        cursor.execute(sql)
        cursor.rowfactory = makeDictFactory(cursor)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        # for e in res:
        #     print(f"key=>{e}")
        return res

    def getHospitalChart(self):
        conn = self.myconn()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # select hnum, hname, hloc, otime, ctime, hcate, hurl, hemail, hgrade from hospital order by 1 desc
        sql = """
            select hos_loc,count(*) as 'count' from hospital_list group by hos_loc
        """
        cursor.execute(sql)
        cursor.rowfactory = makeDictFactory(cursor)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        # for e in res:
        #     print(f"key=>{e}")
        return res

    def hospitalListTotalSearch(self, keyword):
        conn = self.myconn()
        cursor = conn.cursor(pymysql.cursors.DictCursor)
        # select hnum, hname, hloc, otime, ctime, hcate, hurl, hemail, hgrade from hospital order by 1 desc
        keyword = '%' + keyword + '%'
        print(keyword)
        sql = f'select hos_name,hos_code_name,hos_tel,hos_loc from hospital_list where hos_name like \'{keyword}\' limit 500'
        cursor.execute(sql)
        cursor.rowfactory = makeDictFactory(cursor)
        res = cursor.fetchall()
        cursor.close()
        conn.close()
        # for e in res:
        print(f"key=>{res}")
        return res


