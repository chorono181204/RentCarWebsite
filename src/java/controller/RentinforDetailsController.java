package controller;

import dao.CarBrandDao;
import dao.CarDao;
import dao.RentinforDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Car;
import model.CarBrand;
import model.Rentinfor;
import model.User;

public class RentinforDetailsController extends HttpServlet {

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
