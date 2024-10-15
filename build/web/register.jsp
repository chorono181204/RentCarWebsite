<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        name = "";
    }
    String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "";
    }
    String email = (String) session.getAttribute("email");
    if (email == null) {
        email = "";
    }
    String password = (String) session.getAttribute("password");
    if (password == null) {
        password = "";
    }
    String confirmpassword = (String) session.getAttribute("confirmpassword");
    if (confirmpassword == null) {
        confirmpassword = "";
    }
    String dob = (String) session.getAttribute("dob");
    if (dob == null)
        dob = "";
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
                    <form method="POST" action="./register" id="" >
                        <div class="login-form-content">
                            <span>Full name : </span>
                            <div class="text-content-wrapper">
                                <input name="name" type="text" placeholder="Enter your name..." class="form-control" value="<%=name%>">
                            </div>
                            <% String messageName = (String) request.getAttribute("messageName");
                            %>
                            <% if (messageName != null) {%>
                            <div class="error">
                                <strong> <%= messageName%> </strong>
                            </div>
                            <% }%>
                            <span>Email : </span>
                            <div class="text-content-wrapper">
                                <input name="email" type="email" placeholder="Enter your email..." class="form-control" value="<%=email%>">
                            </div>
                            <% String messageEmail = (String) request.getAttribute("messageEmail");
                            %>
                            <% if (messageEmail != null) {%>
                            <div class="error">
                                <strong> <%= messageEmail%> </strong>
                            </div>
                            <% }%>
                            <span>Date of birth : </span>
                            <div class="text-content-wrapper">
                                <input name="dob" type="date" placeholder="" class="form-control" value="<%=dob%>">
                            </div>
                            <% String messageDob = (String) request.getAttribute("messageDob");
                            %>
                            <% if (messageDob != null) {%>
                            <div class="error">
                                <strong> <%= messageDob%> </strong>
                            </div>
                            <% }%>
                            <span>Username : </span>
                            <div class="text-content-wrapper">
                                <input name="username" type="text" placeholder="Enter your username..." class="form-control" value="<%=username%>">
                            </div>
                            <% String messageUsername = (String) request.getAttribute("messageUsername");
                            %>
                            <% if (messageUsername != null) {%>
                            <div class="error">
                                <strong> <%= messageUsername%> </strong>
                            </div>
                            <% }%>
                            <span>Password : </span>
                            <div class="text-content-wrapper">
                                <input name="password" type="password" placeholder="Password" class="form-control" value="<%=password%>">
                            </div>
                            <% String messagePassword = (String) request.getAttribute("messagePassword");
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
                            <% String messageConfirmPassword = (String) request.getAttribute("messageConfirmPassword");
                            %>
                            <% if (messageConfirmPassword != null) {%>
                            <div class="error">
                                <strong> <%= messageConfirmPassword%> </strong>
                            </div>
                            <% }%>
                            <div class="login-btn-container">
                                <button class="login-btn">Register</button>
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