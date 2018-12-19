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
import java.sql.Date;
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
            int edit_order = Integer.parseInt(request.getParameter("save_order"));

            Part file = request.getPart("file_create");

            String title = request.getParameter("title");
            String type = request.getParameter("translate_type");
            String desc = request.getParameter("desc");
            int num_page = Integer.parseInt(request.getParameter("num_page"));
            float price = Float.parseFloat(request.getParameter("price"));
            Date date = Date.valueOf(request.getParameter("due_date"));

            PreparedStatement ps_edit;

            if (file.getSize() > 0) { //มีการอัพไฟล์ใหม่
//                out.println("size = "+file.getSize());
                ps_edit = conn.prepareStatement(
                        "UPDATE create_order SET file_create = ?,"
                        + " translate_type = ?,"
                        + " description = ?,"
                        + " num_page = ?,"
                        + " price = ?,"
                        + " due_date = ?"
                        + "WHERE id_order = ?"
                );

                InputStream inputStream = file.getInputStream();
                file_create file_create = new file_create();
                file_create.fileCreate(title, inputStream);

                ps_edit.setString(1, file_create.create());
                ps_edit.setString(2, type);
                ps_edit.setString(3, desc);
                ps_edit.setInt(4, num_page);
                ps_edit.setFloat(5, price);
                ps_edit.setDate(6, date);
                ps_edit.setInt(7, edit_order);

                row = ps_edit.executeUpdate();

            } else {
                ps_edit = conn.prepareStatement(
                        "UPDATE create_order SET translate_type = ?,"
                        + " description = ?,"
                        + " num_page = ?,"
                        + " price = ?,"
                        + " due_date = ?"
                        + "WHERE id_order = ?"
                );

                ps_edit.setString(1, type);
                ps_edit.setString(2, desc);
                ps_edit.setInt(3, num_page);
                ps_edit.setFloat(4, price);
                ps_edit.setDate(5, date);
                ps_edit.setInt(6, edit_order);

                row = ps_edit.executeUpdate();
            }

            System.out.println("update = "+row);

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
