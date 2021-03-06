<%-- 
     Document   : translator
     Created on : Oct 11, 2018, 11:32:48 AM
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
        <title>เลือกนักแปล</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <style>
            .snip1336 {
                position: relative;
                float: left;
                overflow: hidden;
                margin: 10px 1%;
                min-width: 230px;
                max-width: 280px;
                width: 100%;
                color: #ffffff;
                text-align: left;
                line-height: 1.4em;
                background-color: #333333;
                border-radius: 2%;
                box-shadow: 4px 4px 7px 0px rgba(0, 0, 0, 0.23);
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 * {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                -webkit-transition: all 0.25s ease;
                transition: all 0.25s ease;
            }
            .snip1336 img {
                max-width: 100%;
                vertical-align: central;
            }
            .snip1336 figcaption {
                width: 100%;
                background-color: #333333;
                padding: 25px;
                position: relative;
                height: 15em;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 select_employ {
                width: 100%;
                background-color: #333333;
                padding: 25px;
                position: relative;
            }
            .snip1336 figcaption:before {
                position: absolute;
                content: '';
                bottom: 100%;
                left: 0;
                width: 0;
                height: 0;
                border-style: solid;
                border-width: 55px 0 0 400px;
                border-color: transparent transparent transparent #f76d6d;
            }
            .snip1336 figcaption a {
                padding: 5px;
                border: 1px solid #ffffff;
                color: #ffffff;
                font-size: 0.7em;
                text-transform: uppercase;
                margin: 10px 0;
                display: inline-block;
                width: 47%;
                text-align: center;
                text-decoration: none;
                font-weight: 600;
                letter-spacing: 1px;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 figcaption a:hover {
                opacity: 1;
            }
            .snip1336 .profile {
                border-radius: 50%;
                position: absolute;
                bottom: 100%;
                margin-bottom: 18px;
                top: -67%;
                left: 78px;
                z-index: 1;
                max-width: 200px;
                max-height: 200px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
            }
            .snip1336 .follow {
                margin-right: 4%;
                border-color: #2980b9;
                color: #2980b9;
            }
            .snip1336 h1 {
                font-size: x-large;
                color: white;
                text-align: center;
                margin: 0 0 5px;
                font-weight: 300;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 h2 {
                color: #f8e392;
                margin: 0 0 5px;
                font-weight: 300;
                font-size: 0.7em;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 h2 span {
                display: block;
                font-size: 1.5em;
                color: #f8e392;
                font-family: 'Mitr', sans-serif;
            }
            .snip1336 p {
                margin: 0 0 10px;
                font-size: 1.0em;
                font-family: 'Mitr', sans-serif;
                color: #ffffff;
            }
            .container {
                max-width: 895px; 
                width: 100%; 
                margin: 0 auto; 
            } 
            #select_employ{
                box-shadow: 4px 4px 0px 0px  #f76d6d;
                border: 2px solid #f76d6d;
            }
            a {
                font-size: 35px;
                width: 20px;
                height: 20px;
                padding-right: 20px;
                padding-left: 20px;
                border-radius: 50%;
                top:60px;
                left:20%;
                background-color: #f76d6d;
                color: white;
                position: relative;
                text-decoration: none;
                text-transform: uppercase;
            }

            a:hover {
                background-color: #333333;
            }

        </style>
    </head>

    <body>
        <a href='Order_customer.jsp' class="button6">&#8249;</a>

        <!-- id cus จากตอน login -->
        <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");

            Connection conn = (Connection) getServletContext().getAttribute("connection");
            PreparedStatement translator = conn.prepareStatement(
                    "SELECT * FROM translators"
                    + " JOIN customers USING (id_customer) "
                    + " WHERE id_customer not in (?);"
            );
            translator.setString(1, id_customer);

            ResultSet rs_translator = translator.executeQuery();
        %>

        <!-- Create Header -->
        <br>
        <br>     
        <div class="header">

            <center>
                <h1>นักแปล</h1>
            </center>
        </div>

        <!-- Create Column-->
        <div class="container">

            <!--ดึงข้อมูลจากตารางมาแสดง-->
            <% while (rs_translator.next()) { %>

            <figure class="snip1336">
                <!--รูปบนโปรไฟล์-->
                <img src="bgprofile.jpg" alt="sample87" height="170" width="300" />
                <figcaption>
                    <!--รูปโปรไฟล์-->

                    <%
                       if (rs_translator.getString("picture") == null) { %>
                       <img src="profile.png" class="profile" style=" height: 120px ; width: 120px; margin:auto; display:block;" > <%--วิธีแรก--%>
                        <% } else {
                        %>
                    <img src="<%= rs_translator.getString("picture")%>" class="profile" style=" height: 120px ; width: 120px; margin:auto; display:block; text-align:center; "> <%--วิธีสอง--%>
                        <% }%>

                    <h1 style="font-size: 20px;"><%= rs_translator.getString("name_customer")%></h1>
                    <h2>
                        <span style="font-size: 14px;">อีเมล : <%= rs_translator.getString("email")%></span>
                        <span>ทักษะพิเศษ : <%= rs_translator.getString("type_skill")%></span>
                        <span>ระดับภาษาอังกฤษ : <%= rs_translator.getString("level_skill")%></span>
                    </h2>
                    <p><%= rs_translator.getString("profile")%></p>
                </figcaption>
                <select_employ>
                    <form action="Confirm_select_tran.jsp" method="POST">
                        <center>
                            <button id="select_employ" name="select_employ" value="<%= rs_translator.getString("id_translator")%>">
                                <div class = "button-text">จ้าง</div>
                            </button>
                        </center>
                    </form>
                </select_employ>
            </figure>

            <% }%>

        </div>

    </body>
</html>
