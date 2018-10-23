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
                    <li class='active'><a href='Status_Order.jsp'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
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
            background-color: #ffffff;
            box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.23);
        }
        .responsive-table .col-1 {
            flex-basis: 30%;
        }
        .responsive-table .col-2 {
            flex-basis: 40%;
        }
        .responsive-table .col-3 {
            flex-basis: 30%;
        }
        /*        .responsive-table .col-4 {
                    flex-basis: 25%;
                }*/
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
    <% ArrayList list_status = (ArrayList) session.getAttribute("list_status"); %>
    <div class="container">
        <h2 align="center">รายการจ้างแปล</h2> 
        <!--    <title>ตารางยังไม่ได้วนลูปนะ</title>-->
        <ul class="responsive-table">
            <li class="table-header">
                <div class="col col-1">รายการจ้าง</div>
                <div class="col col-2">นักแปล</div>
                <div class="col col-3">สถานะ</div>
                <!--      <div class="col col-4">Payment Status</div>-->
            </li>
                <% //put in TABLE
                    for (int i = 0; i < list_status.size(); i++) {
                        model.Status_order item = (model.Status_order) list_status.get(i);
                        String desc = item.getDescription();
                        String name = item.getTranslator_name();
                        String status = item.getStatus();%>
                   <li class="table-row">
                <div class="col col-1" data-label="รายการจ้าง"><%= desc%></div>
                <div class="col col-2" data-label="นักแปล"><%= name%></div>
                <div class="col col-3" data-label="สถานะ"><%= status%></div>
                <!--    <div class="col col-4" data-label="Payment Status">Pending</div> -->
            </li>
                <% }%>
        </ul>
    </div>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
        <script  src="js/index.js"></script>

    </body>

</html>