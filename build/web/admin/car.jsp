<%-- 
    Document   : car
    Created on : Oct 6, 2024, 3:30:01 PM
    Author     : Hacom
--%>

<%@page import="java.util.List"%>
<%@page import="model.Car"%>
<%@page import="model.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Car</title>
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete a car ?")) {
                    window.location = "delete-car?id=" + id;
                }
            }
        </script>
    </head>

    <body>
        <div class="sidebar">
            <%@include file="sider.jsp"%>
        </div>

        <div class="main-content">
            <header>
                <h2>
                    <label>
                        <span class=""></span>
                    </label>

                    Cars
                </h2>

                <div class="user-wrapper">
                    <img src="admin/user.png" width="50px" height="50px" alt=""/>
                    <div>
                        <h4>John Doe</h4>
                        <small>Super admin</small>
                    </div>
                </div>
            </header>

            <main>

                <button class="add-btn"><a href="create-car"><h4>Add a new car</h4></a></button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Id_car</th>
                        <th>Car name</th>
                        <th>Seats</th>
                        <th>Fuel</th>
                        <th>Transmission</th>
                        <th>Luggage</th>
                        <th>Img</th>
                        <th>Description</th>
                        <th>Rate</th>
                        <th>Status</th>
                        <th>Color</th>
                        <th>Price</th>
                        <th>Year</th>
                        <th>Current address</th>
                        <!--                    <th>Car_type_id</th>
                                            <th>Car_brand_id</th>
                                            <th>Rent_id</th>
                                            <th>District_id</th>-->
                        <th>Action</th>
                    </tr>
                    <% List<Car> cars = (List<Car>) request.getAttribute("data"); %>
                    <% for (Car x : cars) {
                    %>
                    <tr>
                        <td><%= x.getId_car()%></td>
                        <td><%= x.getCar_name()%></td>
                        <td><%= x.getSeats()%></td>
                        <td><%= x.getFuel()%></td>
                        <td><%= x.getTransmission()%></td>
                        <td><%= x.getLuggage()%></td>
                        <td><img src="uploads/<%= x.getImg()%>" width="80px" height="80px"/></td>
                        <td><%= x.getDescription()%></td>
                        <td><%= x.getRate()%></td>
                        <td><%= x.getStatus()%></td>
                        <td><%= x.getColor()%></td>
                        <td><%= x.getPrice()%></td>
                        <td><%= x.getYear_of_manufacture()%></td>
                        <td><%= x.getCurrent_address()%></td>
    <!--                    <td><%= x.getCar_type_id()%></td>
                        <td><%= x.getCar_brand_id()%></td>
                        <td><%= x.getRent_id()%></td>
                        <td><%= x.getDistrict_id()%></td>-->
                        <tD>
                            <button class="update-btn"><a href="update-car?id=<%= x.getId_car()%>">Update</a></button>&nbsp;&nbsp;
                            <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getId_car()%>)">Delete</a></button>
                        </tD>
                        <%
                            }
                        %>
                </table>
            </main>
        </div>
    </body>
</html>