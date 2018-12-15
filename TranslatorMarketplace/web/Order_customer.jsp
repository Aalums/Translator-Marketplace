

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>รายการที่สร้าง</title>
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
                    <li class='active'><a href='Order_customer.jsp'>ออเดอร์</a></li>
                    <li><a href='StatusOrderServlet'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
    <!-- CSS -->
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

    </style>
</head>
<body>
    <!-- -->
    <% Connection conn = (Connection) getServletContext().getAttribute("connection");

        ArrayList id_order = new ArrayList();

        PreparedStatement ordered = conn.prepareStatement(
                "SELECT id_order FROM ordered"
                + " GROUP BY id_order;"
        );

        PreparedStatement create_order = conn.prepareStatement(
                "SELECT * FROM customers"
                + " JOIN create_order USING (id_customer) "
                + " WHERE id_customer = 'admin';"
        );

        ResultSet rs_ordered = ordered.executeQuery();
        ResultSet rs_create = create_order.executeQuery();

        while (rs_ordered.next()) {
            id_order.add(rs_ordered.getInt("id_order"));
        }
    %>

<center><h1>รายการที่สร้าง</h1></center>
<div class="container">
    <div class="row">
        <% while (rs_create.next()) {%>
        <div id="pricing-table">
            <div class="plan">
                <h3>รายการที่  <%= rs_create.getInt("id_order")%>
                    <% if (!id_order.contains(rs_create.getInt("id_order"))) {%>
                    <form action="Edit_order.jsp" method="POST">
                        <button class="button_edit" name="edit_order"  style="float: right; margin:0;" value=<%= rs_create.getInt("id_order")%>>แก้ไข</button>
                    </form>
                    <% }%>
                    <!--<a class="signup" href="" style="float: right; margin:0;">Sign up</a>-->
                </h3>    
                <ul>
                    <li><b>การแปล&nbsp;:</b>&nbsp;<%= rs_create.getString("translate_type")%></li>
                    <li><b>จำนวนหน้า&nbsp;:</b>&nbsp;<%= rs_create.getInt("num_page")%></li>
                    <li><b>ราคา&nbsp;:</b>&nbsp;<%= rs_create.getFloat("price")%> </li>
                    <li><b>วันที่ส่งงาน&nbsp;:</b>&nbsp;<%= rs_create.getDate("due_date")%> </li>
                    <form action="View_Filecreate.jsp" method="POST">
                        <li><b>ไฟล์&nbsp;:</b>&nbsp;<%= rs_create.getString("file_create") %> <button name="file_create" value=<%= rs_create.getInt("id_order")%>>เปิดไฟล์</button></li>
                    </form>
                    <li><b>คำอธิบาย&nbsp;:</b>&nbsp;<%= rs_create.getString("description")%> </li>
                    <form action="OrderCustomerServlet" method="POST">
                        <center><button class="button_select" name="select_order" value=<%= rs_create.getInt("id_order")%>>เลือกนักแปล</button></center>
                    </form>		
                </ul> 
            </div>
        </div>
        <% }%>
    </div>
</div>
<script  src="js/index.js"></script>
</body>
</html>
