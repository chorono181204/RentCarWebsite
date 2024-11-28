package controller.admin;

import DTO.AdminCarDTO;
import DTO.CarDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Car;
import service.CarBrandService;
import service.CarService;
import service.CarTypeService;
import service.DistrictService;

public class AdminCarController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dis=request.getRequestDispatcher("admin/src/index.html");
        dis.forward(request, response);
        request.getRequestDispatcher("admin/car.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CarBrandService carBrandService = new CarBrandService();
        CarTypeService carTypeService = new CarTypeService();
        DistrictService districtService = new DistrictService();
        CarService carService = new CarService();
        List<AdminCarDTO> listCarDTOTmp = new ArrayList<>();
        Map<String, String[]> params = request.getParameterMap();
        listCarDTOTmp = carService.adminFindAll(params);
        int page, numberPerPage = 10;
        int size = listCarDTOTmp.size();
        int number = (size % numberPerPage == 0 ? (size / numberPerPage) : (size / numberPerPage) + 1);
        String currentPage = request.getParameter("page");
        if(currentPage == null) {
            page = 1;
        }
        else {
            page = Integer.parseInt(currentPage);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);
        
        //Get List By Page
        List<AdminCarDTO> listCarDTO = carService.adminGetListByPage(listCarDTOTmp, start, end);
        
        //Set Attributes
        request.setAttribute("cars", listCarDTO);
        request.setAttribute("colors", carService.findAllColors());
        request.setAttribute("seats", carService.findAllSeats());
        request.setAttribute("luggages", carService.findAllLuggage());
        request.setAttribute("transmissions", carService.findAllTransmission());
        request.setAttribute("districts", districtService.findAllDistricts());
        request.setAttribute("brands", carBrandService.findAllBrands());
        request.setAttribute("types", carTypeService.findAllTypes());
        request.setAttribute("page", page);
        request.setAttribute("totalPages", number);
        request.setAttribute("totalItems", size);
        if(params.containsKey("id_car")) {
            request.setAttribute("car_id", params.get("id_car")[0]);
        }
        if(params.containsKey("car_name")) {
            request.setAttribute("car_name", params.get("car_name")[0]);
        }
        if(params.containsKey("color")) {
            request.setAttribute("color", params.get("color")[0]);
        }
        if(params.containsKey("luggage")) {
            request.setAttribute("luggage", params.get("luggage")[0]);
        }
        if(params.containsKey("district_id")) {
            request.setAttribute("district_id", params.get("district_id")[0]);
        }
        if(params.containsKey("car_brand_id")) {
            request.setAttribute("car_brand_id", params.get("car_brand_id")[0]);
        }
        if(params.containsKey("car_type_id")) {
            request.setAttribute("car_type_id", params.get("car_type_id")[0]);
        }
        if(params.containsKey("seats")) {
            request.setAttribute("seat", params.get("seats")[0]);
        }
        if(params.containsKey("transmission")) {
            request.setAttribute("transmission", params.get("transmission")[0]);
        }
        if(params.containsKey("priceFrom")) {
            request.setAttribute("priceFrom", params.get("priceFrom")[0]);
        }
        if(params.containsKey("priceTo")) {
            request.setAttribute("priceTo", params.get("priceTo")[0]);
        }
        if(params.containsKey("yearFrom")) {
            request.setAttribute("yearFrom", params.get("yearFrom")[0]);
        }
        if(params.containsKey("yearTo")) {
            request.setAttribute("yearTo", params.get("yearTo")[0]);
        }
        
        
        request.getRequestDispatcher("admin/car.jsp").forward(request, response);
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
