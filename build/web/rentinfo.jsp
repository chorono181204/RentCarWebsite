<%@page import="model.Rentinfor"%>
<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="public/header.jsp" %>

    <body>

        <%@include file="public/menu.jsp" %>
        <!-- END nav -->

        <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
                    <div class="col-md-9 ftco-animate pb-5">
                        <p class="breadcrumbs"><span class="mr-2"><a href="home">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread">My profile</h1>
                    </div>
                </div>
            </div>
        </section>
        <%
            User us = (User) session.getAttribute("user");
            List<Rentinfor> rts = (List<Rentinfor>) request.getAttribute("lr");
        %>
        <section class="ftco-section contact-section">
            <div class="container">

                <div class="cus-container">
                    <div class="cus-sidebar">

                        <h2>
                            <strong><%= us.getName()%></strong> 
                        </h2>
                        <h3>
                            <strong>My account</strong>
                        </h3>
                        <ul>
                            <li>
                                <a  href="file">
                                    <i class="fas fa-user">
                                    </i>
                                    Information
                                </a>
                            </li>
                            <li>
                                <a class="active" href="rentinfor">
                                    <i class="fas fa-file-text">
                                    </i>
                                    Number of rented cars
                                </a>
                            </li>
                        </ul>


                        <a class="logout" href="logout">
                            Log out
                        </a>
                    </div>
                    <div class="cus-content">
                        <table>
                            <thead>
                                <tr>
                                    <th>Customer name</th>

                                    <th>Pick up date</th>
                                    <th>Pick off date</th>
                                    <th>Status</th>
                                    <th>Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Rentinfor rt : rts) { %>
                                <% long st = rt.getStatus();
                                    String stt = "";
                                    if (st == 0) {
                                        stt = "Pending confirmation";
                                    } else if (st == 1) {
                                        stt = "In the process of renting";
                                    } else {
                                        stt = "Done";
                                    }
                                %>
                                <tr>
                                    <td class="order-code"><%= rt.getCustomer_name()%></td>

                                    <td ><%= rt.getPick_up_date()%></td>
                                    <td><%= rt.getPick_off_date()%></td>

                                    <td class="status"><%= stt%></td>
                            
                                <td class="icons" >
                                    <a href="rentinfordetails?id=<%= rt.getRent_id() %>">
                                    <i  class="fas fa-file-text" ></i>
                                    </a>
                                </td>
                            
                            </tr>
                            <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>
        </section>


        <%@include file="public/footer.jsp" %>



        <!-- loader -->


    </body>
</html>