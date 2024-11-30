<%@page import="java.util.List"%>
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
                        <ul>
                            <li>
                                <a  href="file" style="width:223px; height:48px; padding:10px;">
                                    <i class="fas fa-user">
                                    </i>
                                    My Information
                                </a>
                            </li>
                            <li style="margin: 25px 0;">
                                <a class="active" href="rentinfor" style="background:#272d26;">
                                    <i class="fas fa-file-text">
                                    </i>
                                    Rent information
                                </a>
                            </li>
                             <li>
                                <a href="changepassword" style="
                                    width: 223px;
                                    height: 48px;
                                    padding-left: 11px;
                                ">
                                    <svg style="width: 23px;margin-left: -6px;margin-right: 6px;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1 1 21.75 8.25Z" />
                                    </svg>
                                    <span>Change password</span>
                                </a>
                             </li>
                        </ul>
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

                                    <td style="color: #272d25;font-weight: bold;" ><%= rt.getPick_up_date()%></td>
                                    <td style="color: #272d25;font-weight: bold;"><%= rt.getPick_off_date()%></td>

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