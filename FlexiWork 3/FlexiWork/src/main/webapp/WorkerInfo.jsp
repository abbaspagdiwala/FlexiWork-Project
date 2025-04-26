<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String domain="Electrician";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Electrician Worker Card</title>
<link rel="stylesheet" href="CSS/WorkerInfo.css">
</head>
<body>

	<nav class="navbar">
		<div class="logo">FlexiWork - Electrician</div>
		<ul>
			<li><a style="color: white;" href="domain.jsp" class="btn">Back</a></li>
		</ul>
	</nav>
	<!-- Serach bar  -->
	<div class="search-bar-container"
		style="display: flex; justify-content: center; align-items: center; margin: 20px; gap: 10px;">
		<input type="text"
			placeholder="Search by Location : Mumbai, Pune, Lucknow, Indore..."
			class="search-input"
			style="width: 70%; padding: 12px 16px; font-size: 16px; border-radius: 8px; border: 1px solid #ccc; transition: box-shadow 0.3s ease;">

		<button class="search-button"
			style="padding: 12px 24px; font-size: 16px; border-radius: 8px; border: none; background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); color: white; cursor: pointer; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); transition: all 0.3s ease;"
			onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 6px 20px rgba(0, 0, 0, 0.2)'"
			onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 15px rgba(0, 0, 0, 0.1)'">
			🔍 Search</button>
	</div>

	<div class="worker-card">
		<img src="all_labours.jpg" alt="Electrician Photo" class="profile-img">
		<h2>John Doe</h2>
		<p class="title">Certified Electrician</p>
		<p>🔌 Residential & Commercial</p>
		<div class="skills">
			<span>Wiring</span> <span>Panel Repair</span> <span>Lighting</span>
		</div>
		<a href="ConfirmationPage.jsp"><button>Contact</button></a>
	</div>
</body>
</html>
