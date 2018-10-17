<%-- 
    Document   : Order_customer
    Created on : Oct 16, 2018, 7:04:13 PM
    Author     : porpiraya
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>รายการที่สร้าง</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="style.css">

        <!-- CSS -->
        <style>
            .order-form {
                width: 750px;
                height: 250px;
                position: relative;
                padding: 10px;
                padding-right: 20px;
                transform: translate(0%,0);
                border-radius: 5px;
                background: #fff;
                border: 2px solid #003489;
                box-shadow: 8px 8px 0px 0px #003489;
                margin-bottom: 100px;
                margin-left: auto;
                margin-right: auto;
            }
            .order-text {
                left: 10px;
                top: 25px;
                position: relative;
                padding: 3%;
            }
            button {
                cursor: pointer;
                position: fixed;
                right: 10px;
            }
            .button_edit {
                top: 80px;
            }
            .button_select {
                top: 180px;
            }
        </style>
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

    <center><h1>รายการที่สร้าง</h1></center>

    <form action="OrderCustomerServlet" method="POST">
        <div class="row">
            <c:forEach var="row" items="${result.rows}">
                <div class="order-form">
                    <!--<div class="order-text">-->
                        <h3>ไฟล์ : ${row.file_create}</h3>
                        <h3>การแปล : ${row.translate_type}</h3>
                        <h3>คำอธิบาย : ${row.description}</h3>
                        <h3>จำนวนหน้า : ${row.num_page}</h3>
                        <h3>ไฟล์ : ${row.price}</h3>
                        <h3>วันรับงานแปล : ${row.due_date}</h3>
                    <!--</div>-->
                    <button class="button_edit">edit</button>
                    <button class="button_select" value="${row.id_order}">เลือกนักแปล</button>
                </div>
            </c:forEach>
        </div>
    </form>

</body>
</html>
