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
              String messageConfirmPassword = (String) request.getAttribute("messageNewConfirmPassword");
             
   %>
    <section class="ftco-section contact-section">
      <div class="container">
       

    <div class="cus-container">
   <div class="cus-sidebar">
    
    <h2>
    <strong><%= us.getName() %></strong> 
    </h2>
    <h3>
        <strong>My Account</strong>
    </h3>
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
    <a class="logout" href="logout">
     Log out
    </a>
   </div>
  <div class="cus-content">
    <h2>
        <strong>
    Change password
        </strong>
    </h2>
        
        <% if (messageConfirmPassword != null) {%>
                <div class="error">
                    <strong> <%= messageConfirmPassword%> </strong>
                </div>
         <% }%>
       <div class="col-7">
       <div class="main-content-change ">
    <form action="" method="POST">
     
     <label for="new-password">
      New password *
     </label>
     <input id="password" name="new-password" type="password" required="required"/>
     <label for="confirm-password">
      Confirm new password *
     </label>
     <input  name="confirm-password" type="password" required="required" />
       

     <button type="submit" id="btn-change">
      Change password
     </button>
    </form>
   </div>
       </div>
   </div>
  </div>
      </div>
    </section>
	

   <%@include file="public/footer.jsp" %>
    
  

  <!-- loader -->
  
    
  </body>
</html>