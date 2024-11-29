
<%@page import="model.Rentinfor"%>
<%@page import="model.Rentinfor"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rent Information</title>
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
                if (confirm("Are you sure to delete a reninfor ?")) {
                    window.location = "delete-rentinfor?id=" + id;
                }
            }
        </script>
        <style>
            input[type="date"] {
                background-color: #0080ff;
                padding: 5px;
                color: #ffffff;
                font-size: 16px;
                border: none;
                outline: none;
                border-radius: 5px;
              }
            ::-webkit-calendar-picker-indicator {
              background-color: #ffffff;
              padding: 5px;
              cursor: pointer;
              border-radius: 3px;
            }
            
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
                width: 142px;
            }
            
            .select__box .select__box--item input {
                height: 35px;
                width: 160px;
                font-size: 16px;
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

                    Rent Information
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
                <form class="filter" action="admin-rentinfor" method="GET" 
                  style= "display: flex;
                          justify-content: center;
                          flex-direction: column;
                          margin-bottom: 50px;
                          align-items: center;
                          
                          ">
                <!--Search Fields-->            
                    <div class="select__box" 
                         style="display: flex;
                                flex-wrap: wrap;
                                align-items: center;
                                justify-content: space-evenly;
                                "
                            >
                        <div class="select__box--item">
                            <label for="customer_name" style="margin-bottom: 20px;">Customer name</label>
                            <input type="text" id="customer_name" name="customer_name" value="${customer_name}">
                        </div>
                        <div class="select__box--item">
                            <label for="customer_id">Customer id</label>
                            <input type="text" id="customer_id" name="id_user" value="${customer_id}">
                        </div>
                        <div class="select__box--item">
                            <label for="car_id">Car id</label>
                            <input type="text" id="car_id" name="id_car" value="${car_id}">
                        </div>
                        <div class="select__box--item">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email" value="${email}">
                        </div>
                        <div class="select__box--item">
                            <label for="phone">Phone</label>
                            <input type="text" id="phone" name="phone" value="${phone}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_up_from">Pick up from</label>
                            <input style="font-size:16px;" type="date" id="pick_up_from" name="pick_up_from" value="${pick_up_from}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_up_to">Pick up to</label>
                            <input style="font-size:16px;" type="date" id="sentTo" name="pick_up_to" value="${pick_up_to}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_off_from">Pick off from</label>
                            <input style="font-size:16px;" type="date" id="pick_off_from" name="pick_off_from" value="${pick_off_from}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_off_to">Pick off to</label>
                            <input style="font-size:16px;" type="date" id="pick_off_to" name="pick_off_to" value="${pick_off_to}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_up_location">Pick up location</label>
                            <input type="text" id="pick_up_location" name="pick_up_location" value="${pick_up_location}">
                        </div>
                        <div class="select__box--item">
                            <label for="pick_off_location">Pick off location</label>
                            <input type="text" id="pick_off_location" name="pick_off_location" value="${pick_off_location}">
                        </div>
                        <div class="select__box--item">
                            <label for="status">Status</label>
                            <select name="status" id="status">
                                <option selected value="">All</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item}" ${(item == status_code) ? "selected" : ""}>${item == 1 ? "Completed" : "Processing"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>            
                    <button type="submit" class="submit" style="cursor:pointer;">Search</button>
                </form>

                <button class="add-btn">
                    <a href="create-rentinfor">
                        <svg style="width: 24px;font-weight: bold;margin-right: 5px;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 0 0 2.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 0 0-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 0 0 .75-.75 2.25 2.25 0 0 0-.1-.664m-5.8 0A2.251 2.251 0 0 1 13.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25ZM6.75 12h.008v.008H6.75V12Zm0 3h.008v.008H6.75V15Zm0 3h.008v.008H6.75V18Z" />
                        </svg>
                        <h4>Add rent information</h4>
                    </a>
                </button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Customer id</th>
                        <th>Customer name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Customer note</th>
                        <th>Car id</th>
                        <th>Pick up date</th>
                        <th>Pick off date</th>
                        <th>Pick up location</th>
                        <th>Pick off location</th>
                        <th>Pick up time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<Rentinfor> rentinfors = (List<Rentinfor>) request.getAttribute("infor"); %>
                    <% for (Rentinfor x : rentinfors) {
                    %>
                    <tr>
                        <td><%= x.getId_user()%></td>
                        <td><%= x.getCustomer_name()%></td>
                        <td><%= x.getPhone()%></td>
                        <td><%= x.getEmail()%></td>
                        <td style="overflow-wrap: break-word; max-width: 200px;"><%= x.getCustomer_note()%></td>
                        <td><%= x.getId_car()%></td>
                        <td style="min-width: 120px;"><%= x.getPick_up_date()%></td>
                        <td style="min-width: 120px;"><%= x.getPick_off_date()%></td>
                        <td><%= x.getPick_up_location()%></td>
                        <td><%= x.getPick_off_location()%></td>
                        <td><%= x.getPick_time()%></td>
                        <% 
                            Long status_code = x.getStatus();
                            String status;
                            if(status_code == 0) {
                                status = "Processing";
                            }
                            else {
                                status = "Complete";
                            }
                        %>
                        <td><%= status%></td>
                        <td>
                            <div class="action">
                                <button class="update-btn"><a href="update-rentinfor?id=<%= x.getRent_id()%>">Update</a></button>
                                <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getRent_id()%>)">Delete</a></button>
                            </div>                          
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <div class="row mt-5 pagination">
                    <div class="col text-center">
                      <div class="block-27">
                        <ul>
                          <c:if test="${page != 1}">
                              <li><a href="admin-rentinfor?page=${page - 1}&customer_name=${customer_name}&id_user=${customer_id}&id_car=${car_id}&email=${email}&phone=${phone}&pick_up_from=${pick_up_from}&pick_up_to=${pick_up_to}&pick_off_from=${pick_off_from}&pick_off_to=${pick_off_to}&pick_up_location=${pick_up_location}&pick_off_location=${pick_off_location}&status=${status_code}">&lt;</a></li>
                          </c:if>
                          <c:forEach begin="1" end="${totalPages}" var="i">
                                  <li class="link ${i == page ? "active" : ""}"><a href="admin-rentinfor?page=${i}&customer_name=${customer_name}&id_user=${customer_id}&id_car=${car_id}&email=${email}&phone=${phone}&pick_up_from=${pick_up_from}&pick_up_to=${pick_up_to}&pick_off_from=${pick_off_from}&pick_off_to=${pick_off_to}&pick_up_location=${pick_up_location}&pick_off_location=${pick_off_location}&status=${status_code}">${i}</a></li>
                          </c:forEach>
                          <c:if test="${page != totalPages && totalItems != 0}">
                              <li><a href="admin-rentinfor?page=${page + 1}&customer_name=${customer_name}&id_user=${customer_id}&id_car=${car_id}&email=${email}&phone=${phone}&pick_up_from=${pick_up_from}&pick_up_to=${pick_up_to}&pick_off_from=${pick_off_from}&pick_off_to=${pick_off_to}&pick_up_location=${pick_up_location}&pick_off_location=${pick_off_location}&status=${status_code}">&gt;</a></li>
                          </c:if>
                          <c:if test="${totalItems == 0}">
                              <div class="notFound" style="font-size: 25px;
                                                          font-weight: 500;">
                                  Rent information not found!
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