package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.file_create;

@WebServlet(name = "Create_order_Servlet", urlPatterns = {"/Create_order_Servlet"})
public class Create_order_Servlet extends HttpServlet {

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
            
            //รับค่า parameter จาก Create_order.html
            String title = request.getParameter("title");
            String translate = request.getParameter("translate");
            int num_page = Integer.parseInt(request.getParameter("num_page"));
            float price = Float.parseFloat(request.getParameter("price"));
            String description = request.getParameter("description");
            Date date = Date.valueOf(request.getParameter("orderdate"));
            
            //เช็ค
            out.println("<br>"+title+"<br>"+translate+"<br>"+num_page+"<br>"+price+"<br>"+description+"<br>"+date+"<br>");
            out.println("alert('Get Parameter Complete!!')");
            
            Part file = request.getPart("file_create");
            InputStream inputStream = file.getInputStream();
            file_create file_create = new file_create();
            file_create.fileCreate(title, inputStream);
            
            //เช็ค
            out.println("<br>alert('File Complete!!')");
            
            //เพิ่มข้อมูลลงฐานข้อมูล
            String sql = "INSERT INTO create_order (id_customer, title, file_create, description, price, due_date) "
                    + "VALUES (?,?,?,?,?,?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "admin");
            stmt.setString(2, title);
            stmt.setString(3, file_create.create());
            stmt.setString(4, description);
            stmt.setFloat(5, price);
            stmt.setDate(6, date);
            
            stmt.executeUpdate();
            stmt.close();
            
            //เช็ค
            out.println("<br>alert('INSERT Complete!!')");
            
        } catch (SQLException ex) {
            Logger.getLogger(Create_order_Servlet.class.getName()).log(Level.SEVERE, null, ex);
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
