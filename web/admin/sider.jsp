<%-- 
    Document   : sider
    Created on : 08-10-2024, 23:06:12
    Author     : pc
--%>

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
                <h2><span class="lab la-accusoft"></span> <span>CarBook</span></h2>
            </div>

            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="admin" class=""><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="admin-user"><span class="las la-users"></span>
                            <span>Users</span></a>
                    </li>
                    <li>
                        <a href="admin-contact"><span class="las la-phone"></span>
                            <span>Contacts</span></a>
                    </li>
                    <li>
                        <a href="admin-rentinfor"><span class="las la-user-alt"></span>
                            <span>Rentinfors</span></a>
                    </li>
                    <li>
                        <a href="admin-car"><span class="las la-car-side"></span>
                            <span>Cars</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
