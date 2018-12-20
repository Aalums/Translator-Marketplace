<%-- 
    Document   : ViewFileorder
    Created on : Dec 15, 2018, 9:47:47 PM
    Author     : eyenach
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <title>View PDF</title>
        <style>
            .container {
                padding: 30px;
            }
           a {
                font-size: 35px;
                width: 59px;
                height: 66px;
                padding-right: 25px;
                padding-left: 22px;
                padding-bottom: 4px;
                border-radius: 50%;
                top: 50px;
                left: 6%;
                background-color: #f76d6d;
                color: white;
                position: relative;
                text-decoration: none;
                text-transform: uppercase;
                font-family: 'Mitr', sans-serif;
            }

            a:hover {
                background-color: #333333;
            }
            body {
                
                margin: 0;
                line-height: 0.5;
                color: #24305e;
                /*  background: #ffdf00;*/
                font-family: 'Mitr', sans-serif;
            }
        </style>
    </head>
    <body>
        <% int id_order = Integer.parseInt(request.getParameter("view"));

            Connection conn = (Connection) getServletContext().getAttribute("connection");

            PreparedStatement ps = conn.prepareStatement(
                    "SELECT file_order FROM ordered WHERE id_order = ? AND file_order is not null"
            );
            ps.setInt(1, id_order);

            ResultSet rs = ps.executeQuery();
            rs.next();

            String file = rs.getString("file_order");%>
            
            <a href="javascript:history.back();" class="button6" style=" font-family: 'Mitr', sans-serif;">&#8249;</a>

        <div class="container">
            <center> <embed src=<%= file%> type="application/pdf" style="width: 80%; height: 45em;"/> </center> 
        </div>

    </body>
</html>

