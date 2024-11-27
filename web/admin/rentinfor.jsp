
<%@page import="model.Rentinfor"%>
<%@page import="model.Rentinfor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rent Information</title>
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
                        <th>Customer</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th>Customer note</th>
                        <th>Pick up date</th>
                        <th>Pick off date</th>
                        <th>Pick up location</th>
                        <th>Pick off location</th>
                        <th>Time sent</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    <% List<Rentinfor> rentinfors = (List<Rentinfor>) request.getAttribute("data"); %>
                    <% for (Rentinfor x : rentinfors) {
                    %>
                    <tr>
                        <td><%= x.getCustomer_name()%></td>
                        <td><%= x.getPhone()%></td>
                        <td><%= x.getEmail()%></td>
                        <td style="overflow-wrap: break-word; max-width: 200px;"><%= x.getCustomer_note()%></td>
                        <td><%= x.getPick_up_date()%></td>
                        <td><%= x.getPick_off_date()%></td>
                        <td><%= x.getPick_up_location()%></td>
                        <td><%= x.getPick_off_location()%></td>
                        <td><%= x.getPick_time()%></td>
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
                                <button class="update-btn"><a href="update-rentinfor?id=<%= x.getRent_id()%>">Update</a></button>
                                <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getRent_id()%>)">Delete</a></button>
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