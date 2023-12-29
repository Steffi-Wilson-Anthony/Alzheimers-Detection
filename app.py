from flask import *
import mysql.connector
import pandas as pd
import random
from flask_mail import *
import os
import pandas as pd
import numpy as np
import tensorflow as tf
from tensorflow.keras.preprocessing import image
from keras.models import load_model
import json
from django.http import HttpResponse 
db = mysql.connector.connect(user="root", port=3306, host='localhost', passwd="1234", database="phr")
cur = db.cursor()
import os

app = Flask(__name__)
app.secret_key = "!@#$H%S$BV#AS><)SH&BSGV*(_Sjnkxcb9+_)84JSUHB&*%$^+="


@app.route("/")
def index():
    return render_template("proceed.html")


@app.route("/patient", methods=["POST", "GET"])
def Patientlog():
    if request.method == "POST":
        email = request.form["Name"]
        password = request.form["Password"]
        cur.execute(
            "select * from patient_reg where Email=%s and Password=%s",
            (email, password),
        )
        content = cur.fetchall()

   
        if content == []:
            msg = "Credentials Does't exist"
            return render_template("patientlog.html", msg=msg)
        else:
            sql = "select slno,Name,Department,Number,Email from docreg"
            data = pd.read_sql_query(sql, db)
            if data.empty:
                msg = "No Doctor Registered Yet"
                return render_template("patienthome.html", msg=msg)
            else:
                age = content[0][2]
                session["id"] = content[0][0]
                session["email"] = email
                print(session["email"])
                return render_template(
                    "patienthome.html",
                    name=email,
                    age=age,
                    cols=data.columns.values,
                    rows=data.values.tolist(),
                )
    return render_template("patientlog.html")


@app.route("/patientreg", methods=["POST", "GET"])
def Patientreg():
    if request.method == "POST":
        name = request.form["Name"]
        age = request.form["Age"]
        email = request.form["Email"]
        password1 = request.form["Password"]
        password2 = request.form["Con_Password"]
        if password1 == password2:
            sql = "select * from patient_reg where Name='%s' and Email='%s'" % (
                name,
                email,
            )
            cur.execute(sql)
            data = cur.fetchall()
            db.commit()
            
            if data == []:
                sql = "insert into patient_reg(Name,Age,Email,Password) values(%s,%s,%s,%s)"
                val = (name, age, email, password1)
                cur.execute(sql, val)
                db.commit()
                return render_template("patientlog.html")
            else:
                warning = "Details already Exist"
                return render_template("patientreg.html", msg=warning)
        error = "password not matched"
        flash(error)
    return render_template("patientreg.html")


@app.route("/proceed")
def proceed():
    return render_template("proceed.html")


@app.route("/myreport", methods=["POST", "GET"])
def myreport():
    sql = "select Email from docreg"
    cur.execute(sql)
    data = cur.fetchall()

    if request.method=="POST":
        docemail = request.form['docemail']
        session['dcoemail'] = docemail
        useremail = session["email"]
        sql = "select * from aq where patientemail='%s' and docemail='%s'"%(useremail,docemail)
        cur.execute(sql)
        data = cur.fetchall()
        return render_template("press.html",data=data,doctoremail =docemail,r=useremail)



    return render_template("myreport.html",data = data)


@app.route("/patquestion/<r>",methods=["POST","GET"])
def patquestion(r=""):
    print(r)
    docemail = session['dcoemail']
    useremail = session["email"]
    sql = "select * from aq where patientemail='%s' and docemail='%s'"%(useremail,docemail)
    cur.execute(sql)
    data = cur.fetchall()
    if request.methods == "POST": 
        docemail = request.form['docemail']
        patemail = request.form['patemail']
        question = request.form['question']
        docmessages = "empty"

        sql = (
            "insert into aq(patientemail,patientmessages,docemail,docmessages) values('%s','%s','%s','%s')"
            % (r, question, docemail, patemail,docmessages)
        )
        cur.execute(sql)
        db.commit()
        
        
    return render_template("press.html",data=data,doctoremail =docemail,r=useremail)




