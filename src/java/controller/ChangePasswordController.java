/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RentinforDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String sessionCheck = (String) session.getAttribute("Login");
        if (sessionCheck == null) {
            response.sendRedirect("login");
        } else {

            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
      
        String sessionCheck = (String) session.getAttribute("Login");
        User us = (User) session.getAttribute("user");
        if (sessionCheck == null) {
            response.sendRedirect("login");
        } else {
            String new_password = request.getParameter("new-password");
            String confirm_password = request.getParameter("confirm-password");
            
            if (!new_password.equals(confirm_password)) {
                request.setAttribute("messageNewConfirmNewPassword", "The two passwords do not match. Please enter them again!");
                RequestDispatcher dis = request.getRequestDispatcher("changepassword.jsp");
                dis.forward(request, response);
                
            }else
            {
                boolean update = UserDao.updatePassword(new_password, us.getEmail());
                if (update) {
                    response.sendRedirect("./file");
                }

            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
