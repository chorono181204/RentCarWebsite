/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;


import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class RegisterController extends HttpServlet {

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
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
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
        String username=request.getParameter("username");
         String name=request.getParameter("name");
        String password=request.getParameter("password");
        String confirmpassword=request.getParameter("confirmpassword");
       String email=request.getParameter("email");
        String dob=request.getParameter("dob");
         HttpSession session = request.getSession();
         session.setAttribute("name", name);
         session.setAttribute("username", username);
         session.setAttribute("dob", dob);
         session.setAttribute("email", email);
         session.setAttribute("password", password);
         session.setAttribute("confirmpassword",confirmpassword );
         boolean check=true;
        if(name==null||name.equals("")){
              request.setAttribute("messageName", "Please enter your name!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
        check=false;
       }
         if(email==null||email.equals("")){
              request.setAttribute("messageEmail", "Please enter your email!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
       }else if(UserDao.emailExist(email)){
          request.setAttribute("messageEmail", "Email existed!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
      }
          if(dob==null||dob.equals("")){
              request.setAttribute("messageDob", "Please enter your Date of birth!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
       }
        if(username==null||username.equals("")){
              request.setAttribute("messageUsername", "Please enter your username!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
       }else  if(UserDao.userExist(username)){
          request.setAttribute("messageUsername", "Username existed!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
      }              
       if(password==null||password.equals("")){
              request.setAttribute("messagePassword", "Please enter your password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
       }
      
       if(confirmpassword==null||confirmpassword.equals("")){
              request.setAttribute("messageConfirmPassword", "Please enter your confirm password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
       }else  if(!password.equals(confirmpassword)){
          request.setAttribute("messageConfirmPassword", "The two passwords do not match. Please enter them again!"); 
        RequestDispatcher dis=request.getRequestDispatcher("register.jsp");
        dis.forward(request,response);
         check=false;
      }
       
      
       if(check){
           User newUser=new User( name,  username,  password,  email, dob);  
           boolean regis=UserDao.register(newUser);
           if(regis){
         response.sendRedirect("./login");
     }else{
         response.sendRedirect("./register");     
           }
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
