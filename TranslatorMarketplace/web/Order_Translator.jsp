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
        <title>Translate</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
    <center>
        <a href="https://www.picz.in.th/image/kC2A9R"><img src="https://www.picz.in.th/images/2018/10/10/kC2A9R.png" alt="kC2A9R.png" border="0" width ="180px" hight ="160px"/></a>
        <div id='cssmenu'>
            <ul>
                <li><a href='#'><span>หน้าหลัก</span></a></li>
                <li><a href='#'><span>รายการจ้าง</span></a></li>
                <li><a href='#'><span>รับจ้างแปล</span></a></li>
                <li><a href='#'><span>ออกจากระบบ</span></a></li>
            </ul>
        </div>

        <div class="createorder">
            <form action="Order_TranslatorServlet" method="POST">
                <div class = "formPattern">
                    <div class = "TableEmploy">
                        <!-- Tab links -->

                        <div class = "header">
                            <a href="https://www.picz.in.th/image/kC2A9R"><img src="https://www.picz.in.th/images/2018/10/10/kC2A9R.png" alt="kC2A9R.png" border="0" width ="180px" hight ="160px"/></a>
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
                                            <td> <p>รายละเอียดการจ้าง <br>${row.name_customer}</p><br></td>
                                            <td> <input type="radio" name="select" value="${row.id_order}+_YES" /> Yes   <input type="radio" name="select" value="${row.id_order}+_NO" /> No</td>
                                        </tr>
                                    </div>
                                </c:forEach>
                            </table>
                            <input type="submit" value="Confirm" name="Confirm" />
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </center>
</body>
</html>
