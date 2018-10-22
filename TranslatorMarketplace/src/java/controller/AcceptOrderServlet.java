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

/**
 *
 * @author may
 */
@WebServlet(name = "AcceptOrderServlet", urlPatterns = {"/AcceptOrderServlet"})
public class AcceptOrderServlet extends HttpServlet {

    private Connection conn;
    private OrderTranslator ord_tran;
    
    public void init(){
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
            
            ServletContext sc = request.getServletContext();
            ArrayList list_order = (ArrayList) sc.getAttribute("list_order");
            
            String[] select = request.getParameter("select").split("_");
            String status = select[1];
            int id_order = Integer.parseInt(select[0]);
            
            PreparedStatement ps_order = conn.prepareStatement("UPDATE ordered SET status = ? WHERE id_order = ?");
            ps_order.setString(1, status);
            ps_order.setInt(2, id_order);
            
            int row = ps_order.executeUpdate();
            
            for(int i=0; i<list_order.size(); i++){
                OrderTranslator item = (OrderTranslator) list_order.get(i);
                
                if(item.getId_order()==(id_order)){
                    item.setStatus(status);
                }
            }
            
            ps_order.close();
            conn.close();
            response.sendRedirect("Order_Translator.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(AcceptOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
