<%
   
    String email = (String) session.getAttribute("newemail");
    if (email == null) {
        email = "";
    }
    String password = (String) session.getAttribute("newpassword");
    if (password == null) {
        password = "";
    }
    String confirmpassword = (String) session.getAttribute("newconfirmpassword");
    if (confirmpassword == null) {
        confirmpassword = "";
    }
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>
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
                    <form method="POST" action="./forgottenpassword" id="" >
                        <div class="login-form-content">
                           <span>Email : </span>
                            <div class="text-content-wrapper">
                                <input name="email" type="email" placeholder="Enter your email..." class="form-control" value="<%=email%>">
                            </div>
                            <% String messageEmail = (String) request.getAttribute("messageNewEmail");
                            %>
                            <% if (messageEmail != null) {%>
                            <div class="error">
                                <strong> <%= messageEmail%> </strong>
                            </div>
                            <% }%>
                            <span>Password : </span>
                            <div class="text-content-wrapper">
                                <input name="password" type="password" placeholder="Password" class="form-control" value="<%=password%>">
                            </div>
                            <% String messagePassword = (String) request.getAttribute("messageNewPassword");
                            %>
                            <% if (messagePassword != null) {%>
                            <div class="error">
                                <strong> <%= messagePassword%> </strong>
                            </div>
                            <% }%>
                            <span>Confirm Password : </span>
                            <div class="text-content-wrapper">
                                <input name="confirmpassword" type="password" placeholder="Confirm Password" class="form-control" value="<%=confirmpassword%>" > 
                            </div>
                            <% String messageConfirmPassword = (String) request.getAttribute("messageNewConfirmPassword");
                            %>
                            <% if (messageConfirmPassword != null) {%>
                            <div class="error">
                                <strong> <%= messageConfirmPassword%> </strong>
                            </div>
                            <% }%>
                            <div class="login-btn-container">
                                <button class="login-btn">Reset password</button>
                            </div>
                            <div class="hr"></div>             
                            <div class="create-new-account-btn-container">                
                                <a href="login" class="create-new-account-btn">Login Now</a>
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
</html>