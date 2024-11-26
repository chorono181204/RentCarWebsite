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
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Car details <i class="ion-ios-arrow-forward"></i></span></p>
                        <h1 class="mb-3 bread">Car Details</h1>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section ftco-car-details">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <%  Car c = (Car) request.getAttribute("car");
                            CarBrand cb = (CarBrand) request.getAttribute("carBrand");
                            List<Car>rcs=( List<Car>) request.getAttribute("relatedCar");
                            if (c == null) {
                                out.println("<p>Error: Car data not found.</p>");
                                return;
                            }
                        %>

                        <div class="car-details">		
                            <div class="img rounded " style="background-image: url(images/Car_Images/<%= c.getImg()%>);"></div>
                            <div class="text text-center">
                                <span class="subheading"><%=cb.getName()%></span>
                                <h2><%= c.getCar_name()%></h2>
                                 
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-dashboard"></span></div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-4">
                                             Model year 
                                            <span><%= c.getYear_of_manufacture() %></span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-pistons"></span></div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Transmission
                                            <span><%= c.getTransmission()%></span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-car-seat"></span></div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Seats
                                            <span><%= c.getSeats() %> Adults</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-backpack"></span></div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Luggage
                                            <span><%= c.getLuggage() %> Bags</span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md d-flex align-self-stretch ftco-animate">
                        <div class="media block-6 services">
                            <div class="media-body py-md-4">
                                <div class="d-flex mb-3 align-items-center">
                                    <div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-diesel"></span></div>
                                    <div class="text">
                                        <h3 class="heading mb-0 pl-3">
                                            Fuel
                                            <span><%= c.getFuel() %></span>
                                        </h3>
                                    </div>
                                </div>
                            </div>
                        </div>      
                    </div>
                </div>
                        <div class="text text-center">
                                 <div class="form-group">
                                     <a type="submit" href="rentcar?id=<%= c.getId_car() %>" class="btn btn-secondary py-3 px-4">Rent Car Now</a>
			            </div>
                            </div>                    
            </div>
        </section>

        <section class="ftco-section ftco-no-pt bg-light">
    	<div class="container">
    		<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
            <h2 class="mb-2">Related Car</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="carousel-car owl-carousel">
    					<% for (Car rc : rcs){ %>
    					<div class="item">
    						<div class="car-wrap rounded ftco-animate">
		    					<div class="img rounded d-flex align-items-end" style="background-image: url(images/Car_Images/<%= rc.getImg()%>);">
		    					</div>
		    					<div class="text">
		    						<h2 class="mb-0"><a href="cardetails?id=<%= rc.getId_car() %>"><%= rc.getCar_name() %></a></h2>
		    						<div class="d-flex mb-3">
			    						<span class="cat"><%= cb.getName() %></span>
			    						<p class="price ml-auto"><%= rc.getPrice()%> <span>/day</span></p>
		    						</div>
		    						<p class="d-flex mb-0 d-block"><a  href="rentcar?id=<%= rc.getId_car() %>" class="btn btn-primary py-2 mr-1">Book now</a> <a  href="cardetails?id=<%= rc.getId_car() %>" class="btn btn-secondary py-2 ml-1">Details</a></p>
		    					</div>
		    				</div>
    					</div>
                                        <%} %>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
        <%@include file="public/footer.jsp" %>
    </body>
</html>