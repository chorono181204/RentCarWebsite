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
      
      %>
        <span> <%=s %></span>
        <div class="text-content-wrapper">
                    <input name="name" type="text" placeholder="Enter your name..." class="form-control" value="<%=s%>">
                </div>
    </body>
</html>
       
    
