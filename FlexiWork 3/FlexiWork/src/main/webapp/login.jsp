<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>FlexiWork Login</title>
  <link rel="stylesheet" href="CSS/login.css">
</head>
<body>
  <div class="container">
    <div class="login-box">
      <div class="header">
        <h2>FlexiWork</h2>
      </div>
      
      <!-- Login Form -->
      <form id="loginForm" action="login" method="post">
        <div class="input-group">
          <label for="email">Email</label>
          <input type="email" id="email" placeholder="Enter your email" name="uname" required>
        </div>
        <div class="input-group">
          <label for="password">Password</label>
          <input type="password" id="password" placeholder="Enter your password" name="upassword" required>
        </div>

        <!-- Hidden input for role -->
        <input type="hidden" name="role" id="roleInput">
		<%
			String invalidMsg = (String)session.getAttribute("invalidMsg");
        	if(invalidMsg != null)
        	{
        	%>
        		<p style="color:red; text-align:center;"><%=invalidMsg%></p>
        	<%
        	session.removeAttribute("invalidMsg");
        	}
		%>
        <button type="submit" class="login-btn">Log In</button>
        <div class="links">
          <span>Don't have an account?</span>
          <a href="#" id="signUpLink">Sign Up</a>
        </div>
        
        <div class="links">
          <a href="forget.html" id="signUpLink">Forgot Password</a>
        </div>
      </form>
    </div>

    <!-- Right side animation or image -->
    <div class="animation-container">
      <div class="plant-animation">
        <img src="img/lab.png" alt="Illustration">
        <p>Hire Smart. Hire Fast. Find Skills Near You</p>
      </div>
    </div>
  </div>

  <!-- Login Role Modal -->
  <div class="modal" id="roleModal">
    <div class="modal-content">
      <h3>Login As</h3>
      <button type="button" class="modal-btn" onclick="submitWithRole('user')">User</button>
      <button type="button" class="modal-btn" onclick="submitWithRole('workers')">Worker</button>
    </div>
  </div>

  <!-- Sign Up Role Modal -->
  <div class="modal" id="signUpModal">
    <div class="modal-content">
      <h3>Sign Up As</h3>
      <button class="modal-btn" onclick="redirectToSignUp('user')">User</button>
      <button class="modal-btn" onclick="redirectToSignUp('workers')">Worker</button>
    </div>
  </div>

  <!-- Scripts -->
  <script>
    const form = document.getElementById('loginForm');
    const roleModal = document.getElementById('roleModal');
    const signUpModal = document.getElementById('signUpModal');
    const signUpLink = document.getElementById('signUpLink');
    const roleInput = document.getElementById('roleInput');

    // Intercept login form submission to show modal
    form.addEventListener('submit', function(e) {
      e.preventDefault();
      roleModal.style.display = 'flex';
    });

    // Submit form with selected role
    function submitWithRole(role) {
      roleInput.value = role;
      roleModal.style.display = 'none';
      form.submit();
    }

    // Show Sign Up modal
    signUpLink.addEventListener('click', function(e) {
      e.preventDefault();
      signUpModal.style.display = 'flex';
    });

    // Redirect to specific signup page
    function redirectToSignUp(role) {
      if (role === 'user') {
        window.location.href = 'registerForUser.html';
      } else {
        window.location.href = 'RegisterWorker.jsp';
      }
    }

    // Close modals if clicked outside
    window.onclick = function(e) {
      if (e.target === roleModal) {
        roleModal.style.display = 'none';
      }
      if (e.target === signUpModal) {
        signUpModal.style.display = 'none';
      }
    }
  </script>
</body>
</html>
