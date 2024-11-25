/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.CarDao;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Car;

/**
 *
 * @author pc
 */
@MultipartConfig
public class AdminCreateCarController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/createCar.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/createCar.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Lấy các tham số từ form
        String carname = request.getParameter("car_name");
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

        long seats = 0, luggage = 0, rate = 0, status = 0, price = 0, year_of_manufacture = 0;
        long car_type_id = 0, car_brand_id = 0, rent_id = 0, district_id = 0;

        // Xử lý file ảnh upload
        Part part = request.getPart("img");
        String realPath = request.getServletContext().getRealPath("/uploads");
        String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

        // Kiểm tra và tạo thư mục nếu chưa tồn tại
        if (!Files.exists(Paths.get(realPath))) {
            Files.createDirectory(Paths.get(realPath));
        }

        try {
            // Ghi file vào thư mục
            part.write(realPath + File.separator + filename);
        } catch (IOException e) {
            System.out.println("Error writing file: " + e.getMessage());
        }

        // Parse các tham số sang số nguyên
        try {
            seats = Long.parseLong(seats_raw != null ? seats_raw : "0");
            luggage = Long.parseLong(luggage_raw != null ? luggage_raw : "0");
            rate = Long.parseLong(rate_raw != null ? rate_raw : "0");
            status = Long.parseLong(status_raw != null ? status_raw : "0");
            price = Long.parseLong(price_raw != null ? price_raw : "0");
            year_of_manufacture = Long.parseLong(year_of_manufacture_raw != null ? year_of_manufacture_raw : "0");
            car_type_id = Long.parseLong(car_type_id_raw != null ? car_type_id_raw : "0");
            car_brand_id = Long.parseLong(car_brand_id_raw != null ? car_brand_id_raw : "0");
            rent_id = Long.parseLong(rent_id_raw != null ? rent_id_raw : "0");
            district_id = Long.parseLong(district_id_raw != null ? district_id_raw : "0");

            // Tạo đối tượng Car và lưu vào cơ sở dữ liệu
            Car uNew = new Car(carname, fuel, transmission, filename, description, color, current_address, 1, seats, luggage, rate, status, price, year_of_manufacture, car_type_id, car_brand_id, rent_id, district_id);
            CarDao udb = new CarDao();
            udb.insert(uNew);

            // Chuyển hướng sau khi lưu thành công
            response.sendRedirect("admin-car");
        } catch (NumberFormatException e) {
            System.out.println("Error parsing number: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
