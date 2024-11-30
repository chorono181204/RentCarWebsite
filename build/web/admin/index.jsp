
<!DOCTYPE html>
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
                <% int cnt_car = (int) request.getAttribute("count_car"); %>
                <% int cnt_user = (int) request.getAttribute("count_user"); %>
                <% int cnt_contact = (int) request.getAttribute("count_contact"); %>
                <% int cnt_rentinfor = (int) request.getAttribute("count_rentinfor"); %>
                <div class="cards">
                    <a class="card-single" href="admin-user">
                        <div>
                            <h1><%= cnt_user %></h1>
                            <span>Users</span>
                        </div>
                        <div>
                            <span class="las la-users"></span>
                        </div>
                    </a>

                    <a class="card-single" href="admin-contact">
                        <div>
                            <h1><%= cnt_contact %></h1>
                            <span>Contacts</span>
                        </div>
                        <div>
                            <span class="las la-phone"></span>
                        </div>
                    </a>

                    <a class="card-single" href="admin-rentinfor">
                        <div>
                            <h1><%= cnt_rentinfor %></h1>
                            <span>Rent info</span>
                        </div>
                        <div>
                            <span class="las la-user-alt"></span>
                        </div>
                    </a>

                    <a class="card-single" href="admin-car">
                        <div>
                            <h1><%= cnt_car %></h1>
                            <span>Cars</span>
                        </div>
                        <div>
                            <span class="las la-car-side"></span>
                        </div>
                    </a>
                </div>

            </main>
        </div>
        
    </body>
</html>
