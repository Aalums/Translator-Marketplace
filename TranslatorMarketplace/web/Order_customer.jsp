<%-- 
    Document   : Order_customer
    Created on : Oct 11, 2018, 9:38:32 PM
    Author     : eyenach
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% ArrayList list_ord = (ArrayList) session.getAttribute("list_order");
        for(int i=0; i<list_ord.size(); i++){
            model.Order_customer item = (model.Order_customer) list_ord.get(i);
            out.println(item.getTitle()+" "+item.getName()+" "+item.getStatus());
        }
        %>
    </body>
</html>
