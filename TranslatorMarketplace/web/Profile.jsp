<%-- 
    Document   : newjsp
    Created on : Oct 10, 2018, 1:59:34 PM
    Author     : windypelo
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
    
    <sql:setDataSource var="data" 
                       driver="com.mysql.jdbc.Driver" 
                       user="root" 
                       password="root"  
                       url="jdbc:mysql://localhost:3306/test"/>

    <c:set var="id" value="admin" />

    <sql:query dataSource="${data}" var="result">
        SELECT *
        FROM customers
        JOIN translators USING (id_customer) 
        WHERE id_customer = ?;
        <sql:param value="${id}"/>
    </sql:query>

    <c:forEach var="row" items="${result.rows}"> 
        <aside class="profile-card">

            <header>

                <!-- here’s the avatar -->
                <a href=#>
                    <img src="profile.png" alt="eye"></a>
                </a>

                <!-- the username -->
                <h1>${row.name_customer}</h1>

                <!-- and role or location -->
                <h2>นักแปล</h2>

            </header>

            <!-- bit of a bio; who are you? -->
            <div class="profile-bio">
                <p>E-mail: ${row.email}</p><br><br>
                <pPhone : ${row.phone}</p><br><br>
                <p>Profile : ${row.profile}</p><br><br>
                <p>Language : ${row.level_skill}</p><br><br>
                <p>Skill : ${row.type_skill}</p>
            </div>
            
            <center>
               <form action="OrderTranslatorServlet">
                    <button type="submit">
                        <div class = "button-text">
                            ออเดอร์นักแปล
                        </div>
                    </button>
                </form>
            </center>
        </aside>
                
    </c:forEach>

</body>

</html>
