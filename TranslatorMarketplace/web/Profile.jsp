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

    <a href='Edit_profile.jsp'>Edit</a>

    <%
        //เช็คก่อนว่าเป็นนักแปล ?
        PreparedStatement check_translator = conn.prepareStatement(
                "SELECT * FROM translators"
                + " WHERE id_customer = ?;"
        );
        check_translator.setString(1, id_customer);

        ResultSet rs_check_translator = check_translator.executeQuery();
        if (rs_check_translator.next()) {
            //เป็นนักแปล
            PreparedStatement translator = conn.prepareStatement(
                    "SELECT * FROM customers"
                    + " JOIN translators USING (id_customer) "
                    + " WHERE id_customer = ?;"
            );
            translator.setString(1, id_customer);

            ResultSet rs_translator = translator.executeQuery();
            while (rs_translator.next()) {
    %>

    <aside class="profile-card">

        <header>

            <!-- here’s the avatar -->
            <% if (rs_translator.getString("picture") == null) {%>
            <a href=#>
                <img src="profile.png" alt="eye">
            </a>
            <% } else {%>
            <a href=#>
                <img src="<%= rs_translator.getString("picture")%>" alt="eye">
            </a>
            <% }%>

            <!-- the username -->
            <h1 id="name"><%= rs_translator.getString("name_customer")%></h1>

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

    </aside>

    <%
        }
    } else {
        //ไม่เป็นนักแปล
        PreparedStatement customer = conn.prepareStatement(
                "SELECT * FROM customers"
                + " WHERE id_customer = ?;"
        );
        customer.setString(1, id_customer);

        ResultSet rs_customer = customer.executeQuery();
        while (rs_customer.next()) {
    %>
    <aside class="profile-card">

        <header>

            <!-- here’s the avatar -->
            <% if (rs_customer.getString("picture") == null) {%>
            <a href=#>
                <img src="profile.png" alt="eye">
            </a>
            <% } else {%>
            <a href=#>
                <img src="<%= rs_customer.getString("picture")%>" alt="eye"></a>
            <% }%>

            <!-- the username -->
            <h1 id="name"><%= rs_customer.getString("name_customer")%></h1>

        </header>

        <!-- bit of a bio; who are you? -->
        <div class="profile-bio">
            <p>E-mail: <%= rs_customer.getString("email")%></p><br><br>
            <p>Phone : <%= rs_customer.getString("phone")%></p><br><br>
        </div>

        <center>
            <form action="register_translator.jsp">
                <button type="submit">
                    <div class = "button-text">
                        สมัครเป็นนักแปล
                    </div>
                </button>
            </form>
        </center>
    </aside>
    <%
            }
        }
    %>

</body>

</html>
