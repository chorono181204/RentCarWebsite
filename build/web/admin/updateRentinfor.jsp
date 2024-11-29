<%@page import="model.Car"%>
<%@page import="java.util.List"%>
<%@page import="model.Rentinfor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update rent information</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
        <style>
            .form-field select {
                width: 180px;
                height: 30px;
                margin-top: 5px;
                outline: none;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Update Rental Information</h1>
            <% Rentinfor u = (Rentinfor) request.getAttribute("rentinfor");
               List<Car>lc=(List<Car>)request.getAttribute("listCar");
            %>
            <form action="" method="post">                              
                <div class="form-field">
                    <label for="customer_name">Customer Name:</label>
                    <input type="text" id="customer_name" name="customer_name" value="<%= u.getCustomer_name()%>"  />
                </div>
                <div class="form-field">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= u.getPhone()%>"  />
                </div>              
                <div class="form-field">
                    <label for="customer_note">Customer Note:</label>
                    <textarea id="customer_note" name="customer_note" ><%= u.getCustomer_note()%></textarea>
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
                   
                                    <label for="" class="label">Pick-up time</label>
                                    <input type="text" class="form-control" id="time_pick" name="pick_time" placeholder="Time" required="required" value="<%= u.getPick_time() %>">
                                
                </div>

                <div class="form-field">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" value="<%= u.getStatus()%>"  />
                </div>
                 
                 <div class="form-field ">
                    <label for="car">Car :</label>
                    <select  name="id_car"   >
                        <% for (Car c : lc){ %>
                        <% if(c.getId_car()==u.getId_car()){    %>
                        <option value="<%= c.getId_car() %>" selected  ><%= c.getCar_name()+" "+c.getColor() %></option>
                        <%}else{ %>
                         <option value="<%= c.getId_car() %>"   ><%= c.getCar_name()+" "+c.getColor() %></option>
                         <%} %>
                         <%} %>
                    </select>

                </div>
                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
