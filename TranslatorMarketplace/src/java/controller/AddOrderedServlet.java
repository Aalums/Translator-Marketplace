package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddOrderedServlet", urlPatterns = {"/AddOrderedServlet"})
public class AddOrderedServlet extends HttpServlet {

    private Connection conn;
    public void init(){
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //แสดงผลลัพธ์เป็นภาษาไทยได้ถูกต้อง
            request.setCharacterEncoding("UTF-8");
            
            ServletContext session = request.getServletContext();
            
            //รับค่าจาก session จากหน้า SelectTranslatorServlet
            int id_order = Integer.parseInt((String) session.getAttribute("id_order"));
            int id_translator = (int) session.getAttribute("id_translator");
            String status = "WAIT";
            
            //เช็ค
            //out.println("alert('Get Parameter Complete!!')");
            
            //เพิ่มข้อมูลลงฐานข้อมูล
            String sql = "INSERT INTO ordered (id_order, id_translator, status) VALUES (?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_order);
            pstmt.setInt(2, id_translator);
            pstmt.setString(3, status);
            
            pstmt.executeUpdate();
            pstmt.close();
            
            //เช็ค
            //out.println("<br>alert('INSERT Complete!!')");
            
            response.sendRedirect("StatusOrderServlet");
            
        } catch (SQLException ex) {
            Logger.getLogger(AddOrderedServlet.class.getName()).log(Level.SEVERE, null, ex);
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
