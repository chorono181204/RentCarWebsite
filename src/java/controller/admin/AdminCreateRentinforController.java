/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CarDao;
import dao.RentinforDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Car;
import model.Rentinfor;

/**
 *
 * @author pc
 */
public class AdminCreateRentinforController extends HttpServlet {

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
         response.setContentType("text/html;charset=UTF-8");
         CarDao cd = new CarDao();
        List<Car>listCar=cd.getAll();
            request.setAttribute("listCar", listCar);
        request.getRequestDispatcher("admin/createRentinfor.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
         response.setContentType("text/html;charset=UTF-8");
        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String customer_note = request.getParameter("customer_note");
        String pick_up_date = request.getParameter("pick_up_date");
        String pick_off_date = request.getParameter("pick_off_date");
        String pick_up_location = request.getParameter("pick_up_location");
        String pick_off_location = request.getParameter("pick_off_location");
        String id_car_raw=request.getParameter("id_car");
        String pick_time = request.getParameter("pick_time");
        String status_raw = request.getParameter("status");
        long id_user, status;
        
        RentinforDao udb = new RentinforDao();
        try{
            id_user = 0;
            status = Long.parseLong(status_raw);
            long id_car=Long.parseLong(id_car_raw);
            Rentinfor uNew = new Rentinfor(1, customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, id_user, pick_time, status,id_car);
            udb.adminInsert(uNew);
            
            response.sendRedirect("admin-rentinfor");
        }catch(NumberFormatException e){
            System.out.println(e);
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
