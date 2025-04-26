<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String username = request.getParameter("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Confirmation Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />

    <!-- Optional custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #2A71D0;
            color : white;
            padding: 1rem;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 1rem;
            margin: 0;
        }

        .navbar ul li {
            display: inline;
        }

        .navbar ul li a {
            text-decoration: none;
            color: white;
        }

        .footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 1rem;
            margin-top: 3rem;
        }

        #map {
            height: 400px;
            width: 100%;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar d-flex justify-content-between align-items-center">
        <div class="logo">FlexiWork</div>
        <ul class="d-flex">
            <li><a href="index.jsp" class="btn btn-outline-secondary">Home</a></li>
            <li><a href="domain.jsp" class="btn btn-outline-secondary">Domains</a></li>
            <li><a href="index.jsp" class="btn btn-outline-secondary">Logout</a></li>
        </ul>
    </nav>

    <!-- Confirmation Section -->
    <section class="features text-center my-5">
        <div class="container">
            <h2 class="text-success mb-4">🎉 Hiring Confirmed!</h2>

            <p class="lead">
                Thank you for hiring <strong><%= name %></strong>.
            </p>
            
            <p>
                He will contact you shortly. You can view all your bookings in
                your profile</a>.
            </p>

            <a href="index.jsp" class="btn btn-primary btn-lg mt-3">Back to Home</a>

            <!-- Google Map -->
            <div id="map" class="mt-5"></div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2025 FlexiWork. All rights reserved.</p>
    </footer>

    <!-- Google Maps Script -->
    <script>
        const worker = {
            name: "<%= name %>",
            latitude: 28.6139,
            longitude: 77.2090,
            id: "12345"
        };

        function initMap() {
            const workerLocation = {
                lat: worker.latitude,
                lng: worker.longitude
            };

            const map = new google.maps.Map(document.getElementById("map"), {
                zoom: 14,
                center: workerLocation
            });

            new google.maps.Marker({
                position: workerLocation,
                map: map,
                title: worker.name
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
    </script>
</body>
</html>
