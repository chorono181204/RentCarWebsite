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
                                     
                                %>
                                <div class="car-wrap rounded ftco-animate">
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
                    <div class="col-md-8 block-9 mb-md-5">
                        <form action="" class="bg-light p-5 contact-form" method="POST">
                            <div class="form-group">
                                <label for="" class="label">Your name</label>
                                <input type="text" class="form-control" id="customer_name" name="customer_name" placeholder="Your Name" required="required">
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Your phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Your Phone" required="required" >
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Pick-up location</label>
                                <input type="text" class="form-control" id="pick_up_location" name="pick_up_location" placeholder="City, Airport, Station, etc" required="required">
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Drop-off location</label>
                                <input type="text" class="form-control" id="pick_off_location" name="pick_off_location" placeholder="City, Airport, Station, etc" required="required">
                            </div>
                            <div class="d-flex">
                                <div class="form-group mr-2">
                                    <label for="" class="label">Pick-up date</label>
                                    <input type="date" class="form-control"   name="pick_up_date" placeholder="Date" required="required">
                                </div>
                                <div class="form-group ml-2">
                                    <label for="" class="label">Drop-off date</label>
                                    <input type="date" class="form-control"  name="pick_off_date" placeholder="Date" required="required">
                                </div>
                                <div class="form-group ml-3">
                                    <label for="" class="label">Pick-up time</label>
                                    <input type="text" class="form-control" id="time_pick" name="pick_time" placeholder="Time" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="" class="label">Note</label>
                                <textarea  cols="30" rows="7" class="form-control" id="customer_note" name="customer_note" placeholder="Note" ></textarea>
                            </div>
                            <input type="hidden" class="form-control"  name="email" value="<%= us.getEmail() %>" required="required">
                            <input type="hidden" class="form-control"  name="id_user"  value="<%= us.getId_user()%>" required="required">
                            <div class="form-group text text-center">
                                <button type="submit"  class="btn btn-secondary py-3 px-4">Rent car now </button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </section>


        <%@include file="public/footer.jsp" %>
    </body>
</html>