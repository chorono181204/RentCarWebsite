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
        <div class="logout-btn">
            <a href="/RentCarWebSite" style="outline: none; font-size: 16px;
                                                display: flex;
                                                align-items: center;
                                                gap: 6px;
                                                color: #c5c5c5;
                                                ">
                <?xml version="1.0" ?>
                <svg id="Layer_1" style="width:20px;enable-background:new 0 0 24 24;" version="1.1" viewBox="0 0 24 24" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <style type="text/css">
                            .st0{fill:none;stroke:#c5c5c5;stroke-width:1.6724;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;}
                            .st1{fill:none;stroke:#c5c5c5;stroke-width:1.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;}
                            .st2{fill:none;stroke:#c5c5c5;stroke-width:1.5;stroke-linejoin:round;stroke-miterlimit:10;}
                    </style>
                        <g>
                            <g>
                            <line class="st1" x1="7.6" x2="22" y1="12" y2="12"/>
                            </g>
                        <g>
                            <path class="st1" d="M11.9,0.8H4.5C3.1,0.8,2,1.9,2,3.2v17.5c0,1.4,1.1,2.5,2.5,2.5h7.4"/>
                        </g>
                            <polyline class="st1" points="18.2,8.2 22,12 18.2,15.8  "/>
                        </g>
                </svg>
                <span>Logout</span>
            </a>
        </div>
    </body>
</html>
