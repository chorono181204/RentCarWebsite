/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ContactDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;

/**
 *
 * @author Hacom
 */
@WebServlet(name = "ContactController", urlPatterns = {"/contact"})
public class ContactController extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
          RequestDispatcher dis=request.getRequestDispatcher("contact.jsp");
        dis.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
          request.setCharacterEncoding("UTF-8");
        
        String name = request.getParameter("customer_name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
       
      
        // Lấy thời gian hiện tại
        LocalDateTime currentTime = LocalDateTime.now();
        
        // Định dạng thời gian nếu cần
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");       
        String time_sent= currentTime.format(formatter); 
        Long status;
        ContactDao udb = new ContactDao();
        try{
            
            Contact uNew = new Contact(Long.parseLong("1"), name, email, subject, message,0L, time_sent);
            udb.insert(uNew);
            response.sendRedirect("home");
        }catch(NumberFormatException e){
            System.out.println(e);
        }
         
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
