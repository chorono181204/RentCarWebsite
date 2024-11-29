

<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User</title>
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
                if (confirm("Are you sure to delete a user ?")) {
                    window.location = "delete-user?id=" + id;
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
        <div>
            <%@include file="sider.jsp"%>
        </div>

        <div class="main-content">
            <header>
                <h2>
                    <label>
                        <span class=""></span>
                    </label>

                    Users
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
                <form class="filter" action="admin-user" method="GET" 
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
                            <label for="role">Role</label>
                            <select name="role" id="role">
                                <option selected value="">All</option>
                                <c:forEach var="item" items="${roles}">
                                    <option value="${item}" ${(item == role) ? "selected" : ""}>${item == 1 ? "User" : "Admin"}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="select__box--item">
                            <label for="user_id">User Id</label>
                            <input type="text" id="user_id" name="id_user" value="${user_id}">
                        </div>
                        <div class="select__box--item">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" value="${name_hi}">
                        </div>
                        <div class="select__box--item">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" value="${username_hi}">
                        </div>
                        <div class="select__box--item">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email" value="${email_hi}">
                        </div>
                        <div class="select__box--item">
                            <label for="dobFrom">Dob from</label>
                            <input style="font-size:16px;" type="date" id="dobFrom" name="dobFrom" value="${dobFrom}">
                        </div>
                        <div class="select__box--item">
                            <label for="dobTo">Dob to</label>
                            <input style="font-size:16px;" type="date" id="dobTo" name="dobTo" value="${dobTo}">
                        </div>
                        <div class="select__box--item">
                            <label for="status">Status</label>
                            <select  name="status" id="status">
                                <option selected value="">All</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item}" ${(item == status_code) ? "selected" : ""}>${item == 1 ? "Active" : "Disabled"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>            
                    <button type="submit" class="submit" style="cursor:pointer;">Search</button>
                </form>
                <button class="add-btn">
                    <a href="create-user">
                        <svg style="width: 24px;font-weight: bold;margin-right: 5px;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M18 7.5v3m0 0v3m0-3h3m-3 0h-3m-2.25-4.125a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0ZM3 19.235v-.11a6.375 6.375 0 0 1 12.75 0v.109A12.318 12.318 0 0 1 9.374 21c-2.331 0-4.512-.645-6.374-1.766Z" />
                        </svg>
                        <h4>Add user</h4>
                    </a>
                </button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Username</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date of bird</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<User> users = (List<User>) request.getAttribute("users"); %>
                    <% for (User x : users) {
                    %>
                    <tr>
                        <td><%= x.getUsername()%></td>
                        <td><%= x.getName()%></td>
                        <td><%= x.getEmail()%></td>
                        <td style="width: 115px;"><%= x.getDate_of_bird()%></td>
                        <% 
                            long role_code = x.getRole();
                            String role;
                            if(role_code == 0) {
                                role = "Admin";
                            }
                            else {
                                role = "User";
                            }
                        %>
                        <td><%= role%></td>
                        <% 
                            long statusCode = x.getStatus();
                            
                            String status;

                            if(statusCode == 1) {
                                status = "Active";
                            }
                            else {
                                status = "Disable";
                            }
                        %>
                        
                        <td><%= status%></td>
                        <td>
                            <div class="action">
                                <button class="update-btn"><a href="update-user?id=<%= x.getId_user()%>">Update</a></button>
                                <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getId_user()%>)">Delete</a></button>
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
                              <li><a href="admin-user?page=${page - 1}&role=${role}&id_user=${user_id}&name=${name_hi}&username=${username_hi}&email=${email_hi}&dobFrom=${dobFrom}&dobTo=${dobTo}&status=${status_code}">&lt;</a></li>
                          </c:if>
                          <c:forEach begin="1" end="${totalPages}" var="i">
                                  <li class="link ${i == page ? "active" : ""}"><a href="admin-user?page=${i}&role=${role}&id_user=${user_id}&name=${name_hi}&username=${username_hi}&email=${email_hi}&dobFrom=${dobFrom}&dobTo=${dobTo}&status=${status_code}">${i}</a></li>
                          </c:forEach>
                          <c:if test="${page != totalPages && totalItems != 0}">
                              <li><a href="admin-user?page=${page + 1}&role=${role}&id_user=${user_id}&name=${name_hi}&username=${username_hi}&email=${email_hi}&dobFrom=${dobFrom}&dobTo=${dobTo}&status=${status_code}">&gt;</a></li>
                          </c:if>
                          <c:if test="${totalItems == 0}">
                              <div class="notFound" style="font-size: 25px;
                                                          font-weight: 500;">
                                  User not found!
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