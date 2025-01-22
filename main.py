import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="bus-project"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM user")

myresult = mycursor.fetchall()

# print(mydb)

for x in myresult:
    print(x)