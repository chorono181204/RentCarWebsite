<%-- 
    Document   : updateUser
    Created on : 11-10-2024, 10:25:51
    Author     : pc
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update user</title>
        <link rel="stylesheet" href="admin/admin-create.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Update User</h1>
            <% User u = (User) request.getAttribute("user");%>
            <form action="update-user" method="post">   
                <label for="id">User ID:</label>
                <input type="text" id="id" name="id" readonly value="<%= u.getId_user()%>" />

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= u.getUsername()%>" />

                <label for="password">Password:</label>
                <input type="text" id="password" name="password" value="<%= u.getPassword()%>" />

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= u.getName()%>" />

                <label for="date_of_bird">Date of Birth:</label>
                <input type="date" id="date_of_bird" name="date_of_bird" value="<%= u.getDate()%>" />

                <label for="role">Role:</label>
                <div class="radio-group">
                    <input type="radio" id="role0" name="role" value="0" <%= u.getRole() == 0 ? "checked" : ""%> />0
                    <input type="radio" id="role1" name="role" value="1" <%= u.getRole() == 1 ? "checked" : ""%> />1    
                </div>

                <label for="status">Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" <%= u.getStatus() == 0 ? "checked" : ""%> />0
                    <input type="radio" id="status1" name="status" value="1" <%= u.getStatus() == 1 ? "checked" : ""%> />1
                </div>

                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
