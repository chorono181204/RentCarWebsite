package util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebFilter("/*")
public class AdminFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo bộ lọc
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
         HttpSession session = httpRequest.getSession();
        User us = (User) session.getAttribute("user");
        String requestURI = httpRequest.getRequestURI(); 
        if (requestURI.startsWith(httpRequest.getContextPath() + "/admin")) {
        if ( us == null ) {
            httpResponse.sendRedirect("login");
            return;
        }else if(us.getRole()!=0){
            httpResponse.sendRedirect("error403.jsp");
            return;
        }
        }       
        chain.doFilter(request, response);
    }

    public void destroy() {
        // Hủy bộ lọc
    }

    
}
