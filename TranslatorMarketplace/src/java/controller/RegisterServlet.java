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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.file_create;

@MultipartConfig
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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

            //รับค่า parameter จาก Register.html
            String id_customer = request.getParameter("id_customer");
            String password = request.getParameter("password");
            String name_customer = request.getParameter("name_customer");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

//            Part picture = request.getPart("picture");
//            InputStream inputStream = picture.getInputStream();
//            file_create file_create = new file_create();
//            file_create.picture(id_customer, inputStream);
            //เช็ค
            //out.println("alert('Get Parameter Complete!!')");
//            String sql = "INSERT INTO customers (id_customer, password, name_customer, email, phone, picture) "
//                    + "VALUES (?,?,?,?,?,?)";
//            PreparedStatement pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, id_customer);
//            pstmt.setString(2, password);
//            pstmt.setString(3, name_customer);
//            pstmt.setString(4, email);
//            pstmt.setString(5, phone);
//            pstmt.setString(6, file_create.create());
//            pstmt.executeUpdate();
//            pstmt.close();
            ServletContext session = request.getServletContext();

            String sql = "SELECT * FROM customers WHERE id_customer=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id_customer);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                session.setAttribute("id_customer", id_customer);
                session.setAttribute("password", password);
                session.setAttribute("name_customer", name_customer);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);

                response.sendRedirect("Register.jsp");
            } else {
                out.println("SUCCESS");
            }

            //เช็ค
            //out.println("<br>alert('INSERT Complete!!')");
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
