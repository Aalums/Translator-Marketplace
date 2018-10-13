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
import model.Order_customer;

/**
 *
 * @author eyenach
 */
@WebServlet(name = "OrderCustomerServlet", urlPatterns = {"/OrderCustomerServlet"})
public class OrderCustomerServlet extends HttpServlet {

    private Connection conn;
    private Order_customer ord_cus;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            ArrayList list_ord = new ArrayList<>();

            String id_customer = "admin";

            PreparedStatement order_cus = conn.prepareStatement(
                    "SELECT id_order"
                    + " FROM create_order"
                    + " WHERE id_customer = ? ");

            PreparedStatement tran_name = conn.prepareStatement(
                    "SELECT create_order.title, customers.name_customer, ordered.status"
                    + " FROM create_order"
                    + " JOIN ordered"
                    + " ON (create_order.id_order = ordered.id_order)"
                    + " JOIN translators"
                    + " ON (ordered.id_translator = translators.id_translator)"
                    + " JOIN customers"
                    + " ON (translators.id_customer = customers.id_customer)"
                    + " WHERE create_order.id_order = ? "
            );

            order_cus.setString(1, id_customer);
            ResultSet rs_order = order_cus.executeQuery();

            while (rs_order.next()) {
//                out.print("order = "+rs_order.getString("id_order"));

                tran_name.setInt(1, rs_order.getInt("id_order"));
                ResultSet rs_tran = tran_name.executeQuery();
                rs_tran.next();
                ord_cus = new Order_customer(rs_tran.getString("title"), rs_tran.getString("name_customer"), rs_tran.getString("status"));
                list_ord.add(ord_cus);
            }
            conn.close();
//            out.print(" size = "+list_ord.size());
            HttpSession session = request.getSession(true);
            session.setAttribute("list_order", list_ord);

            response.sendRedirect("Profile_cus.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(OrderCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
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
