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
    <style> 
        .container {
            max-width: 1000px;
            margin-left: auto;
            margin-right: auto;
            padding-left: 10px;
            padding-right: 10px;
        }

        h2 {
            font-size: 26px;
            margin: 20px 0;
            text-align: center;
        }

        .responsive-table li {
            border-radius: 3px;
            padding: 25px 30px;
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
          
        }
        .responsive-table .table-header {
            background-color: #24305e;
            font-size: 17px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            color: #ffffff;
           
        }
        .responsive-table .table-row {
            border-left: 1px solid #ddd;
            background-color: #ffffff;
            box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.23);
           
        }
        .responsive-table .col-1 {
            text-align: center;
            flex-basis: 15%;
            line-height: 20px;
          
        }
        .responsive-table .col-2 {
             text-align: center;
            flex-basis: 35%;
            line-height: 20px;
             border-left: 1px solid #ddd;
            
        }
        .responsive-table .col-3 {
            flex-basis: 15%;
            line-height: 20px;
            border-left: 1px solid #ddd;
             text-align: center;
        }
        .responsive-table .col-4 {
            flex-basis: 10%;
            line-height: 20px;
            border-left: 1px solid #ddd;
              text-align: center;
        }
        .responsive-table .col-5 {
            flex-basis: 15%;
            line-height: 20px;
            border-left: 1px solid #ddd;
            text-align: center;;
        }
        .responsive-table .col-6 {
            flex-basis: 10%;
            line-height: 20px;
            border-left: 1px solid #ddd;
            text-align: center;
        }
        @media all and (max-width: 767px) {
            .responsive-table .table-header {
                display: none;
            }
            .responsive-table li {
                display: block;
            }
            .responsive-table .col {
                flex-basis: 100%;
            }
            .responsive-table .col {
                display: flex;
                padding: 10px 0;
            }
            .responsive-table .col:before {
                color: #6C7A89;
                padding-right: 10px;
                content: attr(data-label);
                flex-basis: 50%;
                text-align: right;
            }
        }

    </style>
</head>

<body>

    <% ArrayList list_order = (ArrayList) getServletContext().getAttribute("list_order"); %>

    <div class="createorder">
        <form action="AcceptOrderServlet" method="POST">
            <div class="container">
                <div class = "TableEmploy">            
                    <div class = "header">

                        <center>
                            <h1>รายการที่ถูกจ้าง</h1>
                        </center>

                        <!-- Create Table -->
                        <ul class="responsive-table">
                            <li class="table-header">
                                <div class="col col-1">ผู้จ้าง</div>
                                <div class="col col-2">รายละเอียด</div>
                                <div class="col col-3">ไฟล์งาน</div>
                                <div class="col col-4">จำนวนหน้า</div>
                                <div class="col col-5">วันที่ส่งมอบ</div>
                                <div class="col col-6">รับ/ปฏิเสธ</div>
                            </li>


                            <!--แสดงรายละเอียดข้อมูลการจ้าง-->
                            <% for (int i = 0; i < list_order.size(); i++) {
                                    model.OrderTranslator item = (model.OrderTranslator) list_order.get(i);
                                    int id_order = item.getId_order();
                                    String employer = item.getEmployer();
                                    String desc = item.getDesc();
                                    String[] file = item.getFile_name().split("/");
                                    int num_page = item.getPage();
                                    Date date = item.getDate();
                                    String status = item.getStatus();%>

                            <li class="table-row">
                                <div class="col col-1" data-label ="ผู้จ้าง"><%= employer %></div>
                                <div class="col col-2" data-label ="รายละเอียด"><%= desc %></div>
                                <div class="col col-3" data-label ="ไฟล์งาน"><%= file[1] %></div>
                                <div class="col col-4" data-label ="จำนวนหน้า"><%= num_page %></div>
                                <div class="col col-5" data-label ="วันที่ส่งมอบ"><%= date %></div>
                                <div class="col col-6" data-label ="รับ/ปฏิเสธ">
                                    <% if (status.equals("ยอมรับ")) { %>
                                    <center><h3>ยอมรับ</h3></center>
                                        <% } else if (status.equals("ปฏิเสธ")) { %> 
                                    <center><h3>ปฎิเสธ</h3></center>
                                        <% } else if (status.equals("รายการนี้ถูกจ้างเเล้ว")) { %> 
                                    <center><h3>รายการนี้ถูกจ้างเเล้ว</h3></center>
                                        <% } else { %>
                                    <div class="bottonOrder">
                                        <center>
                                            <br>
                                            <!--ให้นักแปลเป็น 3 ไปก่อน-->
                                            <button class="button_select" name="select" value=<%= id_order%>_3_YES>YES</button>
                                            <button class="button_select" name="select" value=<%= id_order%>_3_NO>NO</button>
                                        </center>
                                    </div>
                                    <% } %>  
                                </div>
                            </li>
                            <% } %>
                        </ul>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
