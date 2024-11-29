<%@page import="model.Rentinfor"%>
<%@page import="model.CarBrand"%>
<%@page import="model.Car"%>
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
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Rent Car <i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread"> Rent Car </h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section contact-section">
            <div class="container">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-4">
                        <div style="margin-bottom: 0 !important;height: 100%;" class="row mb-5">
                            <div class="col-md-12">
                                <%  Car c = (Car) request.getAttribute("car");
                                     CarBrand cb = (CarBrand) request.getAttribute("carBrand");
                                     User us = (User) session.getAttribute("user");
                                     Rentinfor r=(Rentinfor)request.getAttribute("details");
                                %>
                                <div style="height: 100%;margin-bottom: 0 !important;" class="car-wrap rounded ftco-animate">
                                    <div class="img rounded d-flex align-items-end" style="background-size: contain;
                                         background-image: url(images/Car_Images/<%= c.getImg()%>);">
                                    </div>
                                    <div class="text">
                                        <h2 class="mb-0 text-center"><a href="cardetails?id=<%= c.getId_car()%>"><%= c.getCar_name()%></a></h2>
                                        <div class="text text-center">
                                            <p class="price ml-auto" style="font-size: 24px"><%= c.getPrice()%> <span>/day</span></p>
                                            <p> <span  style="color: #4D4242; font-size: 20px"><strong><%= cb.getName() %>  <%= c.getYear_of_manufacture() %></strong></span></p>
                                            <p><span style="color: #4D4242;"><strong><%= c.getTransmission()%></strong></span></p>
                                            <p><span style="color: #4D4242;"><strong><%= c.getSeats()%> Seats</strong></span></p>
                                            <p><span style="color: #4D4242;"><strong><%= c.getLuggage()%> Luggage</strong></span></p>
                                            <p> <span style="color: #4D4242;"><strong><%= c.getFuel()%></strong></span></p>
                                       
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div style="margin-bottom:0 !important" class="col-md-8 block-9 mb-md-5">
                        <div action="" class="bg-light p-5 contact-form" method="POST">
                            <div class="form-group">
                                <label for="" class="label">Your name</label>
                                <p><%= r.getCustomer_name() %> </p>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Phone</label>
                                <p><%= r.getPhone() %> </p>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Pick-up location</label>
                                 <p><%= r.getPick_up_location()%> </p>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Drop-off location</label>
                                <p><%= r.getPick_off_location()%> </p>
                            </div>
                            <div class="d-flex">
                                <div class="form-group mr-2">
                                    <label for="" class="label">Pick-up date</label>
                                    <p><%= r.getPick_up_date() %> </p>
                                </div>
                                <div class="form-group ml-2">
                                    <label for="" class="label">Drop-off date</label>
                                    <p><%= r.getPick_off_date()%>  </p>
                                </div>
                                <div class="form-group ml-3">
                                    <label for="" class="label">Pick-up time</label>
                                    <p><%= r.getPick_time()%> </p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Note</label>
                                <p><%= r.getCustomer_note()%> </p>
                            </div>
                           
                            <div style="height: 40px;display: flex;justify-content: center;" class="form-group text text-center">
                                <a style="  display: flex;
                                            width: 100px;
                                            height: 100%;
                                            background: #1089ff;
                                            padding: 0;
                                            text-align: center;
                                            align-items: center;
                                            justify-content: center;
                                            border-radius: 5px;
                                            color: white;" href="rentinfor">                                                            
                                    Go back
                                </a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
        <%@include file="public/footer.jsp" %>
    </body>
</html>