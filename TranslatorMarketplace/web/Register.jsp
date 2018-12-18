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
        <title>Register</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");
            if (id_customer == null) {
                //ยังไม่เข้าสู่ระบบ
        %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Register.jsp">สมัครสมาชิก</a>
            <a href="Login.jsp">เข้าสู่ระบบ</a>
        </div>
    </div>

    <% } else {%>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Profile.jsp"> <%= id_customer%> </a>
            <a href="LogoutServlet">ออกจากระบบ</a>
        </div>
    </div>

    <% }
    %>

    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
    </div>
</head>
<body>
    
    <script type="text/javascript">
        function isEmpty()
        {
            var a = document.forms["Form"]["name_customer"].value;
            var b = document.forms["Form"]["email"].value;
            var c = document.forms["Form"]["phone"].value;
            var d = document.forms["Form"]["id_customer"].value;
            var e = document.forms["Form"]["password"].value;
            var f = document.forms["Form"]["picture"].value;
            if (a == null || a == "", b == null || b == "", c == null || c == "",
                    d == null || d == "", e == null || e == "", f == null || f == "")
            {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return false;
            }
        }
    </script>

    <%
        //รับค่าที่เคยกรอกมาแสดง
        String regis_id_customer = (String) session.getServletContext().getAttribute("regis_id_customer");
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
    <div class="content-wrapper" style="padding-bottom: 699px;">
        <div class="container">
            <div class="login">
                <div class = "form">
                    <div class = "header">
                        <center><h1>สมัครสมาชิก</h1></center>     
                    </div>

                    <form name="Form" action="RegisterServlet" method="POST" name="Form" onsubmit="return isEmpty()" enctype="multipart/form-data">

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
                                            สมัคร
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
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="js/index.js"></script>
</body>
</html>

