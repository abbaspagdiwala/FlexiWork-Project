<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");
String phone = (String) session.getAttribute("phone");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Profile</title>
  <link rel="stylesheet" href="/static/css/style.css" />
  <link rel="stylesheet" href="CSS/userDashboard.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
</head>
<body>

<nav class="navbar">
  <div class="logo">FlexiWork</div>
  <ul>
    <li><a href="index.jsp" class="btn">Home</a></li>
    <li><a href="index.jsp" class="btn">Logout</a></li>
  </ul>
</nav>

<section class="features">
  <div class="container">
    <h2 class="text-center mb-4">👤 Your Profile</h2>

    <div class="card p-4 mb-5">
      <p>Name: <%= name %></p>
      <p>Email: <%= email %></p>
      <p>Phone: <%= phone %></p>
      
    </div>

    <h4>🛠️ Your Hiring History</h4>
    <c:if test="${empty hires}">
      <p>You haven’t hired anyone yet.</p>
    </c:if>
    <ul class="list-group">
      <c:forEach var="hire" items="${hires}">
        <li class="list-group-item">
          <strong>${hire.workerName}</strong> – ${hire.date}
        </li>
      </c:forEach>
    </ul>
  </div>
</section>

<footer class="footer">
  <p>&copy; 2025 FlexiWork</p>
</footer>

</body>
</html>
