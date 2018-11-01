<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>แก้ไขรายการที่สร้าง</title>
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- Create Container + Logo -->
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
                    <li><a href='Status_Order.jsp'>สถานะ</a></li>
                    <li><a href='Profile.jsp'>โปรไฟล์</a></li>
                </ul>
            </div>
        </center>
    </div>
</head>
</head>
<body>
    <% int id_order = Integer.parseInt(request.getParameter("edit_order"));%>

    <!-- Query ข้อมูลนักแปล -->
    <% Connection conn = (Connection) getServletContext().getAttribute("connection");

        PreparedStatement order = conn.prepareStatement(
                "SELECT * FROM create_order"
                + " WHERE id_order = ?;"
        );
        order.setInt(1, id_order);

        ResultSet rs_order = order.executeQuery();
    %>

    <!--หน้า order-->
    <div class="container">
        <div class="createorder">
            <div class = "form">

                <div class = "header">
                    <center><h1>แก้ไขรายการที่สร้าง</h1></center>     
                </div>

                <% while (rs_order.next()) { %>
                <form action="EditOrderServlet" method="POST" enctype="multipart/form-data">
                    <div class = "sign-in-form">
                        <table style="width:100%">
                            <tr>
                                <td>
                                    <h3>ชื่องาน</h3>
                                    <input type="text" name="title" value="" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <!--โชว์การเลือกเดิม-->
                                    <h3>การแปล</h3><br><br><br>
                                    <% if (rs_order.getString("translate_type").equals("thaieng")) {%>
                                    <input type="radio" name="translate_type" value="thaieng" checked="True"> ไทย -> อังกฤษ
                                    <input type="radio" name="translate_type" value="engthai" > อังกฤษ -> ไทย
                                    <% } else { %>
                                    <input type="radio" name="translate_type" value="thaieng" > ไทย -> อังกฤษ
                                    <input type="radio" name="translate_type" value="engthai" checked="True"> อังกฤษ -> ไทย
                                    <% }%>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <h3>จำนวนหน้า &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ราคา</h3>
                                    <div class="product">
                                        <div class="product-quantity">
                                            <input type="number" name="num_page" value="<%= rs_order.getInt("num_page")%>" min="1">
                                        </div>
                                        <div class="product-line-price"><%= 120 * rs_order.getInt("num_page")%></div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <h3>รายละเอียดงาน</h3>
                                    <input placeholder="<%= rs_order.getString("description")%>" type="text" name="desc"/> 
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h3>กำหนดวันรับงานแปล</h3><br>
                                    <input type="date" name="due_date" id="orderdate" value="<%= rs_order.getDate("due_date")%>">
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <h3>ไฟล์</h3><br> <%= rs_order.getString("file_create")%> <br><br><br>
                                    <input type="file" name="file_create" /><br><br>
                                </td>
                            </tr>

                            <tr>
                                <td>
                            <center>
                                <button type="submit" name="save_order" value="<%= rs_order.getInt("id_order")%>">
                                    <div class = "button-text">
                                        บันทึก
                                    </div>
                                </button>
                            </center>
                            </td>
                            </tr>
                        </table>
                    </div>
                </form>
                <%}%>
            </div>
        </div>
    </div>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="js/index.js"></script>

</body>
</html>
