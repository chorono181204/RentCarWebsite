package controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import service.UserService;

public class AdminUserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/user.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserService userService = new UserService();
        Map<String, String[]> params = request.getParameterMap();
        List<User> list = userService.findAllUser(params);        
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
        List<User> usersByPage = userService.adminGetListByPage(list, start, end);
        
        request.setAttribute("users", usersByPage);
        request.setAttribute("status", userService.findAllStatus());
        request.setAttribute("roles", userService.findAllRoles());
        request.setAttribute("page", page);
        request.setAttribute("totalPages", number);
        request.setAttribute("totalItems", size);
        if(params.containsKey("id_user")) {
            request.setAttribute("user_id", params.get("id_user")[0]);
        }
        if(params.containsKey("username")) {
            request.setAttribute("username_hi", params.get("username")[0]);
        }
        if(params.containsKey("name")) {
            request.setAttribute("name", params.get("name")[0]);
        }
        if(params.containsKey("dobFrom")) {
            request.setAttribute("dobFrom", params.get("dobFrom")[0]);
        }
        if(params.containsKey("dobTo")) {
            request.setAttribute("dobTo", params.get("dobTo")[0]);
        }
        if(params.containsKey("role")) {
            request.setAttribute("role", params.get("role")[0]);
        }
        if(params.containsKey("email")) {
            request.setAttribute("email", params.get("email")[0]);
        }
        if(params.containsKey("status") && !params.get("status")[0].equals("")) {
            request.setAttribute("status_code", params.get("status")[0]);
        }
   
        request.getRequestDispatcher("admin/user.jsp").forward(request, response);
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