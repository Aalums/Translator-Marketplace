<%-- 
    Document   : Register
    Created on : Nov 5, 2018, 8:43:30 PM
    Author     : porpiraya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Register.jsp"></i>สมัครสมาชิก</a>
            <a href="Login.html">เข้าสู่ระบบ</a>
        </div>
    </div>
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='Create_order.html'>สร้างรายการ</a></li>
                    <li><a href='Order_customer.jsp'>ออเดอร์</a></li>
                     <li><a href='Order_Translator.jsp'>ออเดอร์นักแปล</a></li>
                    <li><a href='Status_Order.jsp'>สถานะ</a></li>
                    <li class='active'><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
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
                line-height: 0em;
                margin-bottom: 30px;
                letter-spacing: 1px;
            }
            .register-form {
                max-width: 600px;
                min-width: 490px;
                width: 80%;
                position: absolute;
                padding: 50px;
                padding-right: 54px;
                top: 200px;
                left: 50%;
                transform: translate(-50%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100px;
            }
            /* Base for label styling */
            [type="checkbox"]:not(:checked),
            [type="checkbox"]:checked {
                position: absolute;
                left: -9999px;
            }
            [type="checkbox"]:not(:checked) + label,
            [type="checkbox"]:checked + label {
                position: relative;
                padding-left: 1.95em;
                cursor: pointer;
                line-height: 25pt;
            }
            /* checkbox aspect */
            [type="checkbox"]:not(:checked) + label:before,
            [type="checkbox"]:checked + label:before {
                content: '';
                position: absolute;
                left: 0; top: 0;
                width: 1.25em; height: 1.25em;
                border: 2px solid #ccc;
                background: #fff;
                border-radius: 4px;
                box-shadow: inset 0 1px 3px rgba(0,0,0,.1);
            }
            /* checked mark aspect : เฉพาะcodeนี้ จะขึ้นchecked ทุกcheckbox*/
            [type="checkbox"]:not(:checked) + label:after,
            [type="checkbox"]:checked + label:after {
                content: '\2713\0020';
                position: absolute;
                top: .15em; left: .22em;
                font-size: 1.3em;
                line-height: 0.8;
                color: #09ad7e;
                transition: all .2s;
                font-family: 'Lucida Sans Unicode', 'Arial Unicode MS', Arial;
            }
            /* checked mark aspect changes : พอใส่codeนี้ที่checkedทุกcheckboxก่อนหน้าจะหาย แล้วเลือกcheckอันไหนก็ได้*/
            [type="checkbox"]:not(:checked) + label:after {
                opacity: 0;
                transform: scale(0);
            }
            [type="checkbox"]:checked + label:after {
                opacity: 1;
                transform: scale(1);
            }
            /* disabled checkbox */
            [type="checkbox"]:disabled:not(:checked) + label:before,
            [type="checkbox"]:disabled:checked + label:before {
                box-shadow: none;
                border-color: #bbb;
                background-color: #ddd;
            }
            [type="checkbox"]:disabled:checked + label:after {
                color: #999;
            }
            [type="checkbox"]:disabled + label {
                color: #aaa;
            }
            /* accessibility */
            [type="checkbox"]:checked:focus + label:before,
            [type="checkbox"]:not(:checked):focus + label:before {
                border: 2px dotted blue;
            }
            /* hover style just for information */
            label:hover:before {
                border: 2px solid #4778d9!important;
            }
        </style>
</head>
<body>

    <%
        //รับค่าที่เคยกรอกมาแสดง
        String id_customer = (String) session.getServletContext().getAttribute("regis_id_customer");
        String password = (String) session.getServletContext().getAttribute("regis_password");
        String name_customer = (String) session.getServletContext().getAttribute("regis_name_customer");
        String email = (String) session.getServletContext().getAttribute("regis_email");
        String phone = (String) session.getServletContext().getAttribute("regis_phone");

        if (id_customer == null) {
            id_customer = "";
            password = "";
            name_customer = "";
            email = "";
            phone = "";
        }
    %>

    <!-- Create Container + Logo -->
    <br><br><br>
    <div class="row">
        <div class="content-wrapper" style="padding-bottom: 699px;">
            <div class="container">
                <div class="col-sm-6">
                    <div class="login">
                        <div class = "form">
                            <div class = "header">
                                <center><h1>แก้ไขโปรไฟล์</h1></center>     
                            </div>

                            <form name="Form" action="RegisterServlet" method="POST" enctype="multipart/form-data">

                                <div class = "sign-in-form">
                                    <table style="width:100%">
                                        <tr>
                                            <td>
                                                <div class="text-center">
                                                    <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar" style=" max-width: 50%;">
                                                    <h6>เลือกภาพโปรไฟล์</h6>
                                                    <input type="file" class="text-center center-block file-upload" name="picture" >
                                                </div>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td>
                                                <h3>ชื่อ-นามสกุล</h3>
                                                <input type="text" name="name_customer" value="<%= name_customer%>" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <h3>อีเมล</h3>
                                                <input type="email" pattern=".+@gmail.com" name="email" value="<%= email%>" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <h3>เบอร์โทรศัพท์</h3>
                                                <input type="text" name="phone" value="<%= phone%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h3>USERNAME</h3>
                                                <input type="text" name="id_customer" value="<%= id_customer%>" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <h3>PASSWORD</h3>
                                                <input type="password" name="password" value="<%= password%>" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                        <center>
                                            <button type="submit">
                                                <div class = "button-text">
                                                    บันทึก
                                                </div>
                                            </button>
                                        </center>
                                        </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>                
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="login">
                        <div class = "form">
                            <div class = "header">
                                <center><h1>รายละเอียดนักแปล</h1></center>     
                            </div>

                            <div class = "sign-in-form">
                                <h3>DESCRIPTION</h3>
                                <textarea name="describe" rows="10" cols="50">
                                </textarea><br><br><br><br>

                                <h3>LANGUAGE LEVEL</h3>
                                <input type="radio" name="translate" value="highlv"> สูง
                                <input type="radio" name="translate" value="mediumlv" > ปานกลาง
                                <input type="radio" name="translate" value="standardlv"> พื้นฐาน

                                <form action="#">
                                    <h3>SKILL</h3>
                                    <input type="checkbox" id="box1" /><label for="box1">Cartoon</label>
                                    <input type="checkbox" id="box2" /><label for="box2">Novel</label>
                                    <input type="checkbox" id="box3" /><label for="box3">Academic</label>
                                    <input type="checkbox" id="box4" /><label for="box4">Poet</label>
                                    <input type="checkbox" id="box5" /><label for="box5">Documentary</label>
                                </form>
                                <br><br><br><br><br>

                                <center>
                                    <button type="submit">
                                        <div class = "button-text">
                                            บันทึก
                                        </div>
                                    </button>
                                </center>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>

