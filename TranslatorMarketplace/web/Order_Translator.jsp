<%-- 
    Document   : Order_Translator
    Created on : Oct 13, 2018, 5:52:46 PM
    Author     : may
--%>

<%@page import="java.sql.Date"%>
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

        <%
            String id_customer = (String) session.getServletContext().getAttribute("id_customer");
        %>

    <div class="topnav">
        <div class="topnav-right">
            <a href="Homepage.jsp">หน้าหลัก</a>
            <a href="Profile.jsp"> <%= id_customer%> </a>
            <a href="LogoutServlet">ออกจากระบบ</a>
        </div>
    </div>

    <div class="container">
        <div class="logo">  
            <img src="css/TRANSLATOR.png" alt="logo"  height="156" width="300">
        </div>
        <center>
            <div id='cssmenu'>
                <ul>
                    <li><a href='Create_order.html'>สร้างรายการ</a></li>
                    <li><a href='Order_customer.jsp'>ออเดอร์</a></li>
                    <li class='active'><a href='Order_Translator.jsp'>ออเดอร์นักแปล</a></li>
                    <li><a href='Status_Order.jsp'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
    <style>
        #pricing-table {
            margin: 50px auto;
            width: 642px;
            /*            width: 222px;  total computed width = 222 x 3 + 226 */
        }

        #pricing-table .plan {
            font: 12px;
            text-shadow: 0 1px rgba(255,255,255,.8);        
            background: #fff;      
            border: 1px solid #ddd;
            color: #333;
            padding: 20px;
            width: 642px; /* plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
            float: center;
            position: relative;
        }

        #pricing-table #most-popular {
            z-index: 2;
            top: -13px;
            border-width: 3px;
            padding: 30px 20px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
            -webkit-box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);
            box-shadow: 20px 0 10px -10px rgba(0, 0, 0, .15), -20px 0 10px -10px rgba(0, 0, 0, .15);    
        }

        #pricing-table .plan:nth-child(1) {
            -moz-border-radius: 5px 0 0 5px;
            -webkit-border-radius: 5px 0 0 5px;
            border-radius: 5px 5px 5px 5px;        
        }

        #pricing-table .plan:nth-child(4) {
            -moz-border-radius: 0 5px 5px 0;
            -webkit-border-radius: 0 5px 5px 0;
            border-radius: 0 5px 5px 0;        
        }

        /* --------------- */	

        #pricing-table h3 {
            color:white;
            height: 50px;
            font-size: 20px;
            font-weight: normal;
            padding: 20px;
            padding-top: 25px;
            padding-bottom: 15px;
            margin: -20px -20px 0px -20px;
            background-color: #24305e;
            background-image: #24305e;
        }

        #pricing-table #most-popular h3 {

            background-color: #ddd;
            margin-top: -30px;
            padding-top: 30px;
            border-radius: 5px 5px 0 0; 		
        }

        #pricing-table .plan:nth-child(1) h3 {

            border-radius: 5px 5px 0 0;        
        }	

        #pricing-table ul {
            /*	margin: 20px 0 0 0;*/
            padding: 0;
            list-style: none;
        }

        #pricing-table li {
            border-top: 1px solid #ddd;
            padding: 20px 0;
        }

        .button_edit{
            box-shadow: 2px 2px 0px 0px #f76d6d;
            border: 2px solid #f76d6d;
            transition: transform .2s, box-shadow .2s;
            transform: translate(-2px,-2px);
            position: absolute;
            top: 3%;
            left: 90%;
            padding: 3px;
            font-size: 15px;

        }
        .button_select{
            margin-top: 10px;
        }
        .container {
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
            padding-left: 10px;
            padding-right: 10px;
        }
        input {
            font-family: 'Mitr', sans-serif;
            outline: none;
            margin-top: 10px;
            background: transparent;
            color: #24305e;
            border: 2px solid #24305e;
            border-top: 0;
            border-left: 0;
            border-right: 0;
            margin-bottom: 30px;
            font-size: .9em;
            width: 80%;
            height: 2.5em;
        }

    </style>
</head>

<body>

    <% ArrayList list_order = (ArrayList) getServletContext().getAttribute("list_order"); %>
<center><h1>รายการที่ถูกจ้าง</h1></center>


