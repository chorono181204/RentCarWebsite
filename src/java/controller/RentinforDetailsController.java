/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CarBrandDao;
import dao.CarDao;
import dao.RentinforDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Car;
import model.CarBrand;
import model.Rentinfor;
import model.User;

/**
 *
 * @author Hacom
 */
public class RentinforDetailsController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
         
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String sessionCheck = (String) session.getAttribute("Login");
        User us = (User) session.getAttribute("user");
        if (sessionCheck == null) {
            response.sendRedirect("login");
        } else {
           
            String id_raw = request.getParameter("id");
            int rent_id;
            rent_id = Integer.parseInt(id_raw.trim());
            RentinforDao rd = new RentinforDao();
            Rentinfor r = rd.getRentinforById(rent_id);
            CarDao cd = new CarDao();
            Car c = cd.getCarById(r.getId_car());
            CarBrandDao cbd = new CarBrandDao();
            CarBrand cb = cbd.findNameById(c.getCar_brand_id());
            request.setAttribute("car", c);
            request.setAttribute("carBrand", cb);
            request.setAttribute("details", r);

            request.getRequestDispatcher("rentinfordetails.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
