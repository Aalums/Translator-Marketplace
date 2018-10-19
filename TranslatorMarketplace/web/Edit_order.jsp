<%-- 
    Document   : Edit_order
    Created on : Oct 18, 2018, 7:45:22 PM
    Author     : porpiraya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>แก้ไขรายการที่สร้าง</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- Create Container + Logo -->
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='#'>หน้าหลัก</a></li>
                    <li><a href='#'>สร้างรายการ</a></li>
                    <li><a href='#'>ออเดอร์</a></li>
                    <li><a href='#'>สถานะ</a></li>
                    <li><a href='#'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>

    <!-- CSS -->
    <style>
        .edit-form {
            width: 750px;
            height: 700px;
            position: absolute;
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
        .edit-text {
            left: 10px;
            top: 25px;
            position: relative;
            padding: 3%;
        }
        button {
            cursor: pointer;
            position: relative;
            bottom: 10px;
            left: 290px;
        }
    </style>
</head>
<body>
<center><h1>แก้ไขรายการที่สร้าง</h1></center>
<div class="row">
    <div class="edit-form">
        <div class="edit-text">
            ไฟล์ : นิยาย.pdf<br><br><br><input type="file" name="file_create"/><br><br><br>
            การแปล :<br><br><br><input placeholder="ThaiEng"></input><br><br><br>
            คำอธิบาย :<br><br><br><input placeholder="แปลเป็นภาษาอังกฤษระดับปานกลาง ศัพท์ไม่ยากเกินไป"></input><br><br><br>
            จำนวนหน้า :<br><br><br><input placeholder="5"></input><br><br><br>
            ไฟล์ :<br><br><br><input placeholder="600.-"></input><br><br><br>
            วันรับงานแปล :<br><br><br><input placeholder="16-10-2018"></input>
            <button onclick="location.href = 'Order_customer.jsp';">SAVE</button>
        </div>
    </div>
</div>
</body>
</html>
