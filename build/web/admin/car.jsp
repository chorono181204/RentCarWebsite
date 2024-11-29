<%@page import="DTO.AdminCarDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.Car"%>
<%@page import="model.Car"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Car</title>
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
        <link rel="stylesheet" type="text/css" href="./css/custom.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="./css/animate.css">

        <link rel="stylesheet" href="./css/owl.carousel.min.css">
        <link rel="stylesheet" href="./css/owl.theme.default.min.css">
        <link rel="stylesheet" href="./css/magnific-popup.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure you want to delete that car ?")) {
                    window.location = "delete-car?id=" + id;
                }
            }
        </script>
        <style>
            .select__box {
                justify-content: center;
            }
            
            .select__box--item label {
                display: inline-block;
            }
            
            table {
                margin-bottom: 50px;
            }
            
            .pagination {
                text-align: center;
            }
            
            .pagination li:hover {
                background: #1089ff;
                transition: .5s;
                color: #fff;
            }
            
            .pagination li a {
                color: #1089ff;
                width: 100%;
                display: block;
            }
            
            
            .col .block-27 ul li.active a {
                color: #fff;
            }
            
            
            .pagination li:hover a {
                color: #fff;
            }
            
            .col .block-27 ul li a:hover {
                border: 0;
                background: none;
            }
            
            .select__box select {
                padding: 4px 10px;
                width: 160px;
            }
            
            .select__box .select__box--item label {
                font-size: 16px;
            }
            
            .select__box .select__box--item select {
                font-size: 16px;
            }
            
            .select__box .select__box--item input {
                height: 33px;
                width: 160px;
                font-size: 16px;
            }
            
            .filter button.submit {
                border: 2px solid #c2c2c2;
                border-radius: 10px;
                color: gray;
            }
            
            .search__bar {
                border-radius: 10px;
                border: 0;
                box-shadow: inset 0px 1px 6px rgba(0, 0, 0, 0.2);
            }
            
            .filter button.submit {
                border: 0px;
                border-radius: 10px;
                color: #6b6464;
                box-shadow: 1px 2px 6px rgba(0, 0, 0, 0.2);
            }
        </style>
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
                    <div style="
                        display: flex;
                        align-items: center;
                    ">
                        <h4>Admin</h4>
                    </div>
                </div>
            </header>

            <main>
                
                <form class="filter" action="admin-car" method="GET" 
                  style= "display: flex;
                          justify-content: center;
                          flex-direction: column;
                          margin-bottom: 50px;
                          align-items: center;
                          
                          ">
                
            <!--Search Bar-->
                    <div class="search__bar">
                         <input type="text" name="car_name" class="search" placeholder="Enter car name" value="${car_name}">
                         <button type="submit" style="background: none;
                                                        border: none;
                                                        outline: none;
                                                        cursor:pointer;
                                                        margin-top: 5px;"
                                                        >
                            <i class="fa-solid fa-magnifying-glass" style="color: #007bff;
                                                                            font-size: 18px;"></i>

                        </button>
                    </div>

                <!--Search Fields-->            
                    <div class="select__box" 
                         style="display: flex;
                                flex-wrap: wrap;
                                align-items: center;
                                justify-content: space-evenly;
                                "
                            >
                        <div class="select__box--item">
                            <label for="carId">Car id</label>
                            <input type="text" id="carId" name="id_car" value="${car_id}">
                        </div>
                        <div class="select__box--item">
                            <label for="color">Color</label>
                            <select name="color" id="color">
                                <option value="">All</option>
                                <c:forEach var="item" items="${colors}">
                                    <option value="${item}" ${(item == color) ? "selected" : ""}>${item}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="district_id">Location</label>
                            <select name="district_id" id="district_id">
                                <option value="">All</option>
                                <c:forEach var="item" items="${districts}">
                                    <option value="${item.id}" ${(item.id == district_id) ? "selected" : ""}>${item.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="car_brand_id">Car brand</label>
                            <select name="car_brand_id" id="car_brand_id">
                                <option value="">All</option>
                                <c:forEach var="item" items="${brands}">
                                    <option value="${item.id}" ${(item.id == car_brand_id) ? "selected" : ""}>${item.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="car_type_id">Car type</label>
                            <select name="car_type_id" id="car_type_id">
                                <option value="">All</option>
                                <c:forEach var="item" items="${types}">
                                    <option value="${item.id}" ${(item.id == car_type_id) ? "selected" : ""}>${item.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="seats">Seats</label>
                            <select name="seats" id="seats">
                                <option value="">All</option>
                                <c:forEach var="item" items="${seats}">
                                    <option value="${item}" ${(item == seat) ? "selected" : ""}>${item}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="transmission">Transmission</label>
                            <select name="transmission" id="transmission">
                                <option value="">All</option>
                                <c:forEach var="item" items="${transmissions}">
                                    <option value="${item}" ${(item == transmissions) ? "selected" : ""}>${item}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="luggage">Luggage</label>
                            <select name="luggage" id="luggage">
                                <option value="" selected>All</option>
                                <c:forEach var="item" items="${luggages}">
                                    <option value="${item}" ${(item == luggage) ? "selected" : ""}>${item}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="priceFrom">From Price</label>
                            <input type="text" id="priceFrom" name="priceFrom" value="${priceFrom}">
                        </div>
                        <div class="select__box--item">
                            <label for="priceTo">To Price</label>
                            <input type="text" id="priceTo" name="priceTo" value="${priceTo}">
                        </div>
                        <div class="select__box--item">
                            <label for="priceFrom">From Year</label>
                            <input type="text" id="yearFrom" name="yearFrom" value="${yearFrom}">
                        </div>
                        <div class="select__box--item">
                            <label for="priceTo">To Year</label>
                            <input type="text" id="yearTo" name="yearTo" value="${yearTo}">
                        </div>
                        <div class="select__box--item">
                            <label for="status">Status</label>
                            <select name="status" id="status">
                                <option selected value="">All</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item}" ${(item == status_code) ? "selected" : ""}>${item == 0 ? "Available" : "Rented"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>            
                    <button type="submit" class="submit" style="cursor:pointer;">Search</button>
                </form>
                <c:if test="${totalItems != 0}">
                <button class="add-btn">
                    <a href="create-car">
                    <span style="font-size: 24px;font-weight: bold;margin-right: 10px;" class="las la-car-side"></span>
                        <h4>Add car</h4>
                    </a>
                </button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Car Id</th>
                        <th>Car name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Year</th>
                        <th>Current address</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<AdminCarDTO> cars = (List<AdminCarDTO>) request.getAttribute("cars"); %>
                    <% for (AdminCarDTO x : cars) {
                    %>
                    <tr>
                        <td><%= x.getId()%></td>    
                        <td><%= x.getName()%></td>              
                        <td><%= x.getDescription()%></td>
                        <td><%= x.getPrice()%></td>
                        <td><%= x.getYear()%></td>
                        <td><%= x.getCurrentAddress()%></td>
                        <% 
                            Long status_code = x.getStatus();
                            String status;
                            if(status_code == 0) {
                                status = "Available";
                            }
                            else {
                                status = "Rented";
                            }
                        %>
                        <td><%= status%></td>
                        <td>
                            <div class="action">
                                <button class="update-btn" ><a href="update-car?id=<%= x.getId()%>">Update</a></button>
                                <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getId()%>)">Delete</a></button>
                            </div>                           
                        </td>
                        <%
                            }
                        %>
                </table>
                </c:if>
                <div class="row mt-5 pagination">
                    <div class="col text-center">
                      <div class="block-27">
                        <ul>
                          <c:if test="${page != 1}">
                              <li><a href="admin-car?page=${page - 1}&car_name=${car_name}&id_car=${car_id}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&luggage=${luggage}&priceFrom=${priceFrom}&priceTo=${priceTo}&yearFrom=${yearFrom}&yearTo=${yearTo}&status=${status_code}">&lt;</a></li>
                          </c:if>
                          <c:forEach begin="1" end="${totalPages}" var="i">
                                  <li class="link ${i == page ? "active" : ""}"><a href="admin-car?page=${i}&car_name=${car_name}&id_car=${car_id}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&luggage=${luggage}&priceFrom=${priceFrom}&priceTo=${priceTo}&yearFrom=${yearFrom}&yearTo=${yearTo}&status=${status_code}">${i}</a></li>
                          </c:forEach>
                          <c:if test="${page != totalPages && totalItems != 0}">
                              <li><a href="admin-car?page=${page + 1}&car_name=${car_name}&id_car=${car_id}&color=${color}&district_id=${district_id}&car_brand_id=${car_brand_id}&car_type_id=${car_type_id}&seats=${seat}&transmission=${transmission}&luggage=${luggage}&priceFrom=${priceFrom}&priceTo=${priceTo}&yearFrom=${yearFrom}&yearTo=${yearTo}&status=${status_code}">&gt;</a></li>
                          </c:if>
                          <c:if test="${totalItems == 0}">
                              <div class="notFound" style="font-size: 25px;
                                                          font-weight: 500;">
                                  Car not found!
                              </div>
                          </c:if>
                        </ul>
                      </div>
                  </div>
                </div>
            </main>
        </div>
    </body>
</html>