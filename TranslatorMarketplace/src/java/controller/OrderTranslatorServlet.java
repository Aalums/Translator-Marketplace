package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderTranslator;

@WebServlet(name = "OrderTranslatorServlet", urlPatterns = {"/OrderTranslatorServlet"})
public class OrderTranslatorServlet extends HttpServlet {

    private Connection conn;

    @Override
    public void init(){
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            ArrayList list_order = new ArrayList();
            
            //id cus จากตอน login
            ServletContext session = request.getServletContext();
            String id_customer = (String) session.getAttribute("id_customer");
            int id_translator = (Integer) session.getAttribute("id_translator");

            //sql translator's
            PreparedStatement ps_order = conn.prepareStatement(
                    "SELECT * FROM customers"
                            + " JOIN create_order USING (id_customer)"
                            + " JOIN ordered USING (id_order)"
                            + "WHERE id_translator = ?"
            );

            //set id_translator
            ps_order.setInt(1, id_translator);

            /* sql employer's name
            PreparedStatement ps_name = conn.prepareStatement(
                    "SELECT * FROM customers"
                    + " JOIN create_order USING (id_customer)"
                    + " WHERE id_order = ?;"); */

            //query translator's
            ResultSet rs_order = ps_order.executeQuery();

            while (rs_order.next()) {
                int id_order = rs_order.getInt("id_order");
                
                String employer = rs_order.getString("name_customer");
                String desc = rs_order.getString("description");
                String type = rs_order.getString("translate_type");
                int page = rs_order.getInt("num_page");
                float price = rs_order.getInt("price");
                Date date = rs_order.getDate("due_date");
                String file_order = rs_order.getString("file_order");
                
                String status = rs_order.getString("status");

                out.print(" name_hire = "+employer+" Date = "+date);
                OrderTranslator item = new OrderTranslator(id_order, employer, desc, page, date, status, type, price, file_order);
                list_order.add(item);
            }
                        
             ServletContext sc = request.getServletContext();
             sc.setAttribute("list_order", list_order);
            
             response.sendRedirect("Order_Translator.jsp");
             
        } catch (SQLException ex) {
            Logger.getLogger(OrderTranslatorServlet.class.getName()).log(Level.SEVERE, null, ex);
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
