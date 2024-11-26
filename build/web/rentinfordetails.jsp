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
                        <div class="row mb-5">
                            <div class="col-md-12">
                                <%  Car c = (Car) request.getAttribute("car");
                                     CarBrand cb = (CarBrand) request.getAttribute("carBrand");
                                     User us = (User) session.getAttribute("user");
                                     Rentinfor r=(Rentinfor)request.getAttribute("details");
                                %>
                                <div class="car-wrap rounded ftco-animate">
                                    <div class="img rounded d-flex align-items-end" style="background-image: url(images/Car_Images/<%= c.getImg()%>);">
                                    </div>
                                    <div class="text">
                                        <h2 class="mb-0"><a href="cardetails?id=<%= c.getId_car()%>"><%= c.getCar_name()%></a></h2>
                                        <div class="text text-left">
                                            <p class="price ml-auto "><%= c.getPrice()%> <span>/day</span></p>
                                            <p> <span><strong>Brand :</strong><%= cb.getName() %></span></p>
                                            <p><span><strong>Model year :</strong><%= c.getYear_of_manufacture() %></span></p>
                                            <p><span><strong>Transmission :</strong><%= c.getTransmission()%></span></p>
                                            <p><span><strong>Seats :</strong><%= c.getSeats()%></span></p>
                                            <p><span><strong>Luggage :</strong><%= c.getLuggage()%></span></p>
                                            <p> <span><strong>Fuel :</strong><%= c.getFuel()%></span></p>
                                       
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-8 block-9 mb-md-5">
                        <div action="" class="bg-light p-5 contact-form" method="POST">
                            <div class="form-group">
                                <label for="" class="label">Your name</label>
                                <p><%= r.getCustomer_name() %> </p>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Your phone</label>
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
                           
                            <div class="form-group text text-center">
                                <a href="rentinfor">
                                <button  class="btn btn-secondary py-3 px-4">Go back</button>
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