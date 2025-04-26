package com.FlexiWork;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class checkPositionServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String role = req.getParameter("role");
		
		role = role.toLowerCase();
		
		if(role.equals("user")) {
			resp.sendRedirect("registerForUser.html");			
		}
		else if(role.equals("worker")) {
			resp.sendRedirect("register.html");
		}
		else {
			resp.sendRedirect("Error.html");
		}
	}
}
