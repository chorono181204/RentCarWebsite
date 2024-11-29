package controller;

import dao.CarBrandDao;
import dao.CarDao;
import dao.RentinforDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Car;
import model.CarBrand;
import model.Rentinfor;
import javax.servlet.http.HttpSession;

public class RentCarController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session = request.getSession();
         response.setContentType("text/html;charset=UTF-8");
           String sessionCheck=(String)session.getAttribute("Login");
         if(sessionCheck==null){
            response.sendRedirect("login");
        }else{
          RequestDispatcher dis = request.getRequestDispatcher("rentcar.jsp");
           String id_raw = request.getParameter("id");
            long id;
            id = Long.parseLong(id_raw);
            CarDao carDao = new CarDao();
            Car car= carDao.getCarById(id);
            request.setAttribute("car", car);
             CarBrandDao carBrandDao=new CarBrandDao();
            CarBrand carBrand= carBrandDao.findNameById(car.getCar_brand_id());
            request.setAttribute("carBrand", carBrand);
            dis.forward(request, response);
         }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String email=request.getParameter("email");
        String id_us=request.getParameter("id_user");
        String customer_note = request.getParameter("customer_note");
        String pick_up_date = request.getParameter("pick_up_date");
        String pick_off_date = request.getParameter("pick_off_date");
        String pick_up_location = request.getParameter("pick_up_location");
        String pick_off_location = request.getParameter("pick_off_location");
        String pick_time = request.getParameter("pick_time");
        long id_user, status;
        String id_raw = request.getParameter("id");
        long id_car;
        id_car = Long.parseLong(id_raw);
        id_user=Long.parseLong(id_us);
        RentinforDao rentinforDao = new RentinforDao();
        CarDao carDao=new CarDao();
        try{ 
            status = 0L;
            Rentinfor newRentinfor = new Rentinfor(1, customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, id_user, pick_time, status,id_car);
            rentinforDao.insert(newRentinfor);
            carDao.updateStatus(id_car);
            response.sendRedirect("rentinfor");
        }catch(NumberFormatException e){
            System.out.println(e);
        }
         
            
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
