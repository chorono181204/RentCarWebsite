<%-- 
    Document   : login
    Created on : Oct 6, 2024, 3:25:59 PM
    Author     : Hacom
--%>
<% 
String username = (String) session.getAttribute("Adminusername");
    if (username == null) {
        username = "";
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Raleway:400,700');

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Raleway, sans-serif;
        }

        body {
            background: linear-gradient(90deg, #C7F4C5, #6BCC77);
        }

        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .screen {
            background: linear-gradient(90deg, #54A45D, #78B87C);
            position: relative;
            height: 600px;
            width: 360px;
            box-shadow: 0px 0px 24px #5C5696;
        }

        .screen__content {
            z-index: 1;
            position: relative;
            height: 100%;
        }

        .screen__background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 0;
            -webkit-clip-path: inset(0 0 0 0);
            clip-path: inset(0 0 0 0);
        }

        .screen__background__shape {
            transform: rotate(45deg);
            position: absolute;
        }

        .screen__background__shape1 {
            height: 520px;
            width: 520px;
            background: #FFF;
            top: -50px;
            right: 120px;
            border-radius: 0 72px 0 0;
        }

        .screen__background__shape2 {
            height: 220px;
            width: 220px;
            background: #63AC6C;
            top: -172px;
            right: 0;
            border-radius: 32px;
        }

        .screen__background__shape3 {
            height: 540px;
            width: 190px;
            background: linear-gradient(270deg, #54A45D, #679E6A);
            top: -24px;
            right: 0;
            border-radius: 32px;
        }

        .screen__background__shape4 {
            height: 400px;
            width: 200px;
            background: #7BB97E;
            top: 420px;
            right: 50px;
            border-radius: 60px;
        }

        .login {
            width: 320px;
            padding: 30px;
            padding-top: 156px;
        }

        .login__field {
            padding: 20px 0px;
            position: relative;
        }

        .login__icon {
            position: absolute;
            top: 30px;
            color: #7875B5;
        }

        .login__input {
            border: none;
            border-bottom: 2px solid #D1D1D4;
            background: none;
            padding: 10px;
            padding-left: 24px;
            font-weight: 700;
            width: 75%;
            transition: .2s;
        }

        .login__input:active,
        .login__input:focus,
        .login__input:hover {
            outline: none;
            border-bottom-color: #6A679E;
        }

        .login__submit {
            background: #fff;
            font-size: 14px;
            margin-top: 30px;
            padding: 16px 20px;
            border-radius: 26px;
            border: 1px solid #D4D3E8;
            text-transform: uppercase;
            font-weight: 700;
            display: flex;
            align-items: center;
            width: 100%;
            color: #4C489D;
            box-shadow: 0px 2px 2px #5C5696;
            cursor: pointer;
            transition: .2s;
        }

        .login__submit:active,
        .login__submit:focus,
        .login__submit:hover {
            border-color: #6A679E;
            outline: none;
        }

        .button__icon {
            font-size: 24px;
            margin-left: auto;
            color: #7875B5;
        }

        .social-login {
            position: absolute;
            height: 140px;
            width: 160px;
            text-align: center;
            bottom: 0px;
            right: 0px;
            color: #fff;
        }

        .social-icons {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .social-login__icon {
            padding: 20px 10px;
            color: #fff;
            text-decoration: none;
            text-shadow: 0px 0px 8px #7875B5;
        }

        .social-login__icon:hover {
            transform: scale(1.5);
        }
        .title_admin{
            font-family: 'Arial', sans-serif;
            color:#54A45D;
            font-size: 20px;
        }
         .error{
             color: #ff0000;
             font-size: 15px;
        }
    </style>
    <body>
<<<<<<< HEAD
        <div class="container">
            <div class="screen">
                <div class="screen__content">
                    <form action="./admin-login" class="login" method="POST">
                        <span class="title_admin">Admin Dashboard Login</span>
                        <% String message = (String) request.getAttribute("message");
                        %>
                        <% if (message != null) {%>
                        <div class="error">
                            <strong> <%= message%> </strong>
                        </div>
                        <% }%>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <input name="username" type="text" class="login__input" placeholder="User name / Email" value="<%=username%>">
                        </div>
                        <% String messageUsername = (String) request.getAttribute("messageUsername");
                        %>
                        <% if (messageUsername != null) {%>
                        <div class="error">
                            <strong> <%= messageUsername%> </strong>
                        </div>
                        <% }%>
                        <div class="login__field">
                            <i class="login__icon fas fa-lock"></i>
                            <input name="password" type="password" class="login__input" placeholder="Password">
                        </div>
                        <% String messagePassword = (String) request.getAttribute("messagePassword");
                        %>
                        <% if (messagePassword != null) {%>
                        <div class="error">
                            <strong> <%= messagePassword%> </strong>
                        </div>
                        <% }%>
                        <button class="button login__submit">
                            <span class="button__text">Log In Now</span>
                            <i class="button__icon fas fa-chevron-right"></i>
                        </button>				
                    </form>

                </div>
                <div class="screen__background">
                    <span class="screen__background__shape screen__background__shape4"></span>
                    <span class="screen__background__shape screen__background__shape3"></span>		
                    <span class="screen__background__shape screen__background__shape2"></span>
                    <span class="screen__background__shape screen__background__shape1"></span>
                </div>		
            </div>
        </div>
=======
        <h1>Đăng nhập</h1>
        <%
            if(request.getAttribute("error") != null){
                String er = (String)request.getAttribute("error");
        %>
        <h3 style="color: red"><%= er %></h3>
        <%
            }
        %>
        <form action="${pageContext.request.contextPath}/admin-login" method="post">
            Username:<input type="text" name="user"/><br/>
            Password:<input type="password" name="pass"/><br/>
            <input type="submit" value="SUBMIT"/><br/>
        </form>
>>>>>>> cbf9c38e23ebc147983d609d590171a08e08f53a
    </body>
</html>
