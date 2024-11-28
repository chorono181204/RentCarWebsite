
<%@page import="model.Contact"%>
<%@page import="model.Contact"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact</title>
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete a contact ?")) {
                    window.location = "delete-contact?id=" + id;
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

                    Contacts
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
                    <a href="create-contact">
                        <svg style="width: 24px;font-weight: bold;margin-right: 5px;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                        </svg>
                        <h4>Add contact</h4>
                    </a>
                </button>
                <table border="1px" width="90%">
                    <tr>
                        <th>Id</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Status</th>
                        <th>Time sent</th>
                        <th>Action</th>
                    </tr>
                    <% List<Contact> contacts = (List<Contact>) request.getAttribute("data"); %>
                    <% for (Contact x : contacts) {
                    %>
                    <tr>
                        <td><%= x.getId()%></td>
                        <td><%= x.getUsername()%></td>
                        <td><%= x.getEmail()%></td>
                        <td><%= x.getMessage()%></td>
                        <td><%= x.getSubject()%></td>
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
                        <td><%= x.getTime_sent()%></td>
                        <td>
                            <div class="action">
                                <button class="update-btn"><a href="update-contact?id=<%= x.getId()%>">Update</a></button>
                                <button class="delete-btn"><a href="#" onclick="doDelete(<%= x.getId()%>)">Delete</a></button>
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

