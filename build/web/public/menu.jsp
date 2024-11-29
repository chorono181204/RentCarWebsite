<%@page import="model.User"%>
<%@page import="java.util.List"%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="home" style="font-size:24px;">Car<span>Book</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
              <%// User user = (User) request.getAttribute("user"); %>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
                    <% 
                        String currentPage = request.getRequestURI();
                    %>
                    <li class="nav-item <%= currentPage.contains("home") ? "active" : currentPage %>"><a href="home" class="nav-link" style="font-size:18px;">Home</a></li>
                    <li class="nav-item <%= currentPage.contains("about") ? "active" : currentPage %>"><a href="about" class="nav-link" style="font-size:18px;">About</a></li>
                    <li class="nav-item <%= currentPage.contains("services") ? "active" : currentPage %>"><a href="services" class="nav-link" style="font-size:18px;">Services</a></li>
                    <li class="nav-item <%= currentPage.contains("pricing") ? "active" : currentPage %>"><a href="pricing" class="nav-link" style="font-size:18px;">Pricing</a></li>
                    <li class="nav-item <%= currentPage.contains("car") ? "active" : currentPage %>"><a href="car" class="nav-link" style="font-size:18px;">Cars</a></li>
                    <li class="nav-item <%= currentPage.contains("blog") ? "active" : currentPage %>"><a href="blog" class="nav-link" style="font-size:18px;">Blog</a></li>
                    <li class="nav-item <%= currentPage.contains("contact") ? "active" : currentPage %>"><a href="contact" class="nav-link" style="font-size:18px;">Contact</a></li>
                <% 
                    String sessionCheck = (String) session.getAttribute("Login");
                %>
                <% if (sessionCheck == null) { %>
                    <li class="nav-item"><a href="register" class="nav-link" style="font-size:18px;">Register</a></li>
                    <li class="nav-item"><a href="login" class="nav-link" style="font-size:18px;">Log in</a></li>
                <% } else { %>
                    <li class="nav-item <%= currentPage.contains("file") ? "active" : currentPage %>"><a href="file" class="nav-link" style="font-size:18px;">My Profile</a></li>
                    <a class="nav-link" style="font-size:18px;" href="logout">
                    Log out
                   </a>
                <% } %>

                  

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->