/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.RentinforDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rentinfor;

public class AdminUpdateRentinforController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/updateRentinfor.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id;
        RentinforDao udb = new RentinforDao();
        try {
            id = Integer.parseInt(id_raw);
            Rentinfor u = udb.getRentinforById(id);
            request.setAttribute("rentinfor", u);
            request.getRequestDispatcher("admin/updateRentinfor.jsp").forward(request, response);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String rent_id_raw = request.getParameter("id");
        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String customer_note = request.getParameter("customer_note");
        String pick_up_date = request.getParameter("pick_up_date");
        String pick_off_date = request.getParameter("pick_off_date");
        String pick_up_location = request.getParameter("pick_up_location");
        String pick_off_location = request.getParameter("pick_off_location");
        String id_user_raw = request.getParameter("id_user");
        String time_sent = request.getParameter("time_sent");
        String status_raw = request.getParameter("status");
        Long rent_id, id_user, status;
        RentinforDao udb = new RentinforDao();
        try{
            rent_id = Long.parseLong(rent_id_raw);
            id_user = Long.parseLong(id_user_raw);
            status = Long.parseLong(status_raw);
            Rentinfor uNew = new Rentinfor(rent_id, customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, id_user, time_sent, status);
            udb.update(uNew);
            response.sendRedirect("admin-rentinfor");
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
