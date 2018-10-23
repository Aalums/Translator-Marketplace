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

        <!--        <style>
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
                </style>-->
        <style>
            .snip1336 {
                position: relative;
                float: left;
                overflow: hidden;
                margin: 10px 1%;
                min-width: 230px;
                max-width: 280px;
                width: 100%;
                color: #ffffff;
                text-align: left;
                line-height: 1.4em;
                background-color: #333333;
                border-radius: 2%;
                box-shadow: 4px 4px 7px 0px rgba(0, 0, 0, 0.23);
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 * {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-transition: all 0.25s ease;
                transition: all 0.25s ease;
            }
            .snip1336 img {
                max-width: 100%;
                vertical-align: central;
            }
            .snip1336 figcaption {
                width: 100%;
                background-color: #333333;
                padding: 25px;
                position: relative;
                height: 15em;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 select_employ {
                width: 100%;
                background-color: #333333;
                padding: 25px;
                position: relative;
            }
            .snip1336 figcaption:before {
                position: absolute;
                content: '';
                bottom: 100%;
                left: 0;
                width: 0;
                height: 0;
                border-style: solid;
                border-width: 55px 0 0 400px;
                border-color: transparent transparent transparent #f76d6d;
            }
            .snip1336 figcaption a {
                padding: 5px;
                border: 1px solid #ffffff;
                color: #ffffff;
                font-size: 0.7em;
                text-transform: uppercase;
                margin: 10px 0;
                display: inline-block;
                width: 47%;
                text-align: center;
                text-decoration: none;
                font-weight: 600;
                letter-spacing: 1px;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 figcaption a:hover {
                opacity: 1;
            }
            .snip1336 .profile {
                border-radius: 50%;
                position: absolute;
                bottom: 100%;
                margin-bottom: 18px;
                left: 65px;
                z-index: 1;
                max-width: 140px;;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }
            .snip1336 .follow {
                margin-right: 4%;
                border-color: #2980b9;
                color: #2980b9;
            }
            .snip1336 h1 {
                color: white;
                text-align: center;
                margin: 0 0 5px;
                font-weight: 300;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 h2 {
                color: #f8e392;
                margin: 0 0 5px;
                font-weight: 300;
                font-size: 0.7em;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 h2 span {
                display: block;
                font-size: 1.5em;
                color: #f8e392;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 p {
                margin: 0 0 10px;
                font-size: 1.0em;
                font-family: 'Mitr', sans-serif;
                color: #ffffff;
            }
            .container {
                max-width: 895px; 
                width: 100%; 
                margin: 0 auto; 
            } 
            #select_employ{
                box-shadow: 4px 4px 0px 0px  #f76d6d;
                border: 2px solid #f76d6d;
            }

        </style>
    </head>

    <body>

        <!-- Query ข้อมูลนักแปล -->

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
        <!--<div class="column">-->
        <div class="container">

             <figure class="snip1336">
                 <!--รูปบนโปรไฟล์-->
                <img src="bgprofile.jpg" alt="sample87" height="170" width="300" />
                <figcaption>
                     <!--รูปโปรไฟล์-->
                      <img src="profile.png" class="profile" />
                    <h1> Eye ta</h1>
                    <h2><span>SKILL : การ์ตูน</span><span>LANGUAGE : ระดับสูง</span></h2>
                    <p>อิอิ xx</p>
                </figcaption>
                <select_employ>
                    <form action="SelectTranslatorServlet" method="POST">
                        <center>
                            <button id="select_employ" name="select_employ" value="3">
                                <div class = "button-text">จ้าง</div>
                            </button>
                        </center>
                    </form>
                </select_employ>
            </figure>

            <!--                <div class="profile-form">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                                <h2>Tran Thebest</h2><br><br><br><br>
                                <h3>รายละเอียด : จบการศึกษาจาก
ทำอาชีพ
เคยรับแปลงานมามากมาย</h3><br>
                                <h3>SKILL : วรรณกรรม</h3>
                                <h3>LANGUAGE : ระดับกลาง</h3>
                                <div class="employ">
                                    <center>
                                        ส่ง id นักแปลที่เลือกไป
                                        <form action="SelectTranslatorServlet" method="POST">
                                            <button id="select_employ" name="select_employ" value="2">
                                                <div class = "button-text">จ้าง</div>
                                            </button>
                                        </form>
                                    </center>
                                </div> 
                            </div>-->

            <figure class="snip1336">
               <img src="bgprofile.jpg" alt="sample87" height="170" width="300" />
                <figcaption>
                      <img src="profile.png" class="profile" />
                    <h1> Eye ta</h1>
                    <h2><span>SKILL : การ์ตูน</span><span>LANGUAGE : ระดับสูง</span></h2>
                    <p>อิอิ xx</p>
                </figcaption>
                <select_employ>
                    <form action="SelectTranslatorServlet" method="POST">
                        <center>
                            <button id="select_employ" name="select_employ" value="3">
                                <div class = "button-text">จ้าง</div>
                            </button>
                        </center>
                    </form>
                </select_employ>
            </figure>


            <!--                <div class="profile-form">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                                <h2>Eye ta</h2><br><br><br><br>
                                <h3>รายละเอียด : อิอิ xx</h3><br>
                                <h3>SKILL : การ์ตูน</h3>
                                <h3>LANGUAGE : ระดับสูง</h3>
                                <div class="employ">
                                    <center>
                                        ส่ง id นักแปลที่เลือกไป
                                        <form action="SelectTranslatorServlet" method="POST">
                                            <button id="select_employ" name="select_employ" value="3">
                                                <div class = "button-text">จ้าง</div>
                                            </button>
                                        </form>
                                    </center>
                                </div> 
                            </div>-->

             <figure class="snip1336">
                <img src="bgprofile.jpg" alt="sample87" height="170" width="300" />
                <figcaption>
                      <img src="profile.png" class="profile" />
                    <h1> Eye ta</h1>
                    <h2><span>SKILL : การ์ตูน</span><span>LANGUAGE : ระดับสูง</span></h2>
                    <p>อิอิ xx</p>
                </figcaption>
                <select_employ>
                    <form action="SelectTranslatorServlet" method="POST">
                        <center>
                            <button id="select_employ" name="select_employ" value="3">
                                <div class = "button-text">จ้าง</div>
                            </button>
                        </center>
                    </form>
                </select_employ>
            </figure>


            <!--                <div class="profile-form">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                                <h2>Por pi</h2><br><br><br><br>
                                <h3>รายละเอียด : เก่งนะ รู้ปะ</h3><br>
                                <h3>SKILL : วรรณกรรม</h3>
                                <h3>LANGUAGE : ระดับสูง</h3>
                                <div class="employ">
                                    <center>
                                        ส่ง id นักแปลที่เลือกไป
                                        <form action="SelectTranslatorServlet" method="POST">
                                            <button id="select_employ" name="select_employ" value="4">
                                                <div class = "button-text">จ้าง</div>
                                            </button>
                                        </form>
                                    </center>
                                </div> 
                            </div>-->

             <figure class="snip1336">
                <img src="bgprofile.jpg" alt="sample87" height="170" width="300" />
                <figcaption>
                    <img src="profile.png" class="profile" />
                    <h1> Eye ta</h1>
                    <h2><span>SKILL : การ์ตูน</span><span>LANGUAGE : ระดับสูง</span></h2>
                    <p>อิอิ xx</p>
                </figcaption>
                <select_employ>
                    <form action="SelectTranslatorServlet" method="POST">
                        <center>
                            <button id="select_employ" name="select_employ" value="3">
                                <div class = "button-text">จ้าง</div>
                            </button>
                        </center>
                    </form>
                </select_employ>
            </figure>


            <!--                <div class="profile-form">
                                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample4.jpg" alt="profile1" class="img"/><br><br><br><br><br><br>
                                <h2>Mo tangmo</h2><br><br><br><br>
                                <h3>รายละเอียด : เทพซ่า ฮ่าฮ่าบวก</h3><br>
                                <h3>SKILL : xx</h3>
                                <h3>LANGUAGE : ระดับสูง</h3>
                                <div class="employ">
                                    <center>
                                        ส่ง id นักแปลที่เลือกไป
                                        <form action="SelectTranslatorServlet" method="POST">
                                            <button id="select_employ" name="select_employ" value="5">
                                                <div class = "button-text">จ้าง</div>
                                            </button>
                                        </form>
                                    </center>
                                </div> 
                            </div>-->

        </div>
        <!--</div>-->
    </body>

</html>