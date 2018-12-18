<%-- 
    Document   : Create_order
    Created on : Dec 18, 2018, 10:45:53 AM
    Author     : ASUS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>สร้างรายการจ้างแปล</title>
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
                    <li class='active'><a href='#'>สร้างรายการ</a></li>
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
                    
                    <li><a href='StatusOrderServlet'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
</head>

<body>

    <script type="text/javascript">
        function isEmpty()
        {
            var a = document.forms["Form"]["title"].value;
            var b = document.forms["Form"]["translate"].value;
            var c = document.forms["Form"]["num_page"].value;
            var d = document.forms["Form"]["description"].value;
            var e = document.forms["Form"]["orderdate"].value;
            var f = document.forms["Form"]["file_create"].value;
            if (a == null || a == "", b == null || b == "", c == null || c == "",
                    d == null || d == "", e == null || e == "", f == null || f == "")
            {
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
                return false;
            }
        }
    </script>

    <div class="content-wrapper" style="padding-bottom: 699px;">
        <div class="container">
            <div class="createorder">
                <form action="CreateOrderServlet" enctype='multipart/form-data' method="POST" name="Form" onsubmit="return isEmpty()">
                    <div class = "form">
                        <div class = "header">
                            <center><h1>สร้างรายการจ้างแปล</h1></center>     
                        </div>

                        <div class = "sign-in-form">
                            <table style="width:100%">
                                <tr>
                                    <td>
                                        <h3>ชื่องาน</h3>
                                        <input type="text" name="title" value="" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h3>การแปล</h3><br><br><br>
                                        <input type="radio" name="translate" value="thaieng"> ไทย -> อังกฤษ
                                        <input type="radio" name="translate" value="engthai" > อังกฤษ -> ไทย
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>จำนวนหน้า &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ราคา</h3>
                                        <div class="product">
                                            <div class="product-quantity">
                                                <input type="number" name="num_page" value="1" min="1">
                                            </div>
                                            <div class="product-line-price">120.0</div>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>รายละเอียดงาน</h3>
                                        <input type="text" name="description" value="" /> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h3>กำหนดวันรับงานแปล</h3><br>
                                        <input type="date" name="orderdate" id="orderdate" value="">
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <h3>แนบไฟล์ที่ต้องการแปล</h3> <br><br><br><br>
                                        <input type="file" name="file_create" /><br><br>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                <center>
                                    <button type="submit">
                                        <div class = "button-text">
                                            สร้างรายการจ้าง
                                        </div>
                                    </button>
                                </center>
                                </td>
                                </tr>
                            </table>
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
