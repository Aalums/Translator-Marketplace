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
        <title>View PDF</title>
        <style>
            .container {
                padding: 30px;
            }
        </style>
    </head>
    <body>
        <% int id_order = Integer.parseInt(request.getParameter("view"));

            Connection conn = (Connection) getServletContext().getAttribute("connection");

            PreparedStatement ps = conn.prepareStatement(
                    "SELECT file_order FROM ordered WHERE id_order = ?"
            );
            ps.setInt(1, id_order);

            ResultSet rs = ps.executeQuery();
            rs.next();

            String file = rs.getString("file_order");%>

        <h1><%= file%></h1>
        <div class="container">
            <center> <embed src=<%= file%> type="application/pdf" style="width: 80%; height: 45em;"/> </center> 
        </div>

    </body>
</html>