<!--แสดงรายละเอียดข้อมูลการจ้าง-->
<% for (int i = 0; i < list_order.size(); i++) {
        model.OrderTranslator item = (model.OrderTranslator) list_order.get(i);
        int id_order = item.getId_order();
        String employer = item.getEmployer();
        String desc = item.getDesc();
        String file = item.getFile_order();
        int num_page = item.getPage();
        Date date = item.getDate();
        String status = item.getStatus();
        String type = item.getType();
        float price = item.getPrice();%>

<div class="container">
    <div class="row">
        <div id="pricing-table">
            <div class="plan">
                <h3>ผู้จ้าง  <%= employer%></h3>
                <ul>
                    <li><b>รายละเอียด&nbsp;:</b>&nbsp; <%= desc%></li>
                    <li><b>แปล&nbsp;:</b>&nbsp;<%= type%></li>
                    <li><b>จำนวนหน้า&nbsp;:</b>&nbsp; <%= num_page%></li>
                    <li><b>ราคา&nbsp;:</b>&nbsp;<%= price%> </li>
                    <form action="View_Filecreate.jsp" method="POST">
                        <li><b>ไฟล์งานต้นฉบับ&nbsp;:</b>&nbsp;<button name="view" style="
                                                                      margin-left: 30px;
                                                                      padding-top: 5px;
                                                                      padding-left: 5px;
                                                                      padding-bottom: 5px;
                                                                      padding-right: 5px;
                                                                      margin-bottom: 0px;
                                                                      font-size: 14px;
                                                                      "value=<%= id_order%>>เปิดไฟล์</button>
                        </li>
                    </form>
                    <li><b>สถานะรับงาน&nbsp;:</b>&nbsp;
                        <% if (status.equals("ยอมรับ")) { %>
                        ยอมรับ
                        <% } else if (status.equals("ปฎิเสธ")) { %> 
                        ปฎิเสธ
                        <% } else if (status.equals("รายการนี้ถูกจ้างเเล้ว")) { %> 
                        รายการนี้ถูกจ้างเเล้ว
                        <% } else {%>
                        <% int id_translator = (Integer) session.getServletContext().getAttribute("id_translator");%>
                        <%-- int id_translator = 2; --%>
                        <form action="AcceptOrderServlet" method="POST">
                            <button class="button_select" name="select" style="
                                    margin-left: 30px;
                                    padding-top: 5px;
                                    padding-left: 5px;
                                    padding-bottom: 5px;
                                    padding-right: 5px;
                                    margin-bottom: 0px;
                                    font-size: 14px;
                                    "value=<%= id_order%>_<%= id_translator%>_YES>รับ</button>
                            <button class="button_select" name="select" style="
                                    margin-left: 30px;
                                    padding-top: 5px;
                                    padding-left: 5px;
                                    padding-bottom: 5px;
                                    padding-right: 5px;
                                    margin-bottom: 0px;
                                    font-size: 14px;
                                    "value=<%= id_order%>_<%= id_translator%>_NO>ปฎิเสธ</button>
                        </form>
                        <% } %>  
                    </li>
                    <li><b>งานส่งมอบ&nbsp;:</b>&nbsp;<br>
                        <%  if (status.equals("ยอมรับ") && file != null) {
                                String[] file_order = file.split("/");%>
                        <%= file_order[1]%><br>

                        <form action="View_Fileorder.jsp" method="POST">
                            <button name="view"  style="
                                    margin-left: 30px;
                                    padding-top: 5px;
                                    padding-left: 5px;
                                    padding-bottom: 5px;
                                    padding-right: 5px;
                                    margin-bottom: 0px;
                                    font-size: 18px;
                                    " value=<%= id_order%>>เปิดไฟล์</button>
                        </form>

                        <form action="SendOrderServlet"  enctype='multipart/form-data' method="POST">
                            <input type="file" name="file_order" value="" style="margin-top: 10px;"/>
                            <button name="send" style="
                                    margin-left: 10px;
                                    padding-top: 10px;
                                    padding-left: 10px;
                                    padding-bottom: 10px;
                                    padding-right: 10px;
                                    margin-bottom: 0px;
                                    font-size: 18px;
                                    "value=<%= id_order%>>ส่งงาน</button>
                        </form>

                        <% } else if (status.equals("ยอมรับ") && file == null) {%>


                        <form action="" enctype='multipart/form-data' method="POST">
                            <input type="file" name="file_order" value="" />
                            <button name="send" style="
                                    margin-left: 10px;
                                    padding-top: 10px;
                                    padding-left: 10px;
                                    padding-bottom: 10px;
                                    padding-right: 10px;
                                    margin-bottom: 0px;
                                    font-size: 18px;
                                    "value=""<%= id_order%>>ส่งงาน</button>
                        </form>
                        <% } %>
                    </li>
                    <% }%>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
