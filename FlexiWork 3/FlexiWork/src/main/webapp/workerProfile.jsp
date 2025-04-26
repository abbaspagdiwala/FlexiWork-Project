<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String exp = request.getParameter("exp");
String rating = request.getParameter("rating");
String available = request.getParameter("available");
String location = request.getParameter("location");
String photo = request.getParameter("photo");
String username = request.getParameter("username"); //username of worker
String domain = request.getParameter("domain");
%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Worker Profile</title>
  <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

</head>
<body>
    

  <!-- Navbar -->
  <nav class="navbar">
    <div class="logo">FlexiWork</div>
    <ul>
      <li><a href="index.jsp" class="btn">Home</a></li>
      <li><a href="domain.jsp" class="btn">Domains</a></li>
      <li><a href="index.jsp" class="btn">Logout</a></li>
    </ul>
  </nav>

  
  <!-- Worker Detail Section -->
  <section class="features">
    <div class="container">
      <div class="row worker-detail">
        <!-- Worker Info -->
        <div class="col-md-4 d-flex flex-column align-items-center text-center mb-4">
            <img src="woker.png" alt="Worker Photo" class="worker-img rounded-circle mb-3">
            <h3 class="worker-name"><%= name %></h3>
            <p class="text-muted">Experience: <%= exp %> years</p>
          </div>
          

        <!-- Content -->
        <div class="col-md-8 worker-content">
          <h4>About : </h4>
          <p>${worker.description}</p>             <!-- DESCRIPTION -->

          <h4 class="mt-4">Skills</h4>				<!-- SKILLS -->
          <ul class="list-inline">
            <c:forEach var="skill" items="${worker.skills}">
              <li class="list-inline-item badge badge-primary p-2 m-1">${skill}</li>
            </c:forEach>
          </ul>

          <h4 class="mt-4">Ratings & Reviews</h4> <p> <strong><%= rating %>★</strong> based on ${worker.totalReviews} reviews  </p> <!-- totalReview Variable pass karna hoga -->

          <div class="mt-2 review-list">
            <c:forEach var="review" items="<%= rating %>">
              <div class="review">
                <p><strong>${review.username}:</strong> ${review.comment} ⭐<%= rating %></p>
              </div>
            </c:forEach>
          </div>
          <!--location-->
          <h4 class="mt-4">Location</h4>
<div id="map" style="width: 100%; height: 300px; border-radius: 8px;"></div>
<!--button-->
          <form action="hiringDataStore" method="post">
            <input type="hidden" name="username" value="<%= username %>"/> <!-- user ka email id jana chahiye  -->
            <input type="hidden" name="name" value="<%= name %>"/>
            <input type="hidden" name="location" value="<%= location %>"/>
            <input type="hidden" name="location" value="<%= domain %>"/>
            <button type="submit" class="btn btn-success btn-lg mt-4">Confirm Hiring</button>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; 2025 FlexiWork. All rights reserved.</p>
  </footer>

</body>
</html>