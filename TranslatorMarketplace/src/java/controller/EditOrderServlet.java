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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.file_create;

/**
 *
 * @author eyenach
 */
@MultipartConfig
@WebServlet(name = "EditOrderServlet", urlPatterns = {"/EditOrderServlet"})
public class EditOrderServlet extends HttpServlet {

    private Connection conn;
    int row;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //id_order from click 'edit'
            int save_order = Integer.parseInt(request.getParameter("save_order"));

            PreparedStatement ps_order = conn.prepareStatement(
                    "SELECT *"
                    + " FROM create_order"
                    + " WHERE id_order = ?");

            //get data from Edit_order.jsp
            Part file = request.getPart("file_create");

            String type = request.getParameter("translate_type");
            String desc = request.getParameter("desc");
            String page = request.getParameter("num_page");
            
            ps_order.setInt(1, save_order);
            ResultSet rs_order = ps_order.executeQuery();
            
            PreparedStatement ps_edit;
            
            while(rs_order.next()){
                if(!type.equals(rs_order.getString("translate_type")) && !type.equals("")){
                    ps_edit = conn.prepareStatement("UPDATE create_order SET translate_type = ? WHERE id_order = ?");
                    ps_edit.setString(1, type);
                    ps_edit.setInt(2, save_order);
                    row = ps_edit.executeUpdate();
//                    out.println("type = "+row);
                }
                if(!desc.equals(rs_order.getString("description")) && !desc.equals("")){
                    ps_edit = conn.prepareStatement("UPDATE create_order SET description = ? WHERE id_order = ?");
                    ps_edit.setString(1, desc);
                    ps_edit.setInt(2, save_order);
                    row = ps_edit.executeUpdate();
//                    out.println("desc = "+row);
                }
                if(!page.equals(rs_order.getString("num_page")) && !page.equals("")){
                    ps_edit = conn.prepareStatement("UPDATE create_order SET num_page = ? WHERE id_order = ?");
                    ps_edit.setInt(1, Integer.parseInt(page));
                    ps_edit.setInt(2, save_order);
                    row = ps_edit.executeUpdate();
                    ps_edit = conn.prepareStatement("UPDATE create_order SET price = ? WHERE id_order = ?");
                    ps_edit.setFloat(1, Integer.parseInt(page)*120);
                    ps_edit.setInt(2, save_order);
                    row = ps_edit.executeUpdate();
//                    out.println("page = "+row);
                }
                if(!file.equals("")){
                    //เอาชื่อไฟล์ออกมา
                    String[] title = rs_order.getString("file_create").split("/|\\.");
                    
                    InputStream inputStream = file.getInputStream();
                    file_create file_cre = new file_create();
                    file_cre.fileCreate(title[1], inputStream);
                }
            }
            
            rs_order.close();
            ps_order.close();
            
            response.sendRedirect("Order_customer.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(EditOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
