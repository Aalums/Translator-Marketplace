<%-- 
    Document   : ViewFile
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
        <% Connection conn = (Connection) getServletContext().getAttribute("connection");
        
            int id_order = Integer.parseInt(request.getParameter("file_create")); %>
            
            <h1><%= id_order %></h1>

        <%    PreparedStatement ps = conn.prepareStatement("SELECT * FROM ordered WHERE id_order = ? AND status = ?");
            ps.setInt(1, id_order);
            ps.setString(2, "YES");
            
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                String file = rs.getString("file_order");%>
        
                <h1><%= file %></h1>
                <div class="container">
                    <center> <embed src=<%= file %> type="application/pdf" style="width: 80%; height: 45em;"/> </center> 
                </div>
                
            <% } %>

    </body>
</html>

