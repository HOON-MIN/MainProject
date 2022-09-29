import pymysql as mysql
class MyModel:
    def myconn(self):
        # conn = ora.connect("mypython/mypython@192.168.0.177/xe")
        conn = mysql.Connect(host='127.0.0.1', user='mypython', password='kosmo113', database='mypython')
        return conn