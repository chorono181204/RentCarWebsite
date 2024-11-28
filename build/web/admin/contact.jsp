
<%@page import="model.Contact"%>
<%@page import="model.Contact"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" type="text/css" href="./css/custom.css">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="./css/animate.css">

        <link rel="stylesheet" href="./css/owl.carousel.min.css">
        <link rel="stylesheet" href="./css/owl.theme.default.min.css">
        <link rel="stylesheet" href="./css/magnific-popup.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you sure to delete a contact ?")) {
                    window.location = "delete-contact?id=" + id;
                }
            }
        </script>
        <style>
            input[type="date"] {
                background-color: #0080ff;
                padding: 5px;
                color: #ffffff;
                font-size: 16px;
                border: none;
                outline: none;
                border-radius: 5px;
              }
            ::-webkit-calendar-picker-indicator {
              background-color: #ffffff;
              padding: 5px;
              cursor: pointer;
              border-radius: 3px;
            }
            .select__box select {
                padding: 5px 10px;
                width: 140px;
            }
            
            .select__box .select__box--item label {
                font-size: 16px;
            }
            
            .select__box {
                justify-content: center;
            }
            
            .select__box--item label {
                display: inline-block;
            }
            
            table {
                margin-bottom: 50px;
            }
            
            .pagination {
                text-align: center;
            }
            
            .pagination li:hover {
                background: #1089ff;
                transition: .5s;
                color: #fff;
            }
            
            .pagination li a {
                color: #1089ff;
                width: 100%;
                display: block;
            }
            
            
            .col .block-27 ul li.active a {
                color: #fff;
            }
            
            
            .pagination li:hover a {
                color: #fff;
            }
            
            .col .block-27 ul li a:hover {
                border: 0;
                background: none;
            }
            
            .select__box select {
                padding: 4px 10px;
                width: 160px;
            }
            
            .select__box .select__box--item label {
                font-size: 16px;
            }
            
            .select__box .select__box--item input {
                height: 35px;
                width: 160px;
                font-size: 16px;
            }
        </style>
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
                <form class="filter" action="admin-contact" method="GET" 
                  style= "display: flex;
                          justify-content: center;
                          flex-direction: column;
                          margin-bottom: 50px;
                          align-items: center;
                          
                          ">
                <!--Search Fields-->            
                    <div class="select__box" 
                         style="display: flex;
                                flex-wrap: wrap;
                                align-items: center;
                                justify-content: space-evenly;
                                "
                            >
                        <div class="select__box--item">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="username" value="${username_retain}">
                        </div>
                        <div class="select__box--item">
                            <label for="email">Email</label>
                            <input type="text" id="email" name="email" value="${email_retain}">
                        </div>
                        <div class="select__box--item">
                            <label for="subject">Subject</label>
                            <input type="text" id="subject" name="subject" value="${subject}">
                        </div>
                        <div class="select__box--item">
                            <label for="sentFrom">Sent from</label>
                            <input style="font-size:16px;" type="date" id="sentFrom" name="sentFrom" value="${sentFrom}">
                        </div>
                        <div class="select__box--item">
                            <label for="sentTo">Sent to</label>
                            <input style="font-size:16px;" type="date" id="sentTo" name="sentTo" value="${sentTo}">
                        </div>
                        <div class="select__box--item">
                            <label for="status">Status</label>
                            <select name="status" id="status">
                                <option value="">All</option>
                                <c:forEach var="item" items="${status}">
                                    <option value="${item}" ${(item == status_code) ? "selected" : ""}>${item == 1 ? "Active" : "Disabled"}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>            
                    <button type="submit" class="submit" style="cursor:pointer;">Search</button>
                </form>

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
                        <th>Name</th>
                        <th>Email</th>
                        <th>Subject</th>
                        <th>Message</th>
                        <th>Status</th>
                        <th>Sent time</th>
                        <th>Action</th>
                    </tr>
                    <% List<Contact> contacts = (List<Contact>) request.getAttribute("contacts"); %>
                    <% for (Contact x : contacts) {
                    %>
                    <tr>
                        <td><%= x.getUsername()%></td>
                        <td><%= x.getEmail()%></td>
                        <td><%= x.getSubject()%></td>
                        <td><%= x.getMessage()%></td>
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
                        <td style="min-width: 120px;"><%= x.getTime_sent()%></td>
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
                <div class="row mt-5 pagination">
                    <div class="col text-center">
                      <div class="block-27">
                        <ul>
                          <c:if test="${page != 1}">
                              <li><a href="admin-contact?page=${page - 1}&username=${username}&email=${email}&subject=${subject}&sentFrom=${sentFrom}&sentTo=${sentTo}&status=${status_code}">&lt;</a></li>
                          </c:if>
                          <c:forEach begin="1" end="${totalPages}" var="i">
                                  <li class="link ${i == page ? "active" : ""}"><a href="admin-contact?page=${i}&username=${username}&email=${email}&subject=${subject}&sentFrom=${sentFrom}&sentTo=${sentTo}&status=${status_code}">${i}</a></li>
                          </c:forEach>
                          <c:if test="${page != totalPages && totalItems != 0}">
                              <li><a href="admin-contact?page=${page + 1}&username=${username}&email=${email}&subject=${subject}&sentFrom=${sentFrom}&sentTo=${sentTo}&status=${status_code}">&gt;</a></li>
                          </c:if>
                          <c:if test="${totalItems == 0}">
                              <div class="notFound" style="font-size: 25px;
                                                          font-weight: 500;">
                                  Contact not found!
                              </div>
                          </c:if>
                        </ul>
                      </div>
                  </div>
                </div>
            </main>
        </div>

    </body>
</html>

