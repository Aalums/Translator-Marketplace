<%-- 
    Document   : rejister_translator
    Created on : Dec 16, 2018, 11:02:21 AM
    Author     : porpiraya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register_Translator</title>
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

        <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");
        %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Profile.jsp"> <%= id_customer%> </a>
            <a href="LogoutServlet">ออกจากระบบ</a>
        </div>
    </div>

    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='Create_order.jsp'>สร้างรายการ</a></li>
                    <li><a href='Order_customer.jsp'>ออเดอร์</a></li>
                    
                    <%
                        Connection conn = (Connection) getServletContext().getAttribute("connection");

                        //เช็คว่าเป็นนักแปล?
                        PreparedStatement chk_translator = conn.prepareStatement(
                                "SELECT * FROM customers"
                                + " JOIN translators USING (id_customer) "
                                + " WHERE id_customer = ?;"
                        );
                        chk_translator.setString(1, id_customer);

                        ResultSet rs_chk_translator = chk_translator.executeQuery();
                        if (rs_chk_translator.next()) {
                            session.getServletContext().setAttribute("id_translator", rs_chk_translator.getInt("id_translator"));
                    %>
                    <li><a href='OrderTranslatorServlet'>ออเดอร์นักแปล</a></li>
                    <% } %>
                    
                    <li><a href='Status_Order.jsp'>สถานะ</a></li>
                    <li class='active'><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
</head>
<body>

    <script type="text/javascript">
        function isEmpty(form)
        {
            var a = document.forms["Form"]["describe"].value;
            if (a == null || a == "") {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return false;
            }
            if (form.translate[0].checked==false && 
                    form.translate[1].checked==false && 
                    form.translate[2].checked==false) {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return false;
            }
            if (form.box[0].checked==false && 
                    form.box[1].checked==false &&
                    form.box[2].checked==false &&
                    form.box[3].checked==false &&
                    form.box[4].checked==false) {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return false;
            }
        }
    </script>

    <!-- Create Container + Logo -->
    <div class="content-wrapper" style="padding-bottom: 699px;">
        <div class="container">
            <div class="login">

                <form action="RegisterTranslatorServlet" method="POST" name="Form" onsubmit="return isEmpty(this)">

                    <div class = "form">
                        <div class = "header">
                            <center><h1>สมัครนักแปล</h1></center>     
                        </div>

                        <div class = "sign-in-form">
                            <h3>รายละเอียดเกี่ยวกับนักแปล</h3>
                            <textarea name="describe" rows="10" cols="50" value="">
                            </textarea><br><br><br><br>

                            <h3>ระดับภาษาอังกฤษ</h3>
                            <input type="radio" name="translate" value="สูง"> สูง
                            <input type="radio" name="translate" value="ปานกลาง" > ปานกลาง
                            <input type="radio" name="translate" value="พื้นฐาน"> พื้นฐาน

                            <form action="#">
                                <h3>ทักษะพิเศษ</h3>
                                <input type="checkbox" id="box1" name="box" value="การ์ตูน" /><label for="box1">การ์ตูน</label>
                                <input type="checkbox" id="box2" name="box" value="นิยาย" /><label for="box2">นิยาย</label>
                                <input type="checkbox" id="box3" name="box" value="วิชาการ" /><label for="box3">วิชาการ</label>
                                <input type="checkbox" id="box4" name="box" value="บทประพันธ์" /><label for="box4">บทประพันธ์</label>
                                <input type="checkbox" id="box5" name="box" value="เอกสารทั่วไป" /><label for="box5">เอกสารทั่วไป</label>
                            </form>
                            <br><br><br><br><br>

                            <center>
                                <button type="submit">
                                    <div class = "button-text">
                                        สมัครนักแปล
                                    </div>
                                </button>
                            </center>
                        </div>
                    </div>

                </form>

            </div>
        </div>
    </div>
</body>
</html>
