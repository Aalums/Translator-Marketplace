<%-- 
     Document   : translator
     Created on : Oct 11, 2018, 11:32:48 AM
     Author     : porpiraya
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>นักแปล</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <style>
            h2 {
                font-weight: normal;
                font-size: 1.5em;
                font-weight: 200;
                line-height: 1.2em;
                margin-top: 20px;
            }
            h3 {
                font-variant: small-caps;
                font-size: 0.9em;
                letter-spacing: 0.5px;
                font-weight: 200;
                line-height: initial; /* ให้ตัวอักษรไม่ซ้อนทับกัน */
                margin-bottom: 30px;
                letter-spacing: 1px;
            }
            .column{
                padding: 5%;
                -moz-column-count:3; /* Firefox */
                -webkit-column-count:3; /* Safari and Chrome */
                column-count:3;
            }
            .profile-form {
                max-width: 400px;
                min-width: 290px;
                width: 100%;
                position: relative;
                padding: 10px;
                padding-right: 20px;
                transform: translate(0%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100%;
            }
            .profile-form .img {
                border-radius: 50%;
                position: relative;
                top: 20px;
                left: 30%;
                z-index: 1;
                max-width: 90px;
                opacity: 1;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }
            .pop-up-body {
                /* Hides pop-up when there is "no active" class */
                max-width: 300px;
                min-width: 190px;
                width: 100%;
                top: 40%;
                left: 40%;
                position: absolute;
                padding: 10px;
                padding-right: 20px;
                transform: translate(0%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100px;
                z-index: 1;
                display: none;
            }
            button {
                cursor: pointer;
            }
        </style>
    </head>

    <body>

        <!-- Query ข้อมูลนักแปล -->
        <sql:setDataSource var="data" 
                           driver="com.mysql.jdbc.Driver" 
                           user="root" 
                           password="root" 
                           url="jdbc:mysql://localhost:3306/test"/>

        <sql:query dataSource="${data}" var="result">
            SELECT *
            FROM translators
            JOIN customers
            USING (id_customer);
        </sql:query>

        <!-- รับค่า id_order รายการที่เลือกจากหน้า Order_customer -->
        <% String id_order = (String) session.getAttribute("Order");%>

        <!-- Creates pop-up Body -->
        <div class="pop-up-body" id="pop-up">
            <!-- Creates pop-up Text -->
            <div id="pop-up-text">
                <h2>ยืนยันการจ้าง</h2><br><br>
                <h3 id="select_translator">คุณเลือกนักแปล : _____________</h3><br>
                <h3 id="select_order">สำหรับรายการ : _____________</h3><br>
                <!-- pop-up's button when you select Translator -->
                <button class="yes" onclick="button_yes()">Yes</button>     <button class="no" onclick="button_no()">No</button>
            </div>
        </div>

        <!-- Include jQuery -->
        <script src="https://code.jquery.com/jquery-1.8.2.min.js"></script>

        <!-- Include jQuery Popup Overlay -->
        <script src="https://cdn.rawgit.com/vast-engineering/jquery-popup-overlay/1.7.13/jquery.popupoverlay.js"></script>

        <script>
                    function button_employ(id_translator, id_order) {
                        document.getElementById("pop-up").style.display = "block";
                        document.getElementsByClassName("column")[0].style.WebkitFilter = 'blur(4px)';
                        document.getElementsByClassName("column")[0].style.filter = 'blur(4px)';

                        document.getElementById("select_translator").innerHTML = "คุณเลือกนักแปล : " + id_translator;
                        document.getElementById("select_order").innerHTML = "สำหรับรายการ : " + id_order;
                    }

                    function button_no() {
                        document.getElementById("pop-up").style.display = "none";
                        document.getElementsByClassName("column")[0].style.WebkitFilter = 'blur(0px)';
                        document.getElementsByClassName("column")[0].style.filter = 'blur(0px)';
                    }
        </script>

        <!-- Create Header -->
        <br><br>     
        <div class="header">
            <center><h1>นักแปล</h1></center>
        </div>

        <!-- Create Column-->
        <div class="column">
            <c:forEach var="row" items="${result.rows}">
                <div class="profile-form">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                    <h2>${row.name_customer}</h2><br><br><br><br>
                    <h3>รายละเอียด : ${row.profile}</h3><br>
                    <h3>SKILL : ${row.type_skill}</h3>
                    <h3>LANGUAGE : ${row.level_skill}</h3>
                    <div class="employ">
                        <center>
                            <!--ส่งชื่อนักแปลที่เลือกไป servlet-->
                            <form action="SelectTranslatorServlet" method="POST">
                                <button id="select_employ" name="select" value="${row.name_customer}">
                                    <div class = "button-text">จ้าง</div>
                                </button>
                            </form>
                        </center>
                    </div> 
                </div>
            </c:forEach>
        </div>
    </body>

</html>