@app.route("/patientreq", methods=["POST", "GET"])
def patientreq():
    if request.method == "POST":
        Name = request.form["Name"]
        doc = request.form["docname"]
        Age = request.form["Age"]
        Dept = request.form["dept"]
        Symptoms = request.form["symptoms"]
        AppointmentDate = request.form["AppointmentDate"]
        Time = request.form["Time"]
        sql = (
            "insert into patientreq (Name,Patientemail,docname,Age,dept,symptoms,AppointmentDate,Time) values ('%s','%s','%s','%s','%s','%s','%s','%s')"
            % (Name,session["email"],doc, Age, Dept, Symptoms, AppointmentDate, Time)
        )
        cur.execute(sql)
        db.commit()
        msg = "Your appointment is booked waiting approval form doctor"
        return render_template("patienthome.html", msg=msg)
    return render_template("patienthome.html")





@app.route("/bookappointment/<int:id>")
def bookappointment(id=0):
    
    sql = "select Name from docreg where slno=%s" % (str(id))
    cur.execute(sql)
    data = cur.fetchall()
    return render_template("bookappointment.html", data=data)



@app.route("/viewappointments")
def viewappointments():
    sql = "select Id,Name,Docname,Age,Dept,AppointmentDate,Time,Status from patientreq"
    data = pd.read_sql_query(sql, db)
    db.commit()
    return render_template(
        "viewappointments.html", cols=data.columns.values, rows=data.values.tolist()
    )


@app.route("/accept_request/<int:x>")
def acceptreq(x=0):
    sql = "select * from patientreq where id='%s'" % (x)
    data = pd.read_sql_query(sql, db)
    db.commit()
    print(data)
    if data.empty:
        flash("Doctot is not available")
        return redirect(url_for("viewappointments"))
    else:
        sql = (
            "update patientreq set status='accepted' where status='pending' and Id='%s'"
            % (x)
        )
        cur.execute(sql)
        db.commit()
        return redirect(url_for("viewappointments"))





@app.route("/rejecte_request/<int:x>")
def rejectreq(x=0):
    sql = "select * from patientreq where Id='%s' " % (x)
    data = pd.read_sql_query(sql, db)
    db.commit()
    print(data)
    if data.empty:
        flash("Doctot is not available")
        return redirect(url_for("viewappointments"))
    else:
        sql = (
            "update patientreq set status='rejected' where status='pending' and Id='%s'"
            % (x)
        )
        cur.execute(sql)
        db.commit()
        return redirect(url_for("viewappointments"))
    




@app.route("/Connect/<x>/<y>/<z>")
def mergereq(x="", y="", z=""):
    sql = ("select name,Type,Age from patientreq where status='accepted' or 'rejected' and Name='%s'"%(session["username"]))
    cur.execute(sql)
    da = cur.fetchall()
    db.commit()
    dat = [j for i in da for j in i]
    sql = ("insert into connectdata(Patientname,patientAge,Type)values('%s','%s','%s')"%(dat[0], dat[2], dat[1]))
    cur.execute(sql)
    db.commit()
    return redirect(url_for("viewappointments"))


@app.route("/doctorreg", methods=["POST", "GET"])
def doctorreg():
    if request.method == "POST":
        dept = request.form["Department"]
        name = request.form["Name"]
        age = request.form["Age"]
        number = request.form["Number"]
        email = request.form["email"]
        password = request.form["password"]
        conpassword = request.form["conpassword"]
        if password == conpassword:
            print("True")
            sql = "select * from docreg"
            cur.execute(sql)
            data = cur.fetchall()
            db.commit()
            for i in data:
                if email in i[5]:
                    msg = "Email already Exist's"
                    return render_template("doctorreg.html", msg=msg)
            else:
                sql = (
                    "insert into docreg(Name,Department,Age,Number,Email,Password) values('%s','%s','%s','%s','%s','%s')"
                    % (name, dept, age, number, email, password)
                )
                cur.execute(sql)
                db.commit()
                msg = "Doctor Registertion is scuessfully"
                return render_template("doctorlog.html", msg=msg)
        else:
            msg = "Password doesn't Match"
            return render_template("doctorreg.html", msg=msg)

    return render_template("doctorreg.html")


