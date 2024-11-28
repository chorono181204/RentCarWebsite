package controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contact;
import service.ContactService;

public class AdminContactController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("admin/contact.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ContactService contactService = new ContactService();
        Map<String, String[]> params = request.getParameterMap();
        List<Contact> list = contactService.findAllContact(params);        
        
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
        List<Contact> listContactPerPage = contactService.GetListByPage(list, start, end);
        
        //Set Attributes
        request.setAttribute("contacts", listContactPerPage);
        request.setAttribute("status", contactService.findAllStatus());
        request.setAttribute("page", page);
        request.setAttribute("totalPages", number);
        request.setAttribute("totalItems", size);
        if(params.containsKey("username")) {
            request.setAttribute("name", params.get("username")[0]);
        }
        if(params.containsKey("email")) {
            request.setAttribute("email", params.get("email")[0]);
        }
        if(params.containsKey("subject")) {
            request.setAttribute("subject", params.get("subject")[0]);
        }
        if(params.containsKey("message")) {
            request.setAttribute("message", params.get("message")[0]);
        }
        if(params.containsKey("status") && !params.get("status")[0].equals("")) {
            request.setAttribute("status_code", params.get("status")[0]);
        }
        if(params.containsKey("sentFrom")) {
            request.setAttribute("sentFrom", params.get("sentFrom")[0]);
        }
        if(params.containsKey("sentTo")) {
            request.setAttribute("sentTo", params.get("sentTo")[0]);
        }
        
        request.getRequestDispatcher("admin/contact.jsp").forward(request, response);
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
