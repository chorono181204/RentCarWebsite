<%-- 
    Document   : updateContact
    Created on : 16-10-2024, 23:31:28
    Author     : pc
--%>

<%@page import="model.Contact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update contact</title>
        <link rel="stylesheet" href="admin/admin-create.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Update Contact</h1>
            <% Contact u = (Contact) request.getAttribute("contact");%>
            <form action="update-contact" method="post">   
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" readonly value="<%= u.getId()%>" />

                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= u.getUsername()%>" />

                <label for="email">Email:</label>
                <input type="text" id="email" name="email" value="<%= u.getEmail()%>" />

                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" value="<%= u.getSubject()%>" />

                <label for="message">Message:</label>
                <input type="text" id="message" name="message" value="<%= u.getMessage()%>" />

                <label>Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" <%= u.getStatus() == 0 ? "checked" : ""%> />0
                    <input type="radio" id="status1" name="status" value="1" <%= u.getStatus() == 1 ? "checked" : ""%> />1
                </div>

                <label for="time_sent">Time Sent:</label>
                <input type="date" id="time_sent" name="time_sent" value="<%= u.getTime_sent()%>" />

                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
