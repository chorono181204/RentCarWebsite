<%@page import="model.Rentinfor"%>
<%@page import="model.Car"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
     // HttpSession session = request.getSession();
      Integer s=(Integer)request.getAttribute("id");
//      Car c=(Car) request.getAttribute("test");
        Rentinfor c =(Rentinfor) request.getAttribute("test");
      %>
        <span> <%=c.getCustomer_name()+" "+c.getCustomer_note()+" "+c.getEmail()+" "+c.getPhone()+" "+c.getPick_up_date()+" "+c.getPick_off_date()+" "+c.getPick_up_location()+" "+c.getPick_off_location()+" "+c.getPick_time()+" "+c.getId_car()+" "+c.getStatus()%></span>
        <div class="text-content-wrapper">
                    <input name="name" type="text" placeholder="Enter your name..." class="form-control" value="<%=s%>">
                </div>
    </body>
</html>
       
    
