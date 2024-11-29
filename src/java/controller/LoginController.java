package controller;

import dao.UserDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

public class LoginController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         processRequest(request, response);
         HttpSession session = request.getSession(); 
         String sessionCheck=(String)session.getAttribute("Login");
         if(sessionCheck!=null){
            response.sendRedirect("./home");
        }else{
        RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
        dis.forward(request,response);
         }    
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         HttpSession session = request.getSession();
        
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        session.setAttribute("username", username);

        
       if(username==null||username.equals("")){
              request.setAttribute("messageUsername", "Please enter your username!"); 
        RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
        dis.forward(request,response);
       }
       if(password==null||password.equals("")){
              request.setAttribute("messagePassword", "Please enter your password!"); 
        RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
        dis.forward(request,response);
       }
       User us=UserDao.loginAuth(username,password);

        
        if(username==null||username.equals("")){
            request.setAttribute("messageUsername", "Please enter your username!"); 
              RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
              dis.forward(request,response);
        }
        if(password==null||password.equals("")){
            request.setAttribute("messagePassword", "Please enter your password!"); 
            RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
            dis.forward(request,response);
        }

        if(us!=null ){
            if(us.getStatus()==1){
            if(us.getRole()==0){
            response.sendRedirect("./admin");
            }else if(us.getRole()==1) {
               response.sendRedirect("./home");
            }
            session.setAttribute("Login","successfull");
            session.setAttribute("user",us);

            }else{
                       request.setAttribute("UserNotActive", "User is not active!"); 
        RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
        dis.forward(request,response);
            }
        }else{
            request.setAttribute("message", "Username or password incorrect!"); 
        RequestDispatcher dis=request.getRequestDispatcher("login.jsp");
        dis.forward(request,response);

        }
        
    } 
}
