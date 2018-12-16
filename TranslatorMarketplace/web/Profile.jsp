<%-- 
    Document   : newjsp
    Created on : Oct 10, 2018, 1:59:34 PM
    Author     : windypelo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
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
    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='index.html'>หน้าหลัก</a></li>
                    <li><a href='Create_order.html'>สร้างรายการ</a></li>
                    <li><a href='Order_customer.jsp'>ออเดอร์</a></li>
                    <li><a href='StatusOrderServlet'>สถานะ</a></li>
                    <li class='active'><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>

</head>

<body>

    <% Connection conn = (Connection) getServletContext().getAttribute("connection");

        String id_customer = (String) session.getServletContext().getAttribute("id_customer");

        PreparedStatement translator = conn.prepareStatement(
                "SELECT * FROM customers"
                + " JOIN translators USING (id_customer) "
                + " WHERE id_customer = ?;"
        );
        translator.setString(1, id_customer);

        ResultSet rs_translator = translator.executeQuery();

        while (rs_translator.next()) {%>

    <aside class="profile-card">

        <header>

            <!-- here’s the avatar -->
            <a href=#>
                <img src="profile.png" alt="eye"></a>
            </a>

            <!-- the username -->
            <h1><%= rs_translator.getString("name_customer")%></h1>

            <!-- and role or location -->
            <h2>นักแปล</h2>

        </header>

        <!-- bit of a bio; who are you? -->
        <div class="profile-bio">
            <p>E-mail: <%= rs_translator.getString("email")%></p><br><br>
            <p>Phone : <%= rs_translator.getString("phone")%></p><br><br>
            <p>Profile : <%= rs_translator.getString("profile")%></p><br><br>
            <p>Language : <%= rs_translator.getString("level_skill")%></p><br><br>
            <p>Skill : <%= rs_translator.getString("type_skill")%></p>
        </div>

        <center>
            <form action="OrderTranslatorServlet">
                <% session.getServletContext().setAttribute("id_translator", rs_translator.getInt("id_translator")); %>
                <button type="submit">
                    <div class = "button-text">
                        ออเดอร์นักแปล
                    </div>
                </button>
            </form>
        </center>
    </aside>

    <% } %>

</body>

</html>
