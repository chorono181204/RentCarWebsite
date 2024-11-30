
<%@page import="model.Car"%>
<%@page import="java.util.List"%>
<%@page import="model.Rentinfor"%>
<%@page import="model.Rentinfor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
               List<Car>lc=(List<Car>)request.getAttribute("listCar");
            %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create rent information</title>
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
            <h1>Add a new rental information</h1>
            <form action="" method="post">
                <div class="form-field">
                    <label for="customer_name">Customer Name:</label>
                    <input type="text" id="customer_name" name="customer_name" required />
                </div>

                <div class="form-field">
                    <label for="phone">Phone:</label>
                    <input type="text" id="phone" name="phone" required />
                </div>

                <div class="form-field">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" required />
                </div>

                <div class="form-field">
                    <label for="customer_note">Customer Note:</label>
                    <textarea id="customer_note" name="customer_note" ></textarea>
                </div>

                <div class="form-field">
                    <label for="pick_up_date">Pick-Up Date:</label>
                    <input type="date" id="pick_up_date" name="pick_up_date" required />
                </div>

                <div class="form-field">
                    <label for="pick_off_date">Pick-Off Date:</label>
                    <input type="date" id="pick_off_date" name="pick_off_date" required />
                </div>

                <div class="form-field">
                    <label for="pick_up_location">Pick-Up Location:</label>
                    <input type="text" id="pick_up_location" name="pick_up_location" required />
                </div>

                <div class="form-field">
                    <label for="pick_off_location">Pick-Off Location:</label>
                    <input type="text" id="pick_off_location" name="pick_off_location" required />
                </div>
                <div class="form-field">
                    <label for="pick_time">Pick time:</label>
                    <input type="text" id="pick_time" name="pick_time" required />
                </div>
                   <div class="form-field ">
                    <label for="car">Car :</label>
                    <select  name="id_car"   >
                        <% for (Car c : lc){ %>
                       
                        <option value="<%= c.getId_car() %>"   ><%= c.getCar_name()+" "+c.getColor() %></option>
                       
                         <%} %>
                         
                    </select>
                   </div>
                <div class="form-field">
                    <label for="status">Status:</label>
                    <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" checked/>Processing
                    <input type="radio" id="status1" name="status" value="1"/>Completed
                    </div>
                </div>

                <button type="submit">Create</button>
            </form>
        </div>
    </body>

</html>
