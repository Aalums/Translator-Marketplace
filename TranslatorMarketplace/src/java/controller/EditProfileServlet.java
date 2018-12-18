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
import java.sql.PreparedStatement;
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

/**
 *
 * @author eyenach
 */
@MultipartConfig
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    private Connection conn;
    private int row;

    public void init() {
        conn = (Connection) getServletContext().getAttribute("connection");
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            //แสดงผลลัพธ์เป็นภาษาไทยได้ถูกต้อง
            request.setCharacterEncoding("UTF-8");

            //รับค่า parameter จาก แก้ไขโปรไฟล์ลูกค้า
            String password = request.getParameter("password");
            String name_customer = request.getParameter("name_customer");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            Part picture = request.getPart("picture");
            
            //รับค่า parameter จาก แก้ไขโปรไฟล์นักแปล
            String describe = request.getParameter("describe");
            String level_skill = request.getParameter("translate");
            String[] checkbox = request.getParameterValues("box");
            String type_skill = "";
            
            for (int i=0; i<checkbox.length; i++) {
                type_skill += checkbox[i] + " ";
            }
            //เช็ค
            //out.println("alert('Get Parameter Complete!!')");

            ServletContext session = request.getServletContext();
            String id_customer = (String) session.getAttribute("id_customer");
            int id_translator = (int) session.getAttribute("id_translator");
            
            PreparedStatement ps_customer; 
            PreparedStatement ps_translator;
            
            if(level_skill != null && !type_skill.equals("")){
                //update ข้อมูลนักแปล
                ps_translator = conn.prepareStatement(
                        "UPDATE translators SET profile = ?,"
                                + " level_skill = ?,"
                                + " type_skill = ?, "
                                + " WHERE id_translator = ? "
                );

                ps_translator.setString(1, describe);
                ps_translator.setString(2, level_skill);
                ps_translator.setString(3, type_skill);
                ps_translator.setInt(4, id_translator);
                
                row = ps_translator.executeUpdate();
                ps_translator.close();
                
            } else if(picture != null){
                //update กรณีที่เปลี่ยนรูป
                ps_customer = conn.prepareStatement(
                        "UPDATE customers SET password = ?,"
                                + " name_customer = ?,"
                                + " email = ?,"
                                + " phone = ?,"
                                + " picture = ?"
                                + " WHERE id_customer = ?"
                );
                
                InputStream inputStream = picture.getInputStream();
                file_create file_create = new file_create();
                file_create.picture(id_customer, inputStream);
                
                ps_customer.setString(1, password);
                ps_customer.setString(2, name_customer);
                ps_customer.setString(3, email);
                ps_customer.setString(4, phone);
                ps_customer.setString(5, file_create.create());
                ps_customer.setString(6, id_customer);
                
                row = ps_customer.executeUpdate();
                ps_customer.close();
                
            } else {
                //update กรณีที่ไม่เปลี่ยนรูป
                ps_customer = conn.prepareStatement(
                        "UPDATE customers SET password = ?,"
                                + " name_customer = ?,"
                                + " email = ?,"
                                + " phone = ?,"
                                + " WHERE id_customer = ?"
                );
                
                ps_customer.setString(1, password);
                ps_customer.setString(2, name_customer);
                ps_customer.setString(3, email);
                ps_customer.setString(4, phone);
                ps_customer.setString(5, id_customer);
                
                row = ps_customer.executeUpdate();
                ps_customer.close();
            }
            
            System.out.println(row);
            
            response.sendRedirect("Order_customer.jsp");
            
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
