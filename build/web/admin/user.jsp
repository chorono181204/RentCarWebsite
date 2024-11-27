

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
                        <th>Date of bird</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<User> users = (List<User>) request.getAttribute("data"); %>
                    <% for (User x : users) {
                    %>
                    <tr>
                        <td><%= x.getUsername()%></td>
                        <td><%= x.getName()%></td>
                        <td><%= x.getDate()%></td>
                        <% 
                            Long role_code = x.getRole();
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
                            Long status_code = x.getStatus();
                            String status;
                            if(status_code == 0) {
                                status = "Disable";
                            }
                            else {
                                status = "Active";
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

            </main>
        </div>

        
    </body>
</html>