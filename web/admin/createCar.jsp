<%@page import="model.District"%>
<%@page import="model.District"%>
<%@page import="model.CarType"%>
<%@page import="java.util.List"%>
<%@page import="model.CarBrand"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Car</title>
        <link rel="stylesheet" href="admin/admin-create2.css"/>
    </head>
    <body>
        <div class="container">
            <% List<CarBrand> lcb=(List<CarBrand>) request.getAttribute("listBrand");
            List<CarType> lct=( List<CarType>) request.getAttribute("listType");
            List<District> ld=(List<District>) request.getAttribute("listDistrict");
            %>
            <h1>Add a new car</h1>
            <form action="create-car" method="post" enctype="multipart/form-data">
                <label for="car_name">Car Name:</label>
                <input type="text" id="car_name" name="car_name" required /><br/>

                <label for="seats">Seats:</label>
                <input type="text" id="seats" name="seats" required /><br/>

                <label for="fuel">Fuel:</label>
                <input type="text" id="fuel" name="fuel" required /><br/>

                <label for="transmission">Transmission:</label>
                <input type="text" id="transmission" name="transmission" required /><br/>

                <label for="luggage">Luggage:</label>
                <input type="text" id="luggage" name="luggage" required /><br/>

                <label for="img">Image URL:</label>
                <input type="file" id="img" name="img" required /><br/>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required /><br/>

                <label for="rate">Rate:</label>
                <input type="text" id="rate" name="rate" required /><br/>

                 <label>Status:</label>
                <div class="radio-group">
                    <input type="radio" id="status0" name="status" value="0" /> Available
                    <input type="radio" id="status1" name="status" value="1" />Rented
                </div>

                <label for="color">Color:</label>
                <input type="text" id="color" name="color" required /><br/>

                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required /><br/>

                <label for="year_of_manufacture">Year of Manufacture:</label>
                <input type="text" id="year_of_manufacture" name="year_of_manufacture" required /><br/>

                <label for="current_address">Current Address:</label>
                <input type="text" id="current_address" name="current_address" required /><br/>
                <label for="car_type_id">Car Type :</label>
                <select  name="car_type_id"  required >
                        <% for (CarType ct : lct){ %>                       
                        <option value="<%= ct.getId()%>"   ><%= ct.getType() %></option>                                       
                         <%} %>
                 </select>
                <label for="car_brand_id">Car Brand :</label>
                <select  name="car_brand_id"  required >
                        <% for (CarBrand cb : lcb){ %>                       
                        <option value="<%= cb.getId()%>"   ><%= cb.getName() %></option>                                       
                         <%} %>
                 </select>
                <label for="district_id">District :</label>
                <select  name="district_id"  required >
                        <% for (District d : ld){ %>                       
                        <option value="<%= d.getId()%>"   ><%= d.getName() %></option>                                       
                         <%} %>
                 </select>
                <button type="submit">Create</button>
            </form>
        </div>
    </body>
</html>
