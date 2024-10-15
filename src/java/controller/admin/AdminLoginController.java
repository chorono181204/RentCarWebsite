/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
public class AdminLoginController extends HttpServlet {

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
         processRequest(request, response);
         HttpSession session = request.getSession(); 
         String sessionCheck=(String)session.getAttribute("AdminLogin");
         if(sessionCheck!=null){
            response.sendRedirect("./admin-home");
        }else{
        RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
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
         HttpSession session = request.getSession();        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        session.setAttribute("Adminusername", username);
        
        User us=UserDao.loginAuth(username,password);
       if(username==null||username.equals("")){
              request.setAttribute("messageUsername", "Please enter your username!"); 
        RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
        dis.forward(request,response);
       }
       if(password==null||password.equals("")){
              request.setAttribute("messagePassword", "Please enter your password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
        dis.forward(request,response);
       }
        if(us!=null ){
            if(UserDao.loginAuthorization(us.getId_user())){
                response.sendRedirect("./admin-home");
            session.setAttribute("AdminLogin","successfull");
            }else{
        request.setAttribute("message", "Not Authorization"); 
        RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
        dis.forward(request,response);
            }
        }else{
            request.setAttribute("message", "Username or password incorrect!"); 
        RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
        dis.forward(request,response);
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
