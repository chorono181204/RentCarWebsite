<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href= "https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css" >
        <link rel="stylesheet" href="admin/style_admin.css"/>
    </head>
    <body>
        <div class="sidebar">
            <div class="sidebar-brand">
                <a href="admin" style="outline: none; font-size: 24px; color: white">
                    <span class="lab la-accusoft" style="padding-right:10px; font-size:35px;"></span> 
                    <span>CAR BOOK</span>
                </a>
            </div>

            <div class="sidebar-menu">
                <ul>
                    <% 
                        String currentPage = request.getRequestURI();
                    %>
                    <li>
                        <a href="admin" class="<%= currentPage.endsWith("admin/index.jsp") ? "active" : currentPage %>">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 0 1 6 3.75h2.25A2.25 2.25 0 0 1 10.5 6v2.25a2.25 2.25 0 0 1-2.25 2.25H6a2.25 2.25 0 0 1-2.25-2.25V6ZM3.75 15.75A2.25 2.25 0 0 1 6 13.5h2.25a2.25 2.25 0 0 1 2.25 2.25V18a2.25 2.25 0 0 1-2.25 2.25H6A2.25 2.25 0 0 1 3.75 18v-2.25ZM13.5 6a2.25 2.25 0 0 1 2.25-2.25H18A2.25 2.25 0 0 1 20.25 6v2.25A2.25 2.25 0 0 1 18 10.5h-2.25a2.25 2.25 0 0 1-2.25-2.25V6ZM13.5 15.75a2.25 2.25 0 0 1 2.25-2.25H18a2.25 2.25 0 0 1 2.25 2.25V18A2.25 2.25 0 0 1 18 20.25h-2.25A2.25 2.25 0 0 1 13.5 18v-2.25Z" />
                            </svg>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="admin-user" class="<%= currentPage.contains("admin/user") ? "active" : "" %>">
                            <span class="las la-users"></span>
                            <span>Users</span>
                        </a>
                    </li>
                    <li>
                        <a href="admin-contact" class="<%= currentPage.contains("admin/contact") ? "active" : "" %>">
                            <span class="las la-phone"></span>
                            <span>Contacts</span>
                        </a>
                    </li>
                    <li>
                        <a href="admin-rentinfor" class="<%= currentPage.contains("admin/rentinfor") ? "active" : "" %>">
                            <span class="las la-user-alt"></span>
                            <span>Rent Info</span>
                        </a>
                    </li>
                    <li>
                        <a href="admin-car" class="<%= currentPage.contains("admin/car") ? "active" : "" %>">
                            <span class="las la-car-side"></span>
                            <span>Cars</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