@app.route("/doctorlog", methods=["POST", "GET"])
def doctorlog():
    if request.method == "POST":
        Docname = request.form["Docname"]
        passcode = request.form["Docpasscode"]
        sql = "select * from docreg where Email='%s' and Password='%s'" % (
            Docname,
            passcode,
        )
        cur.execute(sql)
        data = cur.fetchall()
        db.commit()
        print(data)

        if data != []:
            session["docemail"] = Docname
            msg = "Welcome Dr.{}".format(Docname)
            return render_template("docrequest.html", msg=msg)
        else:
            msg = "Details doesn't exist"
            return render_template("doctorlog.html", msg=msg)
    return render_template("doctorlog.html")


@app.route("/patientcognitivescore")
def patientcognitivescore():
    sql="select * from cognitivescore"
    data = pd.read_sql_query(sql,db)
    return render_template("patientcognitivescore.html",cols=data.columns.values,rows=data.values.tolist())

@app.route("/viewpatients")
def viewpatients():
    sql = "select Email from patient_reg"
    data = pd.read_sql_query(sql, db)
    return render_template(
        "viewpatients.html",
        cols=data.columns.values,
        rows=data.values.tolist(),
        docemail=session["docemail"],
    )


@app.route("/aqquestion/<r>", methods=["POST", "GET"])
def aqquestion(r=""):
    patientemail = r
    doctoremail = session["docemail"]
    if request.method == "POST":
        messages = request.form["question"]
        print(messages)
        patientessages = "empty"

        sql = (
            "insert into aq(patientemail,patientmessages,docemail,docmessages) values('%s','%s','%s','%s')"
            % (r, patientessages, doctoremail, messages)
        )
        cur.execute(sql)
        db.commit()

        val = (doctoremail, patientemail)
        data = "select * from aq where docemail='%s' and patientemail='%s'" % (val)
        cur.execute(data)
        dataone = cur.fetchall()

        return render_template(
            "aqquestion.html", r=patientemail, doctoremail=doctoremail, data=dataone
        )
    val = (doctoremail, patientemail)
    data = "select * from aq where docemail='%s' and patientemail='%s'" % (val)
    cur.execute(data)
    dataone = cur.fetchall()
    return render_template(
        "aqquestion.html", r=patientemail, doctoremail=doctoremail, data=dataone
    )


@app.route("/patientaq")
def patientaq():
    sql = "select * from cognitive ORDER BY RAND() LIMIT 15;"
    cur.execute(sql)
    data = cur.fetchall()
    return render_template("patientaq.html",rows = data)


@app.route("/mycognitivetest",methods=["POST","GET"])
def mycognitivetest():
    data = []
    for key in request.form.to_dict():
        x = f"{key} : {request.form[key]}"
        data.append(x)
    data = data
    print(data)
    sorted_data = sorted(data, key=lambda x: int(x.split(" : ")[0]))

    # Print the sorted data
  
    for item in sorted_data:
        id_val, value = item.split(" : ")
        sql = "INSERT INTO mykeypaper (Qid, val,useremail) VALUES (%s, %s,%s)"
        val = (id_val.strip(), value.strip(),session["email"])
        cur.execute(sql, val)

    sql = "SELECT count(*) AS common_count FROM (SELECT d1.id, d1.val FROM mykeypaper AS d1 JOIN keypaper AS d2 ON d1.Qid = d2.id AND d1.val = d2.key) AS common_data"
    cur.execute(sql)
    scoredata =cur.fetchall()
    sql = "insert into cognitivescore(useremail,score)values(%s,%s)"
    val = (session["email"],scoredata[0][0])
    cur.execute(sql,val)
    db.commit()
    db.close()
    
    
    return render_template('mycognitivetest.html',cognitivescore = scoredata)


@app.route("/cognitivereport")
def cognitivereport():
    sql = "select Qid,val,useremail from mykeypaper where useremail='%s'"%(session["email"])
    cur.execute(sql)
    data = cur.fetchall()
    print(data)
    db.commit()

    return render_template("cognitivereport.html",data=data)
    



