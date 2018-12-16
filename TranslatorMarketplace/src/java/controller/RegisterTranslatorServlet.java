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

@WebServlet(name = "RegisterTranslatorServlet", urlPatterns = {"/RegisterTranslatorServlet"})
public class RegisterTranslatorServlet extends HttpServlet {
    
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
            
            //id cus จากตอน login
            ServletContext session = request.getServletContext();
            String id_customer = (String) session.getAttribute("id_customer");
            
            //รับค่า parameter
            String description = request.getParameter("describe");
            String level_skill = request.getParameter("translate");
            String[] checkbox = request.getParameterValues("box");
            String type_skill = "";
            
            for (int i=0; i<checkbox.length; i++) {
                type_skill += checkbox[i] + " ";
            }
            
            String sql = "INSERT INTO translators (id_customer, profile, level_skill, type_skill) "
                    + "VALUES (?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id_customer);
            pstmt.setString(2, description);
            pstmt.setString(3, level_skill);
            pstmt.setString(4, type_skill);

            pstmt.executeUpdate();
            pstmt.close();

            response.sendRedirect("Profile.jsp");
            
        } catch (SQLException ex) {
            Logger.getLogger(RegisterTranslatorServlet.class.getName()).log(Level.SEVERE, null, ex);
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
