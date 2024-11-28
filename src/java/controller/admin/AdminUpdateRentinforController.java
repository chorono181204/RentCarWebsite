package controller.admin;

import dao.CarDao;
import dao.RentinforDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Car;
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
        CarDao cd = new CarDao();
        List<Car>listCar=cd.getAll();
        int id;
        RentinforDao udb = new RentinforDao();
        try {
            id = Integer.parseInt(id_raw);
            Rentinfor u = udb.getRentinforById(id);
            request.setAttribute("rentinfor", u);
            request.setAttribute("listCar", listCar);
            request.getRequestDispatcher("admin/updateRentinfor.jsp").forward(request, response);
        }catch(NumberFormatException e){
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
         String id_raw = request.getParameter("id");
        int id;
        RentinforDao udb = new RentinforDao();
         
            id = Integer.parseInt(id_raw);
            Rentinfor u = udb.getRentinforById(id);
        String customer_name = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        String customer_note = request.getParameter("customer_note");
        String pick_up_date = request.getParameter("pick_up_date");
        String pick_off_date = request.getParameter("pick_off_date");
        String pick_up_location = request.getParameter("pick_up_location");
        String pick_off_location = request.getParameter("pick_off_location");
        String pick_time = request.getParameter("pick_time");
        String status_raw = request.getParameter("status");
        String id_car_raw=request.getParameter("id_car");
        Long rent_id, id_user, status,id_car;
        String email;
        try{
            rent_id = u.getRent_id();
            id_user = u.getId_user();
            status = Long.parseLong(status_raw);
            email=u.getEmail();
            id_car=Long.parseLong(id_car_raw);
            Rentinfor uNew = new Rentinfor(rent_id, customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, id_user, pick_time, status,id_car);
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
