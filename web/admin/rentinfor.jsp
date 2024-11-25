<%-- 
    Document   : rentinfor
    Created on : Oct 6, 2024, 3:32:48 PM
    Author     : Hacom
--%>

<%@page import="model.Rentinfor"%>
<%@page import="model.Rentinfor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rentinfor</title>
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete a reninfor ?")) {
                    window.location = "delete-rentinfor?id=" + id;
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

                    Rentinfors
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

                <button class="add-btn"><a href="create-rentinfor"><h4>Add a new rentinfor</h4></a></button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Id</th>
                        <th>Customer</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Customer note</th>
                        <th>Pick up date</th>
                        <th>Pick off date</th>
                        <th>Pick up location</th>
                        <th>Pick off location</th>
                        <th>Id_user</th>
                        <th>Time sent</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<Rentinfor> rentinfors = (List<Rentinfor>) request.getAttribute("data"); %>
                    <% for (Rentinfor x : rentinfors) {
                    %>
                    <tr>
                        <td><%= x.getRent_id()%></td>
                        <td><%= x.getCustomer_name()%></td>
                        <td><%= x.getPhone()%></td>
                        <td><%= x.getEmail()%></td>
                        <td><%= x.getCustomer_note()%></td>
                        <td><%= x.getPick_up_date()%></td>
                        <td><%= x.getPick_off_date()%></td>
                        <td><%= x.getPick_up_location()%></td>
                        <td><%= x.getPick_off_location()%></td>
                        <td><%= x.getId_user()%></td> 
                        <td><%= x.getTime_sent()%></td>
                        <td><%= x.getStatus()%></td> 
                        <tD>
                            <button class="update-btn"><a href="update-rentinfor?id=<%= x.getRent_id()%>">Update</a></button>&nbsp;&nbsp;&nbsp;
                            <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getRent_id()%>)">Delete</a></button>
                        </tD>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </main>
        </div>

    </body>
</html>