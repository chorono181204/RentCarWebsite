
package controller;

import DTO.CarDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.CarBrandService;
import service.CarService;
import service.CarTypeService;
import service.DistrictService;

@WebServlet(name = "CarController", urlPatterns = {"/car"})
public class CarController extends HttpServlet {
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CarBrandService carBrandService = new CarBrandService();
        CarTypeService carTypeService = new CarTypeService();
        DistrictService districtService = new DistrictService();
        CarService carService = new CarService();
        List<CarDTO> listCarDTOTmp = new ArrayList<>();
        Map<String, String[]> params = request.getParameterMap();
        listCarDTOTmp = carService.findAll(params);
        
        //Pagination variables
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
        List<CarDTO> listCarDTO = carService.getListByPage(listCarDTOTmp, start, end);
        
        //Set Attributes
        request.setAttribute("cars", listCarDTO);
        request.setAttribute("colors", carService.findAllColors());
        request.setAttribute("seats", carService.findAllSeats());
        request.setAttribute("transmissions", carService.findAllTransmission());
        request.setAttribute("districts", districtService.findAllDistricts());
        request.setAttribute("brands", carBrandService.findAllBrands());
        request.setAttribute("types", carTypeService.findAllTypes());
        request.setAttribute("page", page);
        request.setAttribute("totalPages", number);
        request.setAttribute("totalItems", size);
        if(params.containsKey("car_name")) {
            request.setAttribute("car_name", params.get("car_name")[0]);
        }
        if(params.containsKey("color")) {
            request.setAttribute("color", params.get("color")[0]);
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
        
        //Forward
        RequestDispatcher rd = request.getRequestDispatcher("car.jsp");
        rd.forward(request, response);
    }
}
