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

@WebServlet(name = "AcceptOrderServlet", urlPatterns = {"/AcceptOrderServlet"})
public class AcceptOrderServlet extends HttpServlet {

    private Connection conn;
    private OrderTranslator ord_tran;
    
    @Override
    public void init(){
        conn = (Connection) getServletContext().getAttribute("connection");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            ServletContext sc = request.getServletContext();
            ArrayList list_order = (ArrayList) sc.getAttribute("list_order");
            
            String[] select = request.getParameter("select").split("_");
            int id_translator = Integer.parseInt(select[1]);
            String status = select[2];
            int id_order = Integer.parseInt(select[0]);
            
            PreparedStatement ps_order_y = conn.prepareStatement("UPDATE ordered SET status = ? WHERE id_order = ? AND id_translator = ?");
            ps_order_y.setString(1, status);
            ps_order_y.setInt(2, id_order);
            ps_order_y.setInt(3, id_translator);
            
            int row = ps_order_y.executeUpdate();
            
            PreparedStatement ps_order_n = conn.prepareStatement("UPDATE ordered SET status = ? WHERE id_order = ? AND id_translator not in (?)");
            ps_order_n.setString(1, "รายการนี้ถูกรับแล้ว");
            ps_order_n.setInt(2, id_order);
            ps_order_n.setInt(3, id_translator);
            ps_order_n.executeUpdate();
            
            for(int i=0; i<list_order.size(); i++){
                OrderTranslator item = (OrderTranslator) list_order.get(i);
                
                if(item.getId_order() == id_order){
                    item.setStatus(status);
                }
            }
            
            ps_order_y.close();
            ps_order_n.close();
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
