/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RentinforDao;
import dao.UserDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Rentinfor;
import model.User;

/**
 *
 * @author Hacom
 */
public class FileController extends HttpServlet {


    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
         response.setContentType("text/html;charset=UTF-8");
           String sessionCheck=(String)session.getAttribute("Login");
           User us=(User) session.getAttribute("user");
         if(sessionCheck==null){
            response.sendRedirect("login");
        }else{
        response.setContentType("text/html;charset=UTF-8");
        RentinforDao rd=new RentinforDao();
        int count=rd.countByUser(us.getId_user());
        request.setAttribute("count", count);
        request.getRequestDispatcher("file.jsp").forward(request, response);
         }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
