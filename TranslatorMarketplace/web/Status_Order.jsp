<%-- 
    Document   : Profile_cus
    Created on : Oct 12, 2018, 9:21:57 PM
    Author     : windypelo
--%>

<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="CSS_ProCus.css" type="text/css"/>
        <link rel="stylesheet" href="CSS_ProCus.css" type="text/css">

    </head>

    <center>
        <div id='cssmenu'>
            <ul>
                <li><a href='#'>หน้าหลัก</a></li>
                <li><a href='#'>สร้างรายการ</a></li>
                <li class='active'><a href='#'>ออเดอร์</a></li>
                <li><a href='#'>สถานะ</a></li>
                <li><a href='#'>โปรไฟล์</a></li>
            </ul>
        </div>
    </center>

    <body>
         ArrayList list_ord = (ArrayList) session.getAttribute("list_order");%>

        <div class = "form">
            <div class = "sign-in-form">
                <br><br>

                <tr>
                    <td>
                        <h2 align="center">รายการจ้างแปล</h2> 
                        <br><br><br>


            </div>


            <title>ตารางยังไม่ได้วนลูปนะ</title>
            <div>

                <center>
                    <table border="2" width = "80%" height = "50%">
                        <thead>
                            <tr>
                        <p><TH bgcolor = "orange" > รายการจ้าง  </TH></p>
                        <p><TH bgcolor = "orange" > นักแปล </TH></p>
                        <p><TH bgcolor = "orange" > สถานะ </TH></p>
                        </tr>
                        </thead>
                        <tbody>
                            <% //put in TABLE
                                for (int i = 0; i < list_ord.size(); i++) {
                                    model.Order_customer item = (model.Order_customer) list_ord.get(i);
                                    String title = item.getTitle();
                                    String name = item.getName();
                                    String status = item.getStatus();
                                    if (name == null) {%>
                            <!--button SELECT TRANSLATOR-->
                            <tr>
                                <td><p><%= title%></p></td>
                                <td><p>Button</p></td>
                                <td><p>NO</p></td>
                            </tr>
                            <% } else {%>
                            <tr>
                                <td><p><%= title%></p></td>
                                <td><p><%= name%></p></td>
                                <td><p><%= status%></p></td>
                            </tr>
                            <% }
                                     }%>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </td>    
</tr>    

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script  src="js/index.js"></script>

</body>

</html>