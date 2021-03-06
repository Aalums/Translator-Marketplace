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

                        //column
                        int column = 12;
                        boolean check = false;

                        //เช็คว่าเป็นนักแปล?
                        PreparedStatement chk_translator = conn.prepareStatement(
                                "SELECT * FROM customers"
                                + " JOIN translators USING (id_customer) "
                                + " WHERE id_customer = ?;"
                        );
                        chk_translator.setString(1, id_customer);

                        ResultSet rs_chk_translator = chk_translator.executeQuery();
                        if (rs_chk_translator.next()) {
                            column = 6;
                            check = true;
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
        button {
            font-family: 'Mitr', sans-serif;
            box-sizing: border-box;
            outline: none;
            border: 2px solid #24305e;
            background: #f8e392;
            border-radius: 4px;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 15px;
            padding-bottom: 15px;
            margin-bottom: 30px;
            margin-top: 10px;
            transition: transform .2s, box-shadow .2s;
            transform: translate(-4px,-4px);
            box-shadow: 4px 4px 0px 0px #24305e;
            text-align: center;
        }
    </style>
</head>
<body>

    <%
        PreparedStatement profile = conn.prepareStatement(
                "SELECT * FROM customers"
                + " WHERE id_customer = ?;"
        );
        profile.setString(1, id_customer);

        ResultSet rs_profile = profile.executeQuery();
    %>

    <!-- Create Container + Logo -->
    <br><br><br>
    <div class="row">
        <div class="content-wrapper" style="padding-bottom: 699px;">
            <div class="container">
                <form name="Form" action="EditProfileServlet" method="POST" enctype="multipart/form-data">
                    <div class="login">
                        <div class = "form">
                            <div class = "header">
                                <center><h1>แก้ไขโปรไฟล์</h1></center>     
                            </div>
                            <% while (rs_profile.next()) {%>

                            <div class = "sign-in-form">
                                <table style="width:100%">
                                    <tr>
                                        <td>
                                            <div class="text-center">
                                                <%
                                                    if (rs_profile.getString("picture") == null) { %>
                                                <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail" alt="avatar" style=" height: 200px ; width: 200px;">
                                                <% } else {
                                                %>
                                                <img src="<%= rs_profile.getString("picture")%>" class="avatar img-circle img-thumbnail" alt="avatar" style=" height: 200px ; width: 200px;">
                                                <% }%>
                                                <h6>เลือกภาพโปรไฟล์</h6>
                                                <input type="file" class="text-center center-block file-upload" name="picture" >
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>ชื่อ-นามสกุล</h3>
                                            <input type="text" name="name_customer" value="<%= rs_profile.getString("name_customer")%>" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>อีเมล</h3> <br><font color="red" size="0.3px"> **กรุณาใช้ @gmail.com เท่านั้น!!! </font>
                                            <input type="email" pattern=".+@gmail.com" name="email" value="<%= rs_profile.getString("email")%>" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>เบอร์โทรศัพท์</h3>
                                            <input type="text" name="phone" value="<%= rs_profile.getString("phone")%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <h3>ชื่อผู้ใช้</h3>
                                            <input type="text"  readonly="readonly" name="id_customer" value="<%= rs_profile.getString("id_customer")%>" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>รหัสผ่าน</h3>
                                            <input type="password" name="password" value="<%= rs_profile.getString("password")%>" />
                                        </td>
                                    </tr>

                                    <!--  กรณีเป็นนักแปล -->

                                    <%
                                        if (check) {
                                            PreparedStatement translator = conn.prepareStatement(
                                                    "SELECT * FROM customers"
                                                    + " JOIN translators USING (id_customer) "
                                                    + " WHERE id_customer = ?;"
                                            );
                                            translator.setString(1, id_customer);

                                            ResultSet rs_translator = translator.executeQuery();
                                            if (rs_translator.next()) {
                                    %>

                                    <tr>
                                        <td>
                                            <div class = "header">
                                                <center><h1>นักแปล</h1></center>     
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>รายละเอียดเกี่ยวกับนักแปล</h3>
                                            <textarea name="describe" rows="10" cols="50"><%= rs_translator.getString("profile")%>
                                            </textarea>
                                        </td>
                                    </tr>
                                    <%
                                        //RadioButton
                                        String chkRad1 = "";
                                        String chkRad2 = "";
                                        String chkRad3 = "";
                                        String level = rs_translator.getString("level_skill");
                                        if (level.equals("สูง")) {
                                            chkRad1 = "checked";
                                        } else if (level.equals("ปานกลาง")) {
                                            chkRad2 = "checked";
                                        } else if (level.equals("พื้นฐาน")) {
                                            chkRad3 = "checked";
                                        }

                                        //CheckBox
                                        String chkBox1 = "";
                                        String chkBox2 = "";
                                        String chkBox3 = "";
                                        String chkBox4 = "";
                                        String chkBox5 = "";
                                        String[] type = rs_translator.getString("type_skill").split(" ");
                                        for (int i = 0; i < type.length; i++) {
                                            if (type[i].equals("การ์ตูน")) {
                                                chkBox1 = "checked";
                                            } else if (type[i].equals("นิยาย")) {
                                                chkBox2 = "checked";
                                            } else if (type[i].equals("วิชาการ")) {
                                                chkBox3 = "checked";
                                            } else if (type[i].equals("บทประพันธ์")) {
                                                chkBox4 = "checked";
                                            } else if (type[i].equals("เอกสารทั่วไป")) {
                                                chkBox5 = "checked";
                                            }
                                        }
                                    %>
                                    <tr>
                                        <td>
                                            <h3>ระดับภาษาอังกฤษ</h3>
                                            <input <%= chkRad1%> id="chkRad1" type="radio" name="translate" value="สูง"> สูง
                                            <input <%= chkRad2%> id="chkRad2" type="radio" name="translate" value="ปานกลาง" > ปานกลาง
                                            <input <%= chkRad3%> id="chkRad3" type="radio" name="translate" value="พื้นฐาน"> พื้นฐาน
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <h3>ทักษะพิเศษ</h3>
                                            <input <%= chkBox1%> type="checkbox" id="box1" name="box" value="การ์ตูน" /><label for="box1">การ์ตูน</label>
                                            <input <%= chkBox2%> type="checkbox" id="box2" name="box" value="นิยาย" /><label for="box2">นิยาย</label>
                                            <input <%= chkBox3%> type="checkbox" id="box3" name="box" value="วิชาการ" /><label for="box3">วิชาการ</label>
                                            <input <%= chkBox4%> type="checkbox" id="box4" name="box" value="บทประพันธ์" /><label for="box4">บทประพันธ์</label>
                                            <input <%= chkBox5%> type="checkbox" id="box5" name="box" value="เอกสารทั่วไป" /><label for="box5">เอกสารทั่วไป</label>
                                        </td>
                                    </tr>
                                    <% }
                                        }
                                    %>
                                   <tr>
                                        <td>
                                    <center>
                                        <br>
                                        <button type="submit">
                                            <div class = "button-text">
                                                <a href="register_translator.jsp"></a>
                                                บันทึก
                                            </div>
                                        </button>
                                    </center>
                                    </td>
                                  </tr>

                                </table>
                            </div>

                            <% }%>

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>

