<%-- 
    Document   : Order_customer
    Created on : Oct 16, 2018, 7:04:13 PM
    Author     : porpiraya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>รายการที่สร้าง</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="style.css">

        <!-- CSS -->
        <style>
            .order-form {
                width: 750px;
                height: 300px;
                position: relative;
                padding: 10px;
                padding-right: 20px;
                transform: translate(0%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100px;
                left: 25%;
            }
            .order-text {
                left: 10px;
                top: 25px;
                position: relative;
                padding: 3%;
            }
            button {
                cursor: pointer;
                position: fixed;
                right: 10px;
            }
            .button_edit {
                top: 80px;
            }
            .button_select {
                top: 180px;
            }
        </style>
    </head>
    <body>
    <center><h1>รายการที่สร้าง</h1></center>

    <div class="row">
        <div class="order-form">
            <div class="order-text">
                <h3>ไฟล์ : นิยาย.pdf</h3><br><br><br>
                <h3>การแปล : ThaiEng</h3><br><br><br>
                <h3>คำอธิบาย : แปลเป็นภาษาอังกฤษระดับปานกลาง ศัพท์ไม่ยากเกินไป</h3><br><br><br>
                <h3>จำนวนหน้า : 5</h3><br><br><br>
                <h3>ไฟล์ : 600.-</h3><br><br><br>
                <h3>วันรับงานแปล : 16-10-2018</h3>
            </div>
            <button class="button_edit">edit</button>
            <button class="button_select">เลือกนักแปล</button>
        </div>

        <div class="order-form">
            <div class="order-text">
                <h3>ไฟล์ : magazine.pdf</h3><br><br><br>
                <h3>การแปล : EngThai</h3><br><br><br>
                <h3>คำอธิบาย : แปลเป็นภาษาไทย ที่อ่านเข้าใจได้ง่าย</h3><br><br><br>
                <h3>จำนวนหน้า : 8</h3><br><br><br>
                <h3>ไฟล์ : 960.-</h3><br><br><br>
                <h3>วันรับงานแปล : 20-10-2018</h3>
            </div>
            <button class="button_edit">edit</button>
            <button class="button_select">เลือกนักแปล</button>
        </div>

        <div class="order-form">
            <div class="order-text">
                <h3>ไฟล์ : วรรณคดี.pdf</h3><br><br><br>
                <h3>การแปล : EngThai</h3><br><br><br>
                <h3>คำอธิบาย : แปลเป็นภาษาอังกฤษระดับสูง มีคำศัพท์เฉพาะ</h3><br><br><br>
                <h3>จำนวนหน้า : 12</h3><br><br><br>
                <h3>ไฟล์ : 1,440.-</h3><br><br><br>
                <h3>วันรับงานแปล : 27-10-2018</h3>
            </div>
            <button class="button_edit">edit</button>
            <button class="button_select">เลือกนักแปล</button>
        </div>
    </div>


</body>
</html>
