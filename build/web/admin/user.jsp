<<<<<<< HEAD
=======
<%-- 
    Document   : user
    Created on : Oct 6, 2024, 9:21:27 PM
    Author     : Hacom
--%>

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
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete a user ?")) {
                    window.location = "delete-user?id=" + id;
                }
            }
        </script>
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

                <button class="add-btn"><a href="create-user"><h4>Add a new user</h4></a></button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Id_user</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Date of bird</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<User> users = (List<User>) request.getAttribute("data"); %>
                    <% for (User x : users) {
                    %>
                    <tr>
                        <td><%= x.getId_user()%></td>
                        <td><%= x.getUsername()%></td>
                        <td><%= x.getPassword()%></td>
                        <td><%= x.getName()%></td>
                        <td><%= x.getDate()%></td>
                        <td><%= x.getRole()%></td>
                        <td><%= x.getStatus()%></td>
                        <tD>
                            <button class="update-btn"><a href="update-user?id=<%= x.getId_user()%>">Update</a></button>&nbsp;&nbsp;&nbsp;&nbsp;
                            <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getId_user()%>)">Delete</a></button>
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

>>>>>>> cbf9c38e23ebc147983d609d590171a08e08f53a
