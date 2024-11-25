/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CarDao;
import dao.ContactDao;
import dao.RentinforDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pc
 */
public class AdminIndexController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CarDao cdb = new CarDao();
        UserDao udb = new UserDao();
        ContactDao ctdb = new ContactDao();
        RentinforDao rdb = new RentinforDao();
        
        int count_car = cdb.count();
        request.setAttribute("count_car", count_car);
        
        int count_user = udb.count();
        request.setAttribute("count_user", count_user);
        
        int count_contact = ctdb.count();
        request.setAttribute("count_contact", count_contact);
        
        int count_rentinfor = rdb.count();
        request.setAttribute("count_rentinfor", count_rentinfor);
        
        
//        String id_raw = request.getParameter("id");
//        int id;
//        id = Integer.parseInt(id_raw);
//        String userName = udb.getUser(id);
//        request.setAttribute("userName", userName);
        
        request.getRequestDispatcher("admin/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
