/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.UserDao;
import java.io.IOException;
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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
//        request.getRequestDispatcher("admin/login.jsp").forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession(); 
        String sessionCheck=(String)session.getAttribute("AdminLogin");
        if(sessionCheck!=null){
            response.sendRedirect("./admin-home");
        }
        else{
            RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
            dis.forward(request,response);
        }
        request.getRequestDispatcher("admin/login.jsp").forward(request, response);
    }


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
            }
            else {
                request.setAttribute("message", "Not Authorization"); 
                RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
                dis.forward(request,response);
            }
        }
        else{
            request.setAttribute("message", "Username or password incorrect!"); 
            RequestDispatcher dis=request.getRequestDispatcher("admin/login.jsp");
            dis.forward(request,response);
        } 
        //lay tu form: username and password
        String u = request.getParameter("user");
        String p = request.getParameter("pass");
        //lay tu web.xml: username and password
        String u_init = getServletContext().getInitParameter("user");
        String p_init = getServletContext().getInitParameter("pass");
        if(u.equalsIgnoreCase(u_init) && p.equals(p_init)){
            request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        }
        else{
            String ms="Tài khoản hoặc mật khẩu không đúng!";
            request.setAttribute("error", ms);
            request.getRequestDispatcher("admin/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
