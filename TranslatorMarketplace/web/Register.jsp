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
        Connection conn = (Connection) getServletContext().getAttribute("connection");
        
        PreparedStatement id_customer = conn.prepareStatement(
                "SELECT id_customer FROM customers;"
        );
        
        ResultSet rs_customer = ordered.executeQuery();
        
        //เก็บ id ของลูกค้าทั้งหมดในตารางไว้เช็ค id ที่ลูกค้าใหม่จะสมัครเข้ามา
        ArrayList id_customer = new ArrayList();
        
        while (rs_customer.next()) {
            id_customer.add(rs_customer.getString("id_customer"));
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

                    <form action="RegisterServlet" method="POST" enctype="multipart/form-data">

                        <div class = "sign-in-form">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <h3>ID_CUSTOMER</h3>
                                        <input type="text" name="id_customer" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>PASSWORD</h3>
                                        <input type="text" name="password" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>NAME_CUSTOMER</h3>
                                        <input type="text" name="name_customer" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>E-MAIL</h3>
                                        <input type="text" name="email" value="" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>PHONE</h3>
                                        <input type="text" name="phone" value="" />
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

