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
                <li><a href='#'><span>หน้าหลัก</span></a></li>
                <li><a href='#'><span>จ้างแปล</span></a></li>
                <li><a href='translator.jsp'><span>นักแปล</span></a></li>
                <li><a href='#'><span>Logout</span></a></li>
            </ul>
        </div>
    </center>

    <body>
        <% ArrayList list_ord = (ArrayList) session.getAttribute("list_order"); %>

        <div class = "form">
            <div class = "sign-in-form">
                <center><a href="https://www.picz.in.th/image/kC2A9R"><img src="https://www.picz.in.th/images/2018/10/10/kC2A9R.png" alt="kC2A9R.png" border="0" width ="180px" hight ="180px"/></a></center>

                <center><h1>PROFILE</h1></center> <br> 

                <br><br><br><br><br>

                <tr>
                    <td>
                        <h2 align="center">รายการจ้างแปล</h2> 
                        <br><br><br>

                        <div>

                            <title>ส่วนนี้เป็นpopupนะเชื่อมไปหน้าสร้างรายการแล้ว</title>
                            <div class="popup">
                                <a href="Create_order.html"><img src="https://img.live/images/2018/10/10/UI_2-512.md.png" alt="UI_2-512.png" width ='30px' high ='30px' align="left" /></a>
                                <div class="appear">
                                    <p>สร้างรายการจ้าง</p>
                                </div>

                                </tr>
                                <tr>
                                    <td> 
                                        <br><br><br><br><br><br>
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
                                                    if (name==null) { %>
                                                        <!--button SELECT TRANSLATOR-->
                                                        <tr>
                                                            <td><p><%= title%></p></td>
                                                            <td><p>Button</p></td>
                                                            <td><p>NO</p></td>
                                                        </tr>
                                                    <% } else { %>
                                                        <tr>
                                                            <td><p><%= title%></p></td>
                                                            <td><p><%= name%></p></td>
                                                            <td><p><%= status%></p></td>
                                                        </tr>
                                                 <% } 
                                                } %>
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