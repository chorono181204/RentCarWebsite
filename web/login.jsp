<% 
String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "";
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
  <style>
/*        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }*/
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
         
           
        }
        #login-form {
            border: 1px solid #ccc;
            padding: 40px 20px;
            display: block;
            border-radius: 5px;
        }
        .form-control {
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 17px;
            padding: 14px 16px;
            width: 364px;
            box-sizing: border-box;
            margin-bottom: 16px;
        }
        .login-btn {
            background-color: #1877f2;
            border: none;
            border-radius: 6px;
            font-size: 20px;
            line-height: 48px;
            padding: 0 16px;
            width: 366px;
            color: white;
            cursor: pointer;
            display: inline-block;
        }
        .forget-password {
            color: #247cee;
            margin-top: 16px;
            text-decoration: none;
            text-align: center;
            display: block;
            font-size: 14px;
        }
        .hr {
            border-top: 1px solid #ccc;
            margin: 22px 0;
        }
        .create-new-account-btn-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .create-new-account-btn {
            background-color: #42b72a;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 17px;
            line-height: 48px;
            padding: 0 16px;
            cursor: pointer;
            display: inline-block;
            text-decoration: none;
        }
        .error{
             color: #ff0000;
             font-size: 15px;
        }
    </style>
   <%@include file="public/header.jsp" %>
  <body>
    
	 <%@include file="public/menu.jsp" %>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
     
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
         
          </div>
        </div>
      
    </section>

    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">       	
         
       <div class="container">
        <form method="POST" action="./login" id="login-form">
            <div class="login-form-content">
                <% String message=(String) request.getAttribute("message");               
                %>
                <% if(message!=null){ %>
                <div class="alert alert-danger">
                <strong> <%= message  %> </strong>
                </div>
                <% }%>
                <span>Username : </span>
                <div class="text-content-wrapper">
                    <input name="username" type="text" placeholder="Enter your username..." class="form-control" value="<%=username%>">
                </div>
                 <% String messageUsername=(String) request.getAttribute("messageUsername");               
                %>
                <% if(messageUsername!=null){ %>
                <div class="error">
                <strong> <%= messageUsername  %> </strong>
                </div>
                <% }%>
                <span>Password : </span>
                <div class="text-content-wrapper">
                    <input name="password" type="password" placeholder="Password" class="form-control">
                </div>
                 <% String messagePassword=(String) request.getAttribute("messagePassword");               
                %>
                <% if(messagePassword!=null){ %>
                <div class="error">
                <strong> <%= messagePassword  %> </strong>
                </div>
                <% }%>
                <div class="login-btn-container">
                    <button class="login-btn">Log in</button>
                </div>
                <a href="forgottenpassword" class="forget-password">Forgotten password?</a>
                <div class="hr"></div>               
                <div class="create-new-account-btn-container">                
                     <a href="register" class="create-new-account-btn">Register</a>
                </div>
                
            </div>
        </form>
    </div>
          </div>
     
     
      </div>
    </section>
	

   <%@include file="public/footer.jsp" %>
    
  

  <!-- loader -->
  
    
  </body>
</head>
</html>