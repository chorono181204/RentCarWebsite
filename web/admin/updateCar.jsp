<%-- 
    Document   : updateCar
    Created on : 16-10-2024, 21:37:29
    Author     : pc
--%>

<%@page import="model.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update car</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
    </head>
    <body>
        <div class="container">
            <h1>Update Car Information</h1>
            <%
                Car u = (Car) request.getAttribute("car");
                if (u == null) {
                    out.println("<p>Error: Car data not found.</p>");
                    return;
                }
            %>

            <form action="update-car" method="post" enctype="multipart/form-data">
                <div class="form-field">
                    <label for="id">Car ID:</label>
                    <input type="text" id="id" name="id" readonly value="<%= u.getId_car()%>" />
                </div>

                <div class="form-field">
                    <label for="carname">Car Name:</label>
                    <input type="text" id="carname" name="carname" value="<%= u.getCar_name()%>"  />
                </div>

                <div class="form-field">
                    <label for="seats">Seats:</label>
                    <input type="text" id="seats" name="seats" value="<%= u.getSeats()%>"  />
                </div>

                <div class="form-field">
                    <label for="fuel">Fuel:</label>
                    <input type="text" id="fuel" name="fuel" value="<%= u.getFuel()%>"  />
                </div>

                <div class="form-field">
                    <label for="transmission">Transmission:</label>
                    <input type="text" id="transmission" name="transmission" value="<%= u.getTransmission()%>"  />
                </div>

                <div class="form-field">
                    <label for="luggage">Luggage:</label>
                    <input type="text" id="luggage" name="luggage" value="<%= u.getLuggage()%>"  />
                </div>

                <div class="form-field">
                    <label for="img">Image:</label>
                    <input type="file" id="img" name="img"/>
                </div>

                <div class="form-field">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="<%= u.getDescription()%>"  />
                </div>

                <div class="form-field">
                    <label for="rate">Rate:</label>
                    <input type="text" id="rate" name="rate" value="<%= u.getRate()%>"  />
                </div>

                <div class="form-field">
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" value="<%= u.getStatus()%>"  />
                </div>

                <div class="form-field">
                    <label for="color">Color:</label>
                    <input type="text" id="color" name="color" value="<%= u.getColor()%>"  />
                </div>

                <div class="form-field">
                    <label for="price">Price:</label>
                    <input type="text" id="price" name="price" value="<%= u.getPrice()%>"  />
                </div>

                <div class="form-field">
                    <label for="year_of_manufacture">Year of Manufacture:</label>
                    <input type="text" id="year_of_manufacture" name="year_of_manufacture" value="<%= u.getYear_of_manufacture()%>"  />
                </div>

                <div class="form-field">
                    <label for="current_address">Current Address:</label>
                    <input type="text" id="current_address" name="current_address" value="<%= u.getCurrent_address()%>"  />
                </div>

                <div class="form-field">
                    <label for="car_type_id">Car Type ID:</label>
                    <input type="text" id="car_type_id" name="car_type_id" value="<%= u.getCar_type_id()%>"  />
                </div>

                <div class="form-field">
                    <label for="car_brand_id">Car Brand ID:</label>
                    <input type="text" id="car_brand_id" name="car_brand_id" value="<%= u.getCar_brand_id()%>"  />
                </div>

                <div class="form-field">
                    <label for="rent_id">Rent ID:</label>
                    <input type="text" id="rent_id" name="rent_id" value="<%= u.getRent_id()%>"  />
                </div>

                <div class="form-field">
                    <label for="district_id">District ID:</label>
                    <input type="text" id="district_id" name="district_id" value="<%= u.getDistrict_id()%>"  />
                </div>

                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
