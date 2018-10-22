<%-- 
    Document   : Order_Translator
    Created on : Oct 13, 2018, 5:52:46 PM
    Author     : may
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <% ArrayList list_order = (ArrayList) getServletContext().getAttribute("list_order"); %>

        <div class="createorder">
            <form action="AcceptOrderServlet" method="POST">
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
                                <div class="profile-form">
                                    <!--แสดงรายละเอียดข้อมูลการจ้าง-->
                                    <% for (int i = 0; i < list_order.size(); i++) {
                                            model.OrderTranslator item = (model.OrderTranslator) list_order.get(i);
                                                int id_order = item.getId_order();
                                                String desc = item.getDesc();
                                                String status = item.getStatus();%>
                                            <tr>
                                                <td> <p><%= desc %><br></p><br></td>
                                                <td>
                                                    <% if(status.equals("YES")){ %>
                                                        <h1>ยอมรับ</h1>
                                                    <% } if(status.equals("NO")) { %> 
                                                        <h1>ปฎิเสธ</h1>
                                                    <% } else { %>
                                                        <div class="bottonOrder">
                                                            <center>
                                                                <br>
                                                                <button class="button_select" name="select" value=<%= id_order %>_YES>YES</button>
                                                                <button class="button_select" name="select" value=<%= id_order %>_NO>NO</button>
                                                            </center>
                                                        </div>
                                                    <% } %>  
                                                </td>
                                            </tr>    
                                </div>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
        </div>
</center>
</body>
</html>