@app.route("/patientaqquestion/<r>", methods=["POST", "GET"])
def patientaqquestion(r=""):
    docemail = r
    patientemail = session["email"]
    print(docemail, patientemail)
    if request.method == "POST":
        messages = request.form["question"]
        print(messages)
        docmessages = "empty"
        sql = (
            "insert into aq(patientemail,patientmessages,docemail,docmessages) values('%s','%s','%s','%s')"
            % (patientemail, messages, docemail, docmessages)
        )
        cur.execute(sql)
        db.commit()
        val = (r, patientemail)
        data = "select * from aq where docemail='%s' and patientemail='%s'" % (val)
        cur.execute(data)
        dataone = cur.fetchall()
        return render_template(
            "patientaqquestion.html",
            r=docemail,
            patientemail=patientemail,
            data=dataone,
        )
    val = (docemail, patientemail)
    data = "select * from aq where docemail='%s' and patientemail='%s'" % (val)
    cur.execute(data)
    dataone = cur.fetchall()
    return render_template(
        "patientaqquestion.html", r=docemail, patientemail=patientemail, data=dataone
    )


@app.route("/docmessages", methods=["POST", "GET"])
def docmessages():
    if request.method == "POST":
        docemail = request.form["docemail"]
        patientemail = request.form["patemail"]
        question = request.form["question"]
        val = (docemail, patientemail, question)
        sql = ("insert into aq(docemail, patientemail,docmessages) values ('%s','%s','%s')"%(val))
        cur.execute(sql)
        db.commit()
    return redirect(url_for("aqquestion"))

@app.route("/view_patient")
def viewpatient():
    sql = "select * from connectdata where Type='%s' and status='pending'" % (
        session["dept"]
    )
    cur.execute(sql)
    data = cur.fetchall()
    db.commit()
    print(data)
    if data == []:
        msg = "You dont have any appointments "
        return render_template("viewpatient.html", msg=msg)
    Name = data[0][1]
    Age = data[0][2]
    Type = data[0][3]
    return render_template("viewpatient.html", name=Name, age=Age, type=Type)




@app.route("/upload_file", methods=["POST", "GET"])
def uploadfile(email=""):
    print(email)
    if request.method == "POST":
        filedata = request.files["filedata"]
        n = filedata.filename
        data = filedata.read()
        print(data)
        filapth = f"uploadfiles/{n}"
        path = os.path.join("uploadfiles/", n)
        filedata.save(path)
        status = "accepted"
        id1 = random.randint(0000, 9999)
        PatientId = "PID" + str(id1)
        sql = "insert into reports(FileName,FileData,patientEmail,Status,Patientid) values(%s,%s,%s,%s,%s)"
        val = (n, filapth, session["email"], status, PatientId)
        cur.execute(sql, val)
        db.commit()
        msg = "file Uploaded successfully"
        return render_template("uploadfile.html", msg=msg)
    return render_template("uploadfile.html")



@app.route("/view_files")
def viewfiles():
    sql = (
        "select Id,FileName,PatientEmail from reports where PatientEmail='%s' and status='accepted'"
        % (session["email"])
    )
    data = pd.read_sql_query(sql, db)
    db.commit()
    return render_template(
        "files.html", cols=data.columns.values, rows=data.values.tolist()
    )





@app.route("/aqtest",methods=["POST","GET"])
def aqtest():
    sql = "truncate table aqtestdata"
    cur.execute(sql)
    db.commit()
    if request.method=="POST":
        m1 = request.form['m1']
        m2 = request.form['m2']
        m3 = request.form['m3']
        m4 = request.form['m4']
        m5 = request.form['m5']
        m6 = request.form['m6']
        o1 = request.form['o1']
        o2 = request.form['o2']
        o3 = request.form['o3']
        fa1 = request.form['fa1']
        fa2 = request.form['fa2']
        fa3 = request.form['fa3']
        fa4 = request.form['fa4']
        fa5 = request.form['fa5']
        fa6 = request.form['fa6']
        fa7 = request.form['fa7']
        v1 = request.form['v1']
        v2 = request.form['v2']
        v3 = request.form['v3']
        v4 = request.form['v4']
        v5 = request.form['v5']
        sql = "insert into aqtestdata(m1,m2,m3,m4,m5,m6,o1,o2,o3,fa1,fa2,fa3,fa4,fa5,fa6,fa7,v1,v2,v3,v4,v5)values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = (m1,m2,m3,m4,m5,m6,o1,o2,o3,fa1,fa2,fa3,fa4,fa5,fa6,fa7,v1,v2,v3,v4,v5)
        cur.execute(sql,val)
        db.commit()
        sql1 = "select m1,m2,m3,m4,m5,m6,o1,o2,o3,fa1,fa2,fa3,fa4,fa5,fa6,fa7,v1,v2,v3,v4,v5 from aqtestdata"
        cur.execute(sql1)
        dataone = cur.fetchall()
        print(dataone)
        totalsum = [int(j) for i in dataone for j in i ]
        total =  sum(totalsum)
        return render_template("aqtestone.html",total = total)
    return render_template("aqtest.html")


