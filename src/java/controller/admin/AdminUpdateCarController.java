package controller.admin;

import dao.CarBrandDao;
import dao.CarDao;
import dao.CarTypeDao;
import dao.DistrictDao;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Car;
import model.CarBrand;
import model.CarType;
import model.District;
import org.apache.commons.io.FileUtils;

@MultipartConfig
public class AdminUpdateCarController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CarBrandDao cbd = new CarBrandDao();
        CarTypeDao ctd = new CarTypeDao();
        DistrictDao dd = new DistrictDao();
        List<CarType> lct = ctd.findAllTypes();
        List<District> ld = dd.findAllDistricts();
        List<CarBrand> lcb = cbd.findAllBrands();
        request.setAttribute("listType", lct);
        request.setAttribute("listBrand", lcb);
        request.setAttribute("listDistrict", ld);
        String id_raw = request.getParameter("id");
        int id;
        CarDao udb = new CarDao();
        try {
            id = Integer.parseInt(id_raw);
            Car u = udb.getCarById(id);
            request.setAttribute("car", u);
            request.getRequestDispatcher("admin/updateCar.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String id_raw = request.getParameter("id");
        String carname = request.getParameter("carname");
        String seats_raw = request.getParameter("seats");
        String fuel = request.getParameter("fuel");
        String transmission = request.getParameter("transmission");
        String luggage_raw = request.getParameter("luggage");
        String description = request.getParameter("description");
        String rate_raw = request.getParameter("rate");
        String status_raw = request.getParameter("status");
        String color = request.getParameter("color");
        String price_raw = request.getParameter("price");
        String year_of_manufacture_raw = request.getParameter("year_of_manufacture");
        String current_address = request.getParameter("current_address");
        String car_type_id_raw = request.getParameter("car_type_id");
        String car_brand_id_raw = request.getParameter("car_brand_id");
        String rent_id_raw = request.getParameter("rent_id");
        String district_id_raw = request.getParameter("district_id");

        long id = 0, seats = 0, luggage = 0, rate = 0, status = 0, price = 0, year_of_manufacture = 0;
        long car_type_id = 0, car_brand_id = 0, rent_id = 0, district_id = 0;
        CarDao udb = new CarDao();
        Car u = udb.getCarById(id);
        request.setAttribute("car", u);
        String fileName = "";
        Part filePart = request.getPart("img");
        //Tùy chỉnh theo máy mình!
        if (filePart == null) {
            String uploadPath = "C:\\RentCarWebsite\\web\\uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            fileName = filePart.getSubmittedFileName();
            File file = new File(uploadPath, fileName);
            FileUtils.copyInputStreamToFile(filePart.getInputStream(), file);
        } 
       

        try {
            // Parse các tham số từ form
            id = Long.parseLong(id_raw != null ? id_raw : "0");
            seats = Long.parseLong(seats_raw != null ? seats_raw : "0");
            luggage = Long.parseLong(luggage_raw != null ? luggage_raw : "0");
            rate = Long.parseLong(rate_raw != null ? rate_raw : "0");
            status = Long.parseLong(status_raw != null ? status_raw : "0");
            price = Long.parseLong(price_raw != null ? price_raw : "0");
            year_of_manufacture = Long.parseLong(year_of_manufacture_raw != null ? year_of_manufacture_raw : "0");
            car_type_id = Long.parseLong(car_type_id_raw != null ? car_type_id_raw : "0");
            car_brand_id = Long.parseLong(car_brand_id_raw != null ? car_brand_id_raw : "0");

            district_id = Long.parseLong(district_id_raw != null ? district_id_raw : "0");
             Car existCar=udb.getCarById(id);
             fileName=existCar.getImg();
            Car uNew = new Car(carname, fuel, transmission, fileName, description, color, current_address, 1, seats, luggage, rate, status, price, year_of_manufacture, car_type_id, car_brand_id, district_id);

            udb.update(uNew);

            response.sendRedirect("admin-car");
        } catch (NumberFormatException e) {
            System.out.println("Error parsing number: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Update failed: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
