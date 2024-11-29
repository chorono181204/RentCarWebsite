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
    
    <ul>
     <li>
        <a  href="file" style="width:223px; height:48px; padding:10px;">
            <i class="fas fa-user">
            </i>
            My Information
        </a>
    </li>
     <li style="margin:25px 0;">
        <a href="rentinfor" style="
              width: 223px;
              height: 48px;
              padding-left: 11px;
          ">
         <i class="fas fa-file-text">
         </i>
          <span style="margin-top: 3px;">Rent Information</span>
        </a>
     </li>
     <li>
        <a href="changepassword" class="active" style="
            width: 223px;
            height: 48px;
            padding-left: 11px;
            background:#272d26;
        ">
            <svg style="width: 23px;margin-left: -6px;margin-right: 6px;" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 5.25a3 3 0 0 1 3 3m3 0a6 6 0 0 1-7.029 5.912c-.563-.097-1.159.026-1.563.43L10.5 17.25H8.25v2.25H6v2.25H2.25v-2.818c0-.597.237-1.17.659-1.591l6.499-6.499c.404-.404.527-1 .43-1.563A6 6 0 1 1 21.75 8.25Z" />
            </svg>
            <span>Change password</span>
        </a>
     </li>
   </div>
  <div class="cus-content" style="display: flex;
    align-items: center;
    justify-content: center;">
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
       

     <button type="submit" id="btn-change" style="background:#272d26;">
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