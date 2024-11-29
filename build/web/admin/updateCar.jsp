
<%@page import="model.District"%>
<%@page import="model.CarType"%>
<%@page import="model.CarBrand"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update car</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
        <style>
            .form-field select {
                width: 100px;
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
            <h1>Update Car Information</h1>
            <%
                Car u = (Car) request.getAttribute("car");
                if (u == null) {
                    out.println("<p>Error: Car data not found.</p>");
                    return;
                }
            %>
             <% List<CarBrand> lcb=(List<CarBrand>) request.getAttribute("listBrand");
            List<CarType> lct=( List<CarType>) request.getAttribute("listType");
            List<District> ld=(List<District>) request.getAttribute("listDistrict");
            %>
            <form action="" method="post" enctype="multipart/form-data">
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
                    <input type="file" id="img" name="img" accept="image/*" />
                </div>

                <div class="form-field">
                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" value="<%= u.getDescription()%>"  />
                </div>

                <div class="form-field">
                    <label for="rate">Rate:</label>
                    <input type="text" id="rate" name="rate" value="<%= u.getRate()%>"  />
                </div>

            <label>Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" <%= u.getStatus() == 0 ? "checked" : ""%> />Available
                    <input type="radio" id="status1" name="status" value="1" <%= u.getStatus() == 1 ? "checked" : ""%> />Rented
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
                    <label for="car_type_id">Car Type :</label>
                     <select  name="car_type_id"  required >
                        <% for (CarType ct : lct){ %> 
                        <% if (ct.getId()==u.getCar_type_id()){ %>
                        <option value="<%= ct.getId()%>" selected  ><%= ct.getType() %></option>
                        <% } else{ %>
                         <option value="<%= ct.getId()%>"   ><%= ct.getType() %></option>
                         <% } %>
                         <%} %>
                 </select>
                </div>

                <div class="form-field">
                    <label for="car_brand_id">Car Brand :</label>
                    <select  name="car_brand_id"  required >
                        <% for (CarBrand cb : lcb){ %> 
                        <% if (cb.getId()==u.getCar_brand_id()){ %>
                        <option value="<%= cb.getId()%>" selected  ><%= cb.getName()%></option>
                        <% } else{ %>
                         <option value="<%= cb.getId()%>"   ><%= cb.getName()%></option>
                         <% } %>
                         <%} %>
                 </select>
                </div>             
                <div class="form-field">
                    <label for="district_id">District :</label>
                    <select  name="district_id"  required >
                        <% for (District d : ld){ %> 
                        <% if (d.getId()==u.getDistrict_id()){ %>
                        <option value="<%= d.getId()%>" selected  ><%= d.getName()%></option>
                        <% } else{ %>
                         <option value="<%= d.getId()%>"   ><%= d.getName()%></option>
                         <% } %>
                         <%} %>
                 </select>
                </div>

                <button type="submit">Update</button>
            </form>
        </div>
    </body>

</html>
