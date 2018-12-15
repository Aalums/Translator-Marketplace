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
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
    </div>
</head>
<body>

    <%
        //รับค่าที่เคยกรอกมาแสดง
        String id_customer = (String) session.getServletContext().getAttribute("id_customer");
        String password = (String) session.getServletContext().getAttribute("password");
        String name_customer = (String) session.getServletContext().getAttribute("name_customer");
        String email = (String) session.getServletContext().getAttribute("email");
        String phone = (String) session.getServletContext().getAttribute("phone");
        //String picture = (String) session.getServletContext().getAttribute("picture");

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

                    <form name="Form" action="RegisterServlet" method="POST" enctype="multipart/form-data">

                        <div class = "sign-in-form">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <h3>ID_CUSTOMER</h3>
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
                                        <h3>NAME_CUSTOMER</h3>
                                        <input type="text" name="name_customer" value="<%= name_customer%>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>E-MAIL</h3>
                                        <input type="email" pattern=".+@gmail.com" name="email" value="<%= email%>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>PHONE</h3>
                                        <input type="text" name="phone" value="<%= phone%>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>PICTURE</h3><br><br>
                                        <input type="file" name="picture" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                <center>
                                    <button type="submit">
                                        <div class = "button-text">
                                            REGISTER
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
</body>
</html>

