/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Hacom
 */
public class ForgottenPasswordController extends HttpServlet {

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
response.setContentType("text/html;charset=UTF-8");
         processRequest(request, response);
         HttpSession session = request.getSession(); 
         String sessionCheck=(String)session.getAttribute("Login");
         if(sessionCheck!=null){
            response.sendRedirect("./home");
        }else{
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         }
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
       response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        processRequest(request, response);
        String password=request.getParameter("password");
        String confirmpassword=request.getParameter("confirmpassword");
       String email=request.getParameter("email");
        String dob=request.getParameter("dob");
         HttpSession session = request.getSession();
        session.setAttribute("newemail", email);

         session.setAttribute("newpassword", password);
         session.setAttribute("newconfirmpassword",confirmpassword );
         boolean check=true;
        
         if(email==null||email.equals("")){
              request.setAttribute("messageNewEmail", "Please enter your email!"); 
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         check=false;
       }else if(!UserDao.emailExist(email)){
          request.setAttribute("messageNewEmail", "Email not existed!"); 
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         check=false;
      }
         
       if(password==null||password.equals("")){
              request.setAttribute("messageNewPassword", "Please enter your new  password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         check=false;
       }
      
       if(confirmpassword==null||confirmpassword.equals("")){
              request.setAttribute("messageNewConfirmPassword", "Please enter your confirm password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         check=false;
       }else  if(!password.equals(confirmpassword)){
          request.setAttribute("messageNewConfirmNewPassword", "The two passwords do not match. Please enter them again!"); 
        RequestDispatcher dis=request.getRequestDispatcher("forgottenpassword.jsp");
        dis.forward(request,response);
         check=false;
      }
       
      
       if(check){
           boolean update=UserDao.updatePassword(password, email);
           if(update){
               response.sendRedirect("./login");
           }
         
     }else{
         response.sendRedirect("./forgottenpassword");     
           }
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
