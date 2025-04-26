<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>FlexiWork – Work That Fits Your Life</title>
  <link href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <!-- Navbar -->
  <% 
  	String email = (String) session.getAttribute("uname");
  	String role = (String) session.getAttribute("role");
  %>
  
  <header class="navbar">

    <div class="logo">FlexiWork</div>

    <i class="ri-menu-line menu-icon" id="menuBtn"></i>



    <nav class="nav-sidebar" id="sidebar">

      <i class="ri-close-line close-icon" id="closeBtn"></i>

      <a href="#home">Home</a>

      <a href="#choose">Features</a>

      <a href="domain.jsp">Explore Domains</a>

      <a href="#work">How It Works</a>

      <a href="contact.html">Contact</a>
      	<%
	      	if(email == null)
	      	{%>
	            <a href="login.jsp" class="btn">Login</a>
	      	<%
	      	}if("user".equals(role)){
	      	%>
	      		<form action="userDashBoard.jsp" method="post">
	      			<button><%= email %></button>
	      			<button><a href="logout" >LogOut</a></button>
	      			
	      			<input type="hidden" name="name" value="<%= email%>">
	      			
	      		</form>
			<%
	      	}if("workers".equals(role)){
			%>	      	
				<form action="workerDashBoard.jsp" method="post">
	      			<button><%= email %></button>
	      			<button><a href="logout">LogOut</a></button>
	      			
	      			<input type="hidden" name="name" value="<%= email%>">
	      		</form>		      			
	      	<%
	      	}
	    %>
      
    </nav>
  </header>

  <!-- Hero Section -->
  <section  class="hero" id="Home">
    <div class="hero-content" >
      <h1>Flexible Work. Real Opportunities.</h1>
      <p>FlexiWork connects skilled individuals to real-time, local jobs—fast and fair.</p>
      <a href="login.jsp" class="hero-btn">Get Started</a>
    </div>
  </section>

  <!-- Features -->
  <section class="features">
    <h2 class="flex-work">Why FlexiWork?</h2>
    <div class="feature-grid">
      <div class="feature-box">
        <h3>🧠 Skill-Based Matching</h3>
        <p>Instantly find people with the right skills nearby.</p>
      </div>
      <div class="feature-box">
        <h3>⏱ Flexible Hours</h3>
        <p>Work or hire by the hour. Maximum flexibility.</p>
      </div>
      <div class="feature-box">
        <h3>💸 Secure Payments</h3>
        <p>Pay safely after the task is completed and rated.</p>
      </div>
    </div>
  </section>

  <section class="choose__container" id="choose">
    <div class="choose__image">
        <img style="width:400px; height:300px; margin:auto auto;" src="img/lab.png" alt="choose"/">
    </div>
    
    <div class="choose__content">
        <h2 class="section__header" >Why choose us</h2>
        <p class="section__description">
            Discover the difference with our FlexiWork. We offer reliable
            job opportunities with low cost and easy navigation.
        </p>
        <div class="choose__grid" style="align-content:center; margin:auto auto;">
            <div class="choose__card">
                <span><i class="ri-customer-service-line"></i></span>
                <div>
                    <h4>Customer Support</h4>
                    <p>Our dedicated support team is available to assist you 24/7.</p>
                </div>
            </div>
            <div class="choose__card">
                <span><i class="ri-map-pin-line"></i></span>
                <div>
                    <h4>Many Locations</h4>
                    <p>
                        Convenient pick-up and drop-off locations to suit your travel
                        needs.
                    </p>
                </div>
            </div>
            <div class="choose__card">
                <span><i class="ri-wallet-line"></i></span>
                <div>
                    <h4>Best Price</h4>
                    <p>Enjoy competitive rates and great value for every rental.</p>
                </div>
            </div>
            <div class="choose__card">
                <span><i class="ri-user-star-line"></i></span>
                <div>
                    <h4>Self Drive</h4>
                    <p>Drive at your pace, your way chooses self-drive.</p>
                </div>
            </div>
            <div class="choose__card">
                <span><i class="ri-verified-badge-line"></i></span>
                <div>
                    <h4>Verified Brands</h4>
                    <p>Choose from trusted and well-maintained car brands.</p>
                </div>
            </div>
            <div class="choose__card">
                <span><i class="ri-calendar-close-line"></i></span>
                <div>
                    <h4>Free Cancellations</h4>
                    <p>Flexible bookings with free cancellation options.</p>
                </div>
            </div>
        </div>
    </div>
</section>

 <!-- How It Works -->
 <section class="how-it-works" id="work">
  <h2 class="section__work">How It Works</h2>
  <div class="steps">
    <div class="step">
      <h3>1. Post a Task</h3>
      <p>Describe the help you need and set time preferences.</p>
    </div>
    <div class="step">
      <h3>2. Match with Local Workers</h3>
      <p>FlexiWork suggests the best available workers nearby.</p>
    </div>
    <div class="step">
      <h3>3. Get It Done</h3>
      <p>Pay securely and rate the work after completion.</p>
    </div>
  </div>
</section>
  <!-- Footer -->
  <footer class="footer">
    <p>© 2025 FlexiWork • Designed by Team CodeCrafters</p>
    <p>
      <a href="term.html">Privacy</a> 
      <a href="term.html">Terms</a> 
      <a href="contact.html">Contact</a>
    </p>
  </footer>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <script src="https://unpkg.com/scrollreveal"></script>
  
  <script>

  // show option in log in button 
  //top
    const menuBtn = document.getElementById('menuBtn');
    const closeBtn = document.getElementById('closeBtn');
    const sidebar = document.getElementById('sidebar');

    menuBtn.onclick = () => sidebar.classList.add('show');
    closeBtn.onclick = () => sidebar.classList.remove('show');

    // Optional: Hide menu on link click (mobile only)
    document.querySelectorAll('.nav-sidebar a').forEach(link => {
      link.addEventListener('click', () => {
        if (window.innerWidth < 768) sidebar.classList.remove('show');
      });
    });
    
  const scrollRevealOption = {
    distance: "60px",
    duration: 1000,
    delay: 300,
    reset: false
  };

  ScrollReveal().reveal(".hero h1", { ...scrollRevealOption, origin: "top" });
  ScrollReveal().reveal(".hero p", { ...scrollRevealOption, delay: 500 });
  ScrollReveal().reveal(".hero-btn", { ...scrollRevealOption, delay: 800, origin: "bottom" });



  // ScrollReveal.js

  ScrollReveal().reveal(".choose__image img", {
    ...scrollRevealOption,
    origin: "left",
  });

  ScrollReveal().reveal(".choose_content .section_header", {
    ...scrollRevealOption,
    delay: 500,
  });

  ScrollReveal().reveal(".choose_content .section_description", {
    ...scrollRevealOption,
    delay: 1000,
  });

  ScrollReveal().reveal(".choose__card", {
    duration: 1000,
    delay: 1500,
    interval: 500,
   });

   // scrollRevealOptionl1
  ScrollReveal().reveal(".section__work", { ...scrollRevealOption, origin: "top" });
  ScrollReveal().reveal(".step", { ...scrollRevealOption, interval: 200, origin: "bottom" });

  //work-flex

  ScrollReveal().reveal(".feature-box", { ...scrollRevealOption, interval: 200, origin: "bottom" });
  ScrollReveal().reveal(".flex-work", { ...scrollRevealOption, origin: "top" });
  
  
  
  </script>
  
</body>
</html>
