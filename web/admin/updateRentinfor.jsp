<%-- 
    Document   : updateRentinfor
    Created on : 17-10-2024, 23:48:44
    Author     : pc
--%>

<%@page import="model.Rentinfor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update rentinfor</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Update Rental Information</h1>
            <% Rentinfor u = (Rentinfor) request.getAttribute("rentinfor");%>
            <form action="update-rentinfor" method="post">
                <div class="form-field">
                    <label for="id">Rent ID:</label>
                    <input type="number" id="id" name="id" readonly value="<%= u.getRent_id()%>" />
                </div>
                
                <div class="form-field">
                    <label for="customer_name">Customer Name:</label>
                    <input type="text" id="customer_name" name="customer_name" value="<%= u.getCustomer_name()%>"  />
                </div>

                <div class="form-field">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= u.getPhone()%>"  />
                </div>

                <div class="form-field">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="<%= u.getEmail()%>"  />
                </div>

                <div class="form-field">
                    <label for="customer_note">Customer Note:</label>
                    <textarea id="customer_note" name="customer_note" required><%= u.getCustomer_note()%></textarea>
                </div>

                <div class="form-field">
                    <label for="pick_up_date">Pick-Up Date:</label>
                    <input type="date" id="pick_up_date" name="pick_up_date" value="<%= u.getPick_up_date()%>"  />
                </div>

                <div class="form-field">
                    <label for="pick_off_date">Pick-Off Date:</label>
                    <input type="date" id="pick_off_date" name="pick_off_date" value="<%= u.getPick_off_date()%>"  />
                </div>

                <div class="form-field">
                    <label for="pick_up_location">Pick-Up Location:</label>
                    <input type="text" id="pick_up_location" name="pick_up_location" value="<%= u.getPick_up_location()%>"  />
                </div>

                <div class="form-field">
                    <label for="pick_off_location">Pick-Off Location:</label>
                    <input type="text" id="pick_off_location" name="pick_off_location" value="<%= u.getPick_off_location()%>"  />
                </div>

                <div class="form-field">
                    <label for="id_user">User ID:</label>
                    <input type="text" id="id_user" name="id_user" value="<%= u.getId_user()%>"  />
                </div>

                <div class="form-field">
                    <label for="time_sent">Time Sent:</label>
                    <input type="date" id="time_sent" name="time_sent" value="<%= u.getTime_sent()%>"  />
                </div>

                <div class="form-field">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" value="<%= u.getStatus()%>"  />
                </div>

                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
