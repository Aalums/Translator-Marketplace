<%-- 
    Document   : Order_customer
    Created on : Oct 16, 2018, 11:03:32 PM
    Author     : user
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="data" 
                           driver="com.mysql.jdbc.Driver" 
                           user="root" 
                           password="root" 
                           url="jdbc:mysql://localhost:3306/test"/>

        <sql:query dataSource="${data}" var="result">
            SELECT *
            FROM create_order;
        </sql:query>
            
        <form action="OrderCustomerServlet" method="POST">
            <c:forEach var="row" items="${result.rows}">
                <p> จำนวนหน้า : ${row.num_page} </p>
                <p> การแปล : ${row.translate_type} </p>
                <button name="select" value="${row.id_order}">จ้างนักแปล</button>
            </c:forEach>
        </form>
    </body>
</html>
