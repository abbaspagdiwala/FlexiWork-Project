package com.FlexiWork;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WorkerRegistrationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = (String) req.getParameter("username");
		String fullname = (String) req.getParameter("fullname");
		String email = (String) req.getParameter("email");
		String password = (String) req.getParameter("password");
		String ph = (String) req.getParameter("phone");
		String address = (String) req.getParameter("address");
		String domain = (String) req.getParameter("domain");
		String experience = (String) req.getParameter("experience");

		System.out.println(name);
		System.out.println(domain);
		try {
			Connection cn = DataBaseConnectivity.getConncetionObject();

			PreparedStatement insertStatement = cn.prepareStatement(
					"insert into workers (username, fullname, email, password, phone, address, domain, experience) values (?,?,?,?,?,?,?,?)");

			insertStatement.setString(1, name);
			insertStatement.setString(2, fullname);
			insertStatement.setString(3, email);
			insertStatement.setString(4, password);
			insertStatement.setString(5, ph);
			insertStatement.setString(6, address);
			insertStatement.setString(7, domain);
			insertStatement.setString(8, experience);

			insertStatement.executeUpdate();

			System.out.println("Inserted Data Successfully");

			// we need to add Cookie for storing the value of User and its Name for showing
			// in the profile icon section

			// maybe here we can use .jsp file for dynamic java code
			resp.sendRedirect("index.jsp");

		} catch (Exception e) {
			resp.sendRedirect("Error.html");
		}
	}
}
