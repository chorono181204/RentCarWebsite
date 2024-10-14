  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="home">Car<span>Book</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="home" class="nav-link">Home</a></li>
	          <li class="nav-item"><a href="about" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="services" class="nav-link">Services</a></li>
	          <li class="nav-item"><a href="pricing" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car" class="nav-link">Cars</a></li>
	          <li class="nav-item"><a href="blog" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
                  <% String sessionCheck=(String)session.getAttribute("Login");%>
                  <% if(sessionCheck==null){
                  %>
                   <li class="nav-item"><a href="register" class="nav-link">Register</a></li>
                    <li class="nav-item"><a href="login" class="nav-link">Log in</a></li>
                    <%
                        } else {%>
                    <li class="nav-item"><a href="file" class="nav-link">My Profile</a></li>
                    <%}%>
                    
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->