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
                    <img src="profile.png" class="avatar img-circle img-thumbnail" alt="avatar" style=" height: 200px ; width: 200px;">
                    <% } else {
                    %>
                    <img src="<%= rs_translator.getString("picture")%>" class="avatar img-circle img-thumbnail" alt="avatar" style=" height: 200px ; width: 200px;">
                    <% }%>


                    <%-- if (rs_translator.getString("picture") == null) {%>
                    <img src="profile.png" class="profile" />
                    <% } else {%>
                    <img src="<%= rs_translator.getString("picture")%>" class="profile" />
                    <% }--%> 

                    <h1><%= rs_translator.getString("name_customer")%></h1>
                    <h2>
                        <span>SKILL : <%= rs_translator.getString("type_skill")%></span>
                        <span>LANGUAGE : <%= rs_translator.getString("level_skill")%></span>
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
