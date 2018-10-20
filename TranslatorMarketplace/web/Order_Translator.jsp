<%-- 
    Document   : Order_Translator
    Created on : Oct 13, 2018, 5:52:46 PM
    Author     : may
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Order_Translate</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='#'>หน้าหลัก</a></li>
                    <li><a href='#'>สร้างรายการ</a></li>
                    <li><a href='#'>ออเดอร์</a></li>
                    <li><a href='#'>สถานะ</a></li>
                    <li class='active'><a href='#'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>

    <body>


        <div class="createorder">
            <form action="Order_TranslatorServlet" method="POST">
                <div class = "formPattern">
                    <div class = "TableEmploy">
                        <!-- Tab links -->

                        <div class = "header">

                            <center><h1>รายการที่ถูกจ้าง</h1></center>
                            <!-- Create Table -->
                            <table Border="4" style="width: -webkit-fill-available" size="auto">
                                <tr>
                                    <th> รายละเอียดการจ้าง </th>
                                    <th> รับ/ปฏิเสธ </th>
                                </tr>


                                <sql:setDataSource var="data" 
                                                   driver="com.mysql.jdbc.Driver" 
                                                   user="root" 
                                                   password="root" 
                                                   url="jdbc:mysql://localhost:3306/mysql"/>

                                <!-- query data from database-->
                                <sql:query dataSource="${data}" var="result">
                                    select * from customers;
                                </sql:query> 

                                <!--แสดงรายละเอียดข้อมูลการจ้าง-->
                                <c:forEach var="row" items="${result.rows}">
                                    <div class="profile-form">
                                        <tr>
                                            <td> <p>รายละเอียดการจ้าง<br> <br></td>
                                            <td>  


                                                <div class="bottonOrder"><center>
                                                        <br>
                                                        <button class="button_select" name="select" value="${row.id_order}+YES">YES</button>
                                                        <button class="button_select" name="select" value="${row.id_order}+NO">NO</button>
                                                    </center>
                                                </div>
                                    </div>
                                    </tr>


                            </div>
                        </c:forEach>
                        </table>
                        <br>
                        <center> <button class="button_select" value="Confirm" name="Confirm">ยืนยันการจ้าง</button> </center>
                    </div>
                </div>
        </div>
    </form>
</div>

</center>
</body>
</html>
