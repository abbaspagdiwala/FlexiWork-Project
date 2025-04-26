<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.List, java.util.Map"%>

<%

%>
<!--file name : domain_cards.html-->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Domains</title>
<link rel="stylesheet" href="CSS/Electrician.css">
</head>
<body>
	<nav class="navbar">
		<div class="logo">FlexiWork - House Cleaner</div>
		<ul>
			<li><a style="color: white;" href="domain.jsp" class="btn">Back</a></li>
		</ul>
	</nav>

	<!-- Serach bar  -->
	<form action="SearchByLocation" method="post">
		<div class="search-bar-container"
			style="display: flex; justify-content: center; align-items: center; margin: 20px; gap: 10px;">

			<input type="text"
				placeholder="Search by City : Mumbai, Pune, Lucknow, Indore..."
				class="search-input" name="location"
				style="width: 70%; padding: 12px 16px; font-size: 16px; border-radius: 8px; border: 1px solid #ccc; transition: box-shadow 0.3s ease;">

			<input type="hidden" name="domain" value="Housecleaner" />
			
			<button class="search-button"
				style="padding: 12px 24px; font-size: 16px; border-radius: 8px; border: none; background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); color: white; cursor: pointer; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); transition: all 0.3s ease;"
				onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 6px 20px rgba(0, 0, 0, 0.2)'"
				onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 15px rgba(0, 0, 0, 0.1)'">
				Search</button>
		</div>

	</form>





	<%
	List<Map<String, Object>> workers = (List<Map<String, Object>>) request.getAttribute("workers");

	if (workers != null && !workers.isEmpty()) {
		for (Map<String, Object> worker : workers) {
	%>
	<!-- Add more cards as needed -->
	<div class="card-container">
	<div class="workers-content">
		<div class="worker-card">
			
			<h2><%=worker.get("name")%></h2>
			<p class="title">Expert House Cleaner</p>
			<p> Residential & Commercial</p>
			<div class="skills">
				<span> Dusting & Sweeping </span> <span> Mopping & Vacuuming</span> <span>Kitchen Cleaning</span> <span>Bathroom Sanitization</span>
			</div>

			<p>
				Location:
				<%=request.getAttribute("location")%>
			</p>

			<p class="title">
				Experience :
				<%=worker.get("exp")%></p>
			<p class="title">
				Rating :
				<%=worker.get("rating")%>
			</p>

			<p class="title">
				Status :
				<%
			if ("1".equals(worker.get("available").toString())) {
			%>
				Online
				<%
			} else {
			%>
				Offline
				<%
			}
			%>
			</p>
			<form action="workerProfile.jsp" method="post"
					style="margin-top: 10px;">
					<input type="hidden" name="name" value="<%=worker.get("name")%>">
					<input type="hidden" name="exp" value="<%=worker.get("exp")%>">
					<input type="hidden" name="username" value="<%=worker.get("username")%>">
					<input type="hidden" name="rating" value="<%=worker.get("rating")%>">
					<input type="hidden" name="available" value="<%=worker.get("available")%>"> 
					<input type="hidden" name="location" value="<%=request.getAttribute("location")%>">
					<input type="hidden" name="photo" value="<%=worker.get("photo")%>">
					<input type="hidden" name="field" value="House Cleaner">
					<button type="submit">Contact</button>
				</form>
		</div>
		</div>
	</div>
	<%
	}
	} else {
	%>
	<p>No workers available now</p>
	<%
	}
	%>

	<!-- You can duplicate this block or use JavaScript to generate dynamically -->
	

	<footer class="footer">
		<p>© 2025 FlexiWork • Designed by Team CodeCrafters</p>
	</footer>
</body>
</html>