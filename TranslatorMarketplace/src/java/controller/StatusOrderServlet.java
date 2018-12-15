/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Status_order;

/**
 *
 * @author eyenach
 */
@WebServlet(name = "StatusOrderServlet", urlPatterns = {"/StatusOrderServlet"})
public class StatusOrderServlet extends HttpServlet {

    private Connection conn;
    private Status_order sta_ord;

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

            ArrayList list_status = new ArrayList<>();

            String id_customer = "admin";

            /* get id_order เฉพาะที่มีการจ้างนักแปลแล้ว */
            PreparedStatement ps_order = conn.prepareStatement(
                    "SELECT id_order, description"
                    + " FROM customers"
                    + " JOIN create_order USING (id_customer)"
                    + " JOIN ordered USING (id_order)"
                    + " WHERE id_customer = '" + id_customer + "' "
                    + " GROUP BY id_order");

            /* get translator's name, status จาก id_order-Ordered */
            PreparedStatement ps_trans = conn.prepareStatement(
                    "SELECT name_customer, status, file_order"
                    + " FROM ordered"
                    + " JOIN translators USING (id_translator)"
                    + " JOIN customers USING (id_customer)"
                    + " WHERE id_order = ? ");

            ResultSet rs_order = ps_order.executeQuery();

            while (rs_order.next()) {
                ps_trans.setInt(1, rs_order.getInt("id_order"));

                ResultSet rs_trans = ps_trans.executeQuery();
                while(rs_trans.next()){
                    System.out.println(rs_order.getInt("id_order") + "->" + rs_trans.getString("file_order"));
                    sta_ord = new Status_order(rs_order.getInt("id_order"), rs_order.getString("description"), rs_trans.getString("name_customer"), rs_trans.getString("status"), rs_trans.getString("file_order"));
                    list_status.add(sta_ord);
//                    System.out.println("size = " + list_status.size());
                }
            }

            ps_order.close();
            ps_trans.close();
            
            HttpSession session = request.getSession(true);
            session.setAttribute("list_status", list_status);
            
            response.sendRedirect("Status_Order.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(StatusOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
