/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
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
            String[] title = {"test1", "test2"};
            String[] name = {"eye", "eye"};
            String[] status = {"yes", "no"};

            for (int i = 0; i < title.length; i++) {
                ord_cus = new Order_customer(title[i], name[i], status[i]);
                list_ord.add(ord_cus);
            }

/*            String id_customer = "admin";

             PreparedStatement ps = conn.prepareStatement(
             "SELECT create_order.title, customer.name, ordered.status "
             + "FROM customer"
             + "JOIN create_order"
             + "ON (customer.id_cus = create_order.id_order)"
             + "JOIN ordered"
             + "ON (create_order.id_order = ordered.id_order)"
             + "JOIN translator"
             + "ON (ordered.id_order = translator.id_trans)"
             + "WHERE customer.id_customer = "+id_customer+" "
             );

             ResultSet rs = ps.executeQuery();
             while(rs.next()){
             ord_cus = new Order_customer(rs.getString("title"), rs.getString("name"), rs.getString("status"));
             list_ord.add(ord_cus);
             }
*/
            HttpSession session = request.getSession();
            session.setAttribute("list_order", list_ord);

            response.sendRedirect("Order_customer.jsp");

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
