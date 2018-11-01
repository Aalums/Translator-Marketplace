

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>รายการที่สร้าง</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='index.html'>หน้าหลัก</a></li>
                    <li><a href='Create_order.html'>สร้างรายการ</a></li>
                    <li class='active'><a href='Order_customer.jsp'>ออเดอร์</a></li>
                    <li><a href='StatusOrderServlet'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
    <!-- CSS -->
    <style>
        .order-form {
            width: 750px;
            height: 270px;
            position: relative;
            padding: 10px;
            padding-right: 20px;
            transform: translate(0%,0);
            border-radius: 5px;
            background: #fff;
            border: 2px solid #003489;
            box-shadow: 8px 8px 0px 0px #003489;
            margin-bottom: 100px;
            margin-left: auto;
            margin-right: auto;
        }
        .order-text {
            left: 10px;
            top: 25px;
            position: relative;
            padding: 3%;
        }
        .order-form h3, a{
            line-height: 2;
        }
        button {
            cursor: pointer;
            position: fixed;
            right: 10px;
        }
        .button_edit {
            top: 80px;
        }
        .button_select {
            top: 180px;
        }
    </style>
</head>
<body>
    <!-- -->
    <% Connection conn = (Connection) getServletContext().getAttribute("connection");

        ArrayList id_order = new ArrayList();

        PreparedStatement ordered = conn.prepareStatement(
                "SELECT id_order FROM ordered"
                + " GROUP BY id_order;"
        );

        PreparedStatement create_order = conn.prepareStatement(
                "SELECT * FROM customers"
                + " JOIN create_order USING (id_customer) "
                + " WHERE id_customer = 'admin';"
        );

        ResultSet rs_ordered = ordered.executeQuery();
        ResultSet rs_create = create_order.executeQuery();

        while (rs_ordered.next()) {
            id_order.add(rs_ordered.getInt("id_order"));
        }
    %>

<center><h1>รายการที่สร้าง</h1></center>

<div class="row">
    <% while (rs_create.next()) {%>
    <div class="order-form">
        <!--<div class="order-text">-->
        <h3>รายการ : <%= rs_create.getInt("id_order")%> </h3>
        <h3>ไฟล์ : <%= rs_create.getString("file_create")%> </h3>
        <h3>การแปล : <%= rs_create.getString("translate_type")%> </h3>
        <h3>คำอธิบาย : <%= rs_create.getString("description")%> </h3>
        <h3>จำนวนหน้า : <%= rs_create.getInt("num_page")%> </h3>
        <h3>ราคา : <%= rs_create.getFloat("price")%> </h3>
        <h3>วันรับงานแปล : <%= rs_create.getDate("due_date")%> </h3>
        <% if (!id_order.contains(rs_create.getInt("id_order"))) { %>
        <form action="Edit_order.jsp" method="POST">
            <button class="button_edit" name="edit_order" value=<%= rs_create.getInt("id_order") %>>แก้ไข</button>
        </form>
        <% } %>
        <form action="OrderCustomerServlet" method="POST">
            <button class="button_select" name="select_order" value=<%= rs_create.getInt("id_order") %>>เลือกนักแปล</button>
        </form>
    </div>
    <% }%>
</div>

</body>
</html>
