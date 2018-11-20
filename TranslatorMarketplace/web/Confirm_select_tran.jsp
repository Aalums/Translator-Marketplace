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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>เลือกนักแปล</h1>

        <%
            //รับค่า id_order มาจากตอนกดเลือกออเดอร์
            String id_order = (String) session.getServletContext().getAttribute("id_order");

            //รับค่า id_tran มาจากตอนกดเลือกนักแปล
            int id_translator = Integer.parseInt(request.getParameter("select_employ"));
            String name_translator = "";

            Connection conn = (Connection) getServletContext().getAttribute("connection");

            //ดึงข้อมูล ordered จากฐานข้อมูล
            String sql_ordered = "SELECT * FROM ordered "
                    + "WHERE id_translator = ? "
                    + "AND id_order = ?";
            PreparedStatement data_ordered = conn.prepareStatement(sql_ordered);
            data_ordered.setInt(1, id_translator);
            data_ordered.setInt(2, Integer.parseInt(id_order));
            ResultSet rs_ordered = data_ordered.executeQuery();

            //ถ้ามีในตารางแสดงว่าเลือกซ้ำ
            if (rs_ordered.next()) {%>

        <!--แสดงข้อความว่าเลือกนักแปลซ้ำ-->
        <h3> 
            สำหรับรายการ <%=id_order%> <br> คุณเลือกนักแปลคนนี้แล้ว
        </h3>

        <% } //ถ้าไม่มี แสดงปุ่ม ยืนยัน ย้อนกลับ
        else {
            //ดึงข้อมูล นักแปล จากฐานข้อมูล
            String sql_translator = "SELECT * FROM translators "
                    + "JOIN customers "
                    + "USING (id_customer) "
                    + "WHERE id_translator = ?";
            PreparedStatement data_translator = conn.prepareStatement(sql_translator);
            data_translator.setInt(1, id_translator);
            ResultSet rs_translator = data_translator.executeQuery();
            rs_translator.next();
            name_translator = rs_translator.getString("name_customer");

            //เก็บ id นักแปล เพื่อใช้ในการเพิ่มข้อมูลลงฐานข้อมูลใน AddOrderedServlet
            session.setAttribute("id_translator", id_translator);%>

        <!--แสดงข้อความและปุ่ม-->
        <h3> 
            สำหรับรายการ <%=id_order%> <br> คุณเลือกนักแปล <%= id_translator%>
        </h3>
        
        <form action="Select_translator.jsp" method="POST">
            <button >BACK</button>
        </form>
        <br>
        <form action="AddOrderedServlet" method="POST">
            <button>CONFIRM</button>
        </form>
        <% }
        %>
    </body>
</html>
