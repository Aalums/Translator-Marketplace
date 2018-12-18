<%-- 
    Document   : Profile_cus
    Created on : Oct 12, 2018, 9:21:57 PM
    Author     : windypelo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

    <head>
        <meta charset="UTF-8">
        <title>สถานะรายการจ้างแปล</title>
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
                    <li><a href='Create_order.jsp'>สร้างรายการ</a></li>
                    <li><a href='Order_customer.jsp'>ออเดอร์</a></li>
                     
                    <%
                        Connection conn = (Connection) getServletContext().getAttribute("connection");

                        //เช็คว่าเป็นนักแปล?
                        PreparedStatement chk_translator = conn.prepareStatement(
                                "SELECT * FROM customers"
                                + " JOIN translators USING (id_customer) "
                                + " WHERE id_customer = ?;"
                        );
                        chk_translator.setString(1, id_customer);

                        ResultSet rs_chk_translator = chk_translator.executeQuery();
                        if (rs_chk_translator.next()) {
                            session.getServletContext().setAttribute("id_translator", rs_chk_translator.getInt("id_translator"));
                    %>
                    <li><a href='OrderTranslatorServlet'>ออเดอร์นักแปล</a></li>
                    <% } %>
                    
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
            flex-basis: 10%;
            line-height: 20px;
            padding: 10px;
            text-align: center;
            padding-bottom: 0px;
            padding-top: 0px;
        }
        .responsive-table .col-2 {
            flex-basis: 40%;
            line-height: 20px;
            border-left: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            padding-bottom: 0px;
            padding-top: 0px;
        }
        .responsive-table .col-3 {
            flex-basis: 20%;
            line-height: 20px;
            border-left: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            padding-bottom: 0px;
            padding-top: 0px;
        }
        .responsive-table .col-4 {
            flex-basis: 20%;
            line-height: 20px;
            border-left: 1px solid #ddd;
            padding: 10px;
            padding-bottom: 0px;
            padding-top: 0px;
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
    <% 
        PreparedStatement ps_order = conn.prepareStatement(
                "SELECT * FROM customers"
                + " JOIN create_order USING (id_customer)"
                + " JOIN ordered USING (id_order)"
                + " WHERE id_customer = '" + id_customer + "' "
                + " GROUP BY id_order"
        );

        PreparedStatement ps_trans = conn.prepareStatement(
                "SELECT name_customer, status, file_order, id_customer FROM ordered"
                + " JOIN translators USING (id_translator)"
                + "JOIN customers USING (id_customer)"
                + " WHERE id_order = ?"
        );

        ResultSet rs_order = ps_order.executeQuery();%>
    <div class="container">
        <h2 align="center">รายการจ้างแปล</h2> 
        
        <ul class="responsive-table">
            <li class="table-header">
                <div class="col col-1">รายการที่</div>
                <div class="col col-2">รายละเอียด</div>
                <div class="col col-3">นักแปล</div>
                <div class="col col-4">สถานะ</div>
                <div class="col col-2">งานส่งมอบ</div>
            </li>
            <% while (rs_order.next()) {
                    ps_trans.setInt(1, rs_order.getInt("id_order"));
                    ResultSet rs_trans = ps_trans.executeQuery();
                    while (rs_trans.next()) {%>
            <li class="table-row">
                <div class="col col-1" data-label="รายการ"><%= rs_order.getInt("id_order")%></div>

                <div class="col col-2" data-label="รายละเอียดการจ้าง">
                    คำอธิบาย : <%= rs_order.getString("description")%><br>
                    แปล : <%= rs_order.getString("translate_type")%><br>
                    จำนวนหน้า : <%= rs_order.getString("num_page")%><br>
                    ราคา : <%= rs_order.getString("price")%><br>
                    วันส่งงาน : <%= rs_order.getString("due_date")%><br>
                    <form action="View_Filecreate.jsp" method="POST">
                        <button name="view" style="
                                padding-left: 5px;
                                padding-top: 5px;
                                padding-right: 5px;
                                padding-bottom: 5px;
                                margin-top: 10px;
                                margin-bottom: 5px;
                                font-size: 14px;
                                "value=<%= rs_order.getInt("id_order")%>>เปิดไฟล์</button>
                    </form>
                </div>

                <div class="col col-3" data-label="นักแปล"><%= rs_trans.getString("name_customer")%></div>
                <div class="col col-4" data-label="สถานะ"><%= rs_trans.getString("status")%></div>

                <% if (rs_trans.getString("status").equals("ยอมรับ") && rs_order.getString("file_order") != null) { //นักแปลส่งงานให้คนจ้างแล้ว ให้กดไฟล์เพื่อตรวจงานได้%> 
                <form action="View_Fileorder.jsp"  method="POST">
                    <div class="col col-2" data-label="งานส่งมอบ">
                        <br><br>
                        <button name="view" style="margin-top: 30px;" style="
                                padding-left: 5px;
                                padding-top: 5px;
                                padding-right: 5px;
                                padding-bottom: 5px;
                                margin-top: 10px;
                                margin-bottom: 5px;
                                font-size: 14px; value=<%= rs_order.getInt("id_order")%>>เปิดไฟล์</button>
                                </div>
                                </form>
                                <% } else if (rs_trans.getString("status").equals("ยอมรับ") && rs_order.getString("file_order") == null) { //นักแปลรับงานแต่ยังไม่ได้ส่งงาน%>
                                <div class="col col-2" data-label="งานส่งมอบ">กำลังแปล</div>
                        <% } else { %>
                    <div class="col col-2" data-label="งานส่งมอบ">-</div>
                    <% } %>
            </li>
            <% }
                }%>
        </ul>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script  src="js/index.js"></script>

</body>

</html>
