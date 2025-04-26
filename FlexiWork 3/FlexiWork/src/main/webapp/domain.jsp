<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--file name : domain_cards.html-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Domains</title>
  <link rel="stylesheet" href="CSS/domain.css">
</head>
<body>
    <nav class="navbar">
        <div class="logo">FlexiWork</div>
        <ul>
          <li><a style="color: white;" href="index.jsp" class="btn">Back</a></li>
        </ul>
      </nav>
  <div class="container">
    <header>
      <h1>Explore Our Domains my JSP</h1>
      <div class="search-section">
        <input type="text" placeholder="Search for domains..." id="search-bar" onkeydown="enterButtonFun(event)">
        <button class="btn" onclick="alert('Temporary Service is not available');" >Search</button>
      </div>
    </header>

    <main>
      <section class="domain_cards">
        <!-- Live images -->
        <div class="card_of_domain">
          <a href="Electrician.jsp">
          <img src="img/electrician.jpg" alt="Electrician domain">
        </a> 
        <p>Electrician</p>
        </div>
        <div class="card_of_domain">
         <a href="Plumber.jsp"> <img src="img/portrait-plumber-cartoon-style.jpg" alt="Outdoor Plant">
           </a> 
           <p>Plumber</p>
        </div>
        <div class="card_of_domain">
        <a href="Carpenter.jsp">
          <img src="img/carpenter.jpg"alt="Bonsai">
        </a> 
          <p>Carpenter</p>
        </div>
        <div class="card_of_domain">
          <a href="Housecleaner.jsp">
            <img src="img/housecleaner.jpg" alt="Succulent">
          </a> 
          <p>House Cleaner</p>
        </div>
        <div class="card_of_domain">
         <a href="driver.jsp">
          <img src="img/driver.jpg" alt="Garden Plant">
          </a>
          <p>Driver</p>
        </div>
      </section>
    </main>

  </div> 
<div class="button-container">
  <button class="show-more-button" onclick="
  	alert('Temporary Service is not available');
  " style="margin: auto;">Show more</button>
  <script src="exploreButton.js"></script>
</div>
<footer class="footer">
  <p>© 2025 FlexiWork • Designed by Team CodeCrafters</p>
</footer>
</body>
</html>