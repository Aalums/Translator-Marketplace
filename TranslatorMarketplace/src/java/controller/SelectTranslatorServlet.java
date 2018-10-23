package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SelectTranslatorServlet", urlPatterns = {"/SelectTranslatorServlet"})
public class SelectTranslatorServlet extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            ServletContext session = request.getServletContext();

            String id_order = (String) session.getAttribute("id_order");
            int id_translator = Integer.parseInt(request.getParameter("select_employ"));
            String name_translator = "";

            //ดึงข้อมูล ordered จากฐานข้อมูล
            String sql_ordered = "SELECT * FROM ordered "
                    + "WHERE id_translator = ? "
                    + "AND id_order = ?";
            PreparedStatement data_ordered = conn.prepareStatement(sql_ordered);
            data_ordered.setInt(1, id_translator);
            data_ordered.setInt(2, Integer.parseInt(id_order));
            ResultSet rs_ordered = data_ordered.executeQuery();
            
            if (rs_ordered.next()) {
                //Alert javascript
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<SCRIPT LANGUAGE=javascript>");
                out.println("alert(\" สำหรับรายการนี้ คุณได้เลือกนักแปลคนนี้แล้ว \")");
                out.println("window.location.replace(\"Select_translator.jsp\");");
                out.println("</SCRIPT>");
                out.println("</head>");
                out.println("<body>");
                out.println("</body>");
                out.println("</html>");
            } else {
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

                //ข้อความโชว์ใน Confirm
                String msg = "คุณเลือกนักแปล : " + name_translator + "   -->   สำหรับรายการที่ : " + id_order;

                //เก็บ id นักแปล เพื่อใช้ในการเพิ่มข้อมูลลงฐานข้อมูลใน AddOrderedServlet
                session.setAttribute("id_translator", id_translator);

                //Confirm javascript
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<SCRIPT LANGUAGE=javascript>");
                out.println("<!--");
                out.println("var select = confirm('" + msg + "')");
                out.println("if (select == true) {window.location.replace(\"AddOrderedServlet\");}");
                out.println("else {window.location.replace(\"Select_translator.jsp\");}");
                out.println("//-->");
                out.println("</SCRIPT>");
                out.println("</head>");
                out.println("<body>");
                out.println("</body>");
                out.println("</html>");
            }

        } catch (SQLException ex) {
            Logger.getLogger(SelectTranslatorServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
