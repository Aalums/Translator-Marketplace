/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.file_order;

/**
 *
 * @author eyenach
 */
@MultipartConfig
@WebServlet(name = "SendOrderServlet", urlPatterns = {"/SendOrderServlet"})
public class SendOrderServlet extends HttpServlet {

    private Connection conn;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //แสดงผลลัพธ์เป็นภาษาไทยได้ถูกต้อง
            request.setCharacterEncoding("UTF-8");
            
            //รับค่า id_translator, id_order เพื่อ update file_order
            ServletContext session = request.getServletContext();
            int id_translator = (Integer) session.getAttribute("id_translator");
            
            //รับค่า parameter จาก Order_Translator.jsp
            int id_order = Integer.parseInt(request.getParameter("send"));
            
            Part file = request.getPart("file_order");
            InputStream inputStream = file.getInputStream();
            
            file_order file_order = new file_order();
            
            //เก็บชื่อไฟล์เป็น id_order_id_translator
            file_order.fileOrder(id_order+"_"+id_translator, inputStream);

            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE ordered SET file_order = ? WHERE id_order = ? AND id_translator = ?"
            );
            
            ps.setString(1, file_order.order());
            ps.setInt(2, id_order);
            ps.setInt(3, id_translator);

            ps.executeUpdate();
            ps.close();

            response.sendRedirect("OrderTranslatorServlet");

            //เช็ค
            //out.println("<br>alert('INSERT Complete!!')");
            
        } catch (SQLException ex) {
            Logger.getLogger(CreateOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