@app.route("/viewmyappointments")
def viewmyappointments():
    dc = "select * from patientreq where Patientemail='%s'"%(session['email'])
    data = pd.read_sql_query(dc,db)
    return render_template("viewmyappointments.html",cols=data.columns.values,rows=data.values.tolist())

@app.route("/reschedule/<int:id>")
def reschedule(id=0):
    sql = "select * from patientreq where id='%s'"%(id)
    cur.execute(sql)
    data = cur.fetchall()
    print(data)
    id = data[0][0]
    name= data[0][1]
    doctorname = data[0][3]
    age = data[0][4]
    symptoms = data[0][6]
    date = data[0][7]
    time = data[0][8]
    print(id,name,doctorname,age,symptoms,date,time)
    return render_template("reschedule.html",data=data,id=id,name=name,doctorname=doctorname,age=age,symptoms=symptoms,date=date,time=time)



@app.route("/updateappointment",methods=["GET","POST"])
def updateappointment():
    if request.method=="POST":
        appointmentid = request.form['appointmentid']
        patientname = request.form['patientname']
        doctorname = request.form['doctorname']
        patientage = request.form['patientage']
        patientsymptoms = request.form['patientsymptoms']
        appointmentdate = request.form['appointmentdate']
        appointmenttime = request.form['appointmenttime']
        print(patientname,doctorname,patientage,patientsymptoms,appointmentdate,appointmenttime)
        sql = "update patientreq set Name='%s',Docname='%s',Age='%s',symptoms='%s',AppointmentDate='%s',Time='%s' where Id='%s'"%(patientname,doctorname,patientage,patientsymptoms,appointmentdate,appointmenttime,appointmentid)
        cur.execute(sql)
        db.commit()
        print(appointmentid,patientname,doctorname,patientage,patientsymptoms,appointmentdate,appointmenttime)
        return redirect(url_for('viewmyappointments'))

@app.route("/cancelappointment/<int:id>")
def cancelappointment(id=0):
    sql = "update patientreq set status='cancelled' where id='%s'"%(id)
    cur.execute(sql)
    db.commit()
    return redirect(url_for("viewmyappointments"))

@app.route("/view_report", methods=["POST", "GET"])
def viewreport():
    sql = (
        "select Id,FileName,PatientEmail,Status from reports where PatientEmail='%s'"
        % (session["email"])
    )
    data = pd.read_sql_query(sql, db)
    return render_template(
        "report.html", cols=data.columns.values, rows=data.values.tolist()
    )







@app.route("/Uploaddataset", methods=["POST", "GET"])
def Uploaddataset():
    classes = ["MildDemented", "ModerateDemented", "NonDemented", "VeryMildDemented"]
    if request.method == "POST":
        m = int(request.POST["alg"])
        myfile = request.files["filedata"]
        fn = myfile.filename
        mypath = os.path.join("static/images/", fn)
        myfile.save(mypath)
        acc = pd.read_csv("Accuracy.csv")

        print("{} is the file name", fn)
        print("Accept incoming file:", fn)
        print("Save it to:", mypath)

        if m == 1:
            new_model = load_model("cnn.h5")
            test_image = image.load_img(mypath, target_size=(128, 128))
            test_image = image.img_to_array(test_image)
            test_image = np.expand_dims(test_image, axis=0)
            test_image /= 255
            a = acc.iloc[m - 1, 1]

        elif m == 2:
            new_model = load_model("Mobilenet.h5")
            test_image = image.load_img(mypath, target_size=(128, 128))
            test_image = image.img_to_array(test_image)
            test_image = np.expand_dims(test_image, axis=0)
            test_image /= 255
            a = acc.iloc[m - 1, 1]

        result = new_model.predict(test_image)
        preds = classes[np.argmax(result)]

        return render_template(
            "template.html", text=preds, image_name=fn, a=round(a * 100, 3)
        )
    return render_template("Uploaddataset.html")

@app.route("/logout")
def logout():
    return redirect(url_for("index"))



if __name__ == "__main__":
    app.run(debug=True)
