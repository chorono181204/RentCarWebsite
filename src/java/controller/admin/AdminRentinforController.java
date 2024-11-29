
package controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Rentinfor;
import service.RentInfoService;

public class AdminRentinforController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/rentinfor.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RentInfoService rentInfoService = new RentInfoService();
        Map<String, String[]> params = request.getParameterMap();
        List<Rentinfor> list = rentInfoService.findAllInfor(params);        
        
        int page, numberPerPage = 10;
        int size = list.size();
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
        List<Rentinfor> listContactPerPage = rentInfoService.GetListByPage(list, start, end);
        
        //Set Attributes
        request.setAttribute("infor", listContactPerPage);
        request.setAttribute("status", rentInfoService.findAllStatus());
        request.setAttribute("page", page);
        request.setAttribute("totalPages", number);
        request.setAttribute("totalItems", size);
        
        if(params.containsKey("customer_name")) {
            request.setAttribute("customer_name", params.get("customer_name")[0]);
        }
        if(params.containsKey("email")) {
            request.setAttribute("email_rent_info", params.get("email")[0]);
        }
        if(params.containsKey("phone")) {
            request.setAttribute("phone", params.get("phone")[0]);
        }
        if(params.containsKey("id_user")) {
            request.setAttribute("customer_id", params.get("id_user")[0]);
        }
        if(params.containsKey("id_car")) {
            request.setAttribute("car_id", params.get("id_car")[0]);
        }
        if(params.containsKey("status") && !params.get("status")[0].equals("")) {
            request.setAttribute("status_code", params.get("status")[0]);
        }
        if(params.containsKey("pick_up_from")) {
            request.setAttribute("pick_up_from", params.get("pick_up_from")[0]);
        }
        if(params.containsKey("pick_up_to")) {
            request.setAttribute("pick_up_to", params.get("pick_up_to")[0]);
        }
        if(params.containsKey("pick_off_from")) {
            request.setAttribute("pick_off_from", params.get("pick_off_from")[0]);
        }
        if(params.containsKey("pick_off_to")) {
            request.setAttribute("pick_off_to", params.get("pick_off_to")[0]);
        }
        if(params.containsKey("pick_up_location")) {
            request.setAttribute("pick_up_location", params.get("pick_up_location")[0]);
        }
        if(params.containsKey("pick_off_location")) {
            request.setAttribute("pick_off_location", params.get("pick_off_location")[0]);
        }
        if(params.containsKey("rent_price")) {
            request.setAttribute("rent_price", params.get("rent_price")[0]);
        }
        request.getRequestDispatcher("admin/rentinfor.jsp").forward(request, response);
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
