<%-- 
    Document   : Confirm_select_tran
    Created on : Nov 20, 2018, 10:55:12 AM
    Author     : Planoi
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Inknut+Antiqua:400,700,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Mitr" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content-wrapper" style="margin-top: 60px;">
            <div class="container">
                <div class="login">
                    <div class = "form">

                        <%
                            //รับค่า id_order มาจากตอนกดเลือกออเดอร์
                            String id_order = (String) session.getServletContext().getAttribute("id_order");

                            //รับค่า id_tran มาจากตอนกดเลือกนักแปล
                            String id_translator = request.getParameter("select_employ");
                            String name_translator = "";

                            Connection conn = (Connection) getServletContext().getAttribute("connection");

                            //ดึงข้อมูล ordered จากฐานข้อมูล
                            String sql_ordered = "SELECT * FROM ordered "
                                    + "WHERE id_translator = ? "
                                    + "AND id_order = ?";
                            PreparedStatement data_ordered = conn.prepareStatement(sql_ordered);
                            data_ordered.setInt(1, Integer.parseInt(id_translator));
                            data_ordered.setInt(2, Integer.parseInt(id_order));
                            ResultSet rs_ordered = data_ordered.executeQuery();

                            //ถ้ามีในตารางแสดงว่าเลือกซ้ำ
                            if (rs_ordered.next()) {%>

                        <!--แสดงข้อความว่าเลือกนักแปลซ้ำ-->
                         <div class = "sign-in-form">
                             <center><h1>  สำหรับรายการ <%=id_order%> <br> คุณเลือกนักแปลคนนี้แล้ว</h1></center>  
                          <center>
                                        <br><br>
                                        <form action="Select_translator.jsp" method="POST">
                                            <button>ย้อนกลับ</button>
                                        </form>
                                    </center>
                        </div>

                        <% } //ถ้าไม่มี แสดงปุ่ม ยืนยัน ย้อนกลับ
                        else {
                            //ดึงข้อมูล นักแปล จากฐานข้อมูล
                            String sql_translator = "SELECT * FROM translators "
                                    + "JOIN customers "
                                    + "USING (id_customer) "
                                    + "WHERE id_translator = ?";
                            PreparedStatement data_translator = conn.prepareStatement(sql_translator);
                            data_translator.setInt(1, Integer.parseInt(id_translator));
                            ResultSet rs_translator = data_translator.executeQuery();
                            rs_translator.next();
                            name_translator = rs_translator.getString("name_customer");

                            //เก็บ id นักแปล เพื่อใช้ในการเพิ่มข้อมูลลงฐานข้อมูลใน AddOrderedServlet
                            session.getServletContext().setAttribute("select_id_translator", id_translator);%>

                        <!--แสดงข้อความและปุ่ม-->

                        <div class = "header">
                            <center><h1>คุณได้เลือกนักแปล</h1></center>     
                        </div>

                        <div class = "sign-in-form">
                            <center>
                                <table style="width:100%">
                                    <tr>
                                        <td>
                                    <center>
                                        <h3> 
                                            สำหรับรายการที่ <%=id_order%> 
                                        </h3>
                                    </center>
                                    </td>
                                    <td>
                                    <center>
                                        <h3> 
                                            นักแปล <%= id_translator%>
                                        </h3>
                                    </center>
                                    </td>
                                    </tr>

                                    <tr>
                                        <td>
                                    <center>
                                        <br><br>
                                        <form action="Select_translator.jsp" method="POST">
                                            <button>ย้อนกลับ</button>
                                        </form>
                                    </center>
                                    </td>
                                    <td>
                                    <center>
                                        <br><br>
                                        <form action="AddOrderedServlet" method="POST">
                                            <button>ยืนยัน</button>
                                        </form>
                                    </center>
                                    </td>
                                    </tr>

                                </table>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <% }
        %>
    </body>
</html>
