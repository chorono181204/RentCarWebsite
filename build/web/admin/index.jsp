<<<<<<< HEAD
=======
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->

<%@page import="model.Car"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Admin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
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

                    Dashboard
                </h2>
                
                <%// String userName = (String) request.getAttribute("userName"); %>
                <div class="user-wrapper">
                    <img src="admin/user.png" width="50px" height="50px" alt=""/>
                    <div>
                        <h4>John Doe</h4>
                        <small>Super admin</small>
                    </div>
                </div>
            </header>

            <main>
                <% int cnt_car = (int) request.getAttribute("count_car"); %>
                <% int cnt_user = (int) request.getAttribute("count_user"); %>
                <% int cnt_contact = (int) request.getAttribute("count_contact"); %>
                <% int cnt_rentinfor = (int) request.getAttribute("count_rentinfor"); %>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1><%= cnt_user %></h1>
                            <span>Users</span>
                        </div>
                        <div>
                            <span class="las la-users"></span>
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1><%= cnt_contact %></h1>
                            <span>Contacts</span>
                        </div>
                        <div>
                            <span class="las la-phone"></span>
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1><%= cnt_rentinfor %></h1>
                            <span>Rentinfors</span>
                        </div>
                        <div>
                            <span class="las la-user-alt"></span>
                        </div>
                    </div>

                    <div class="card-single">
                        <div>
                            <h1><%= cnt_car %></h1>
                            <span>Cars</span>
                        </div>
                        <div>
                            <span class="las la-car-side"></span>
                        </div>
                    </div>
                </div>

            </main>
        </div>
        
    </body>
</html>
>>>>>>> cbf9c38e23ebc147983d609d590171a08e08f53a
