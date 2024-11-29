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
             Integer rt =(Integer) request.getAttribute("count");
             
   %>
    <section class="ftco-section contact-section">
      <div class="container">
       

    <div class="cus-container">
   <div class="cus-sidebar">
    
    <ul>
     <li>
      <a class="active" href="file">
       <i class="fas fa-user">
       </i>
       Information
      </a>
     </li>
     <li>
      <a href="rentinfor">
       <i class="fas fa-file-text">
       </i>
       Rental Information
      </a>
     </li>
    </ul>
    <ul>
     <li>
     </li>
    </ul>
   </div>
   <div class="cus-content">
    <h2>
        <strong>
     Information
        </strong>
    </h2>
    <div class="info">
     <div>
      <span>
       Name
      </span>
      <strong>
       <%= us.getName() %>
      </strong>
         
     </div>
    </div>
    <div class="info">
     <div>
      <span>
       Email
      </span>
      <strong>
      <%= us.getEmail()%>
      </strong>
     </div>
    </div>
    <div class="info">
     <div>
      
     </div>
    </div>
    <div class="info">
     <div>
      <span>
       Date of birth
      </span>
      <strong>
        <%= us.getDate_of_bird()%>
      </strong>
     </div>
    </div>
       <div class="info">
     <div>
      <span>
       Number of rented cars
      </span>
      <strong>
       <%= rt %>
      </strong>
     </div>
    </div>
    <div class="buttons" >
        <a href="changepassword">
     <button  >
      Change password
     </button>
        </a>
    </div>
   </div>
  </div>
      </div>
    </section>
	

   <%@include file="public/footer.jsp" %>
    
  

  <!-- loader -->
  
    
  </body>
</html>