/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CarBrandDao;
import dao.CarDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Car;
import model.CarBrand;

/**
 *
 * @author Hacom
 */
public class CarDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id_raw = request.getParameter("id");
            long id;
            id = Long.parseLong(id_raw);
            CarDao carDao = new CarDao();
            Car car= carDao.getCarById(id);
            CarBrandDao carBrandDao=new CarBrandDao();
            CarBrand carBrand= carBrandDao.findNameById(car.getCar_brand_id());
            List<Car>relatedCars=carDao.getAllByTypeAndBrand(car.getCar_type_id(),car.getCar_brand_id());
         request.setAttribute("car", car);
         request.setAttribute("carBrand", carBrand);
         request.setAttribute("relatedCar",relatedCars );
        RequestDispatcher dis = request.getRequestDispatcher("cardetails.jsp");
        dis.forward(request, response);

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
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
