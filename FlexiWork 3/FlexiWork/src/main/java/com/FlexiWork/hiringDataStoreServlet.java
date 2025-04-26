package com.FlexiWork;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class hiringDataStoreServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//we will need the user -> username , worker -> email, location -> worker, date already set by default 
		String userEmail = (String) req.getParameter("username");
		String worker = (String) req.getParameter("name");
		String location = (String) req.getParameter("location");
		String domain = (String) req.getParameter("field");
		
		System.out.println("Hiring servlet called ");
		
		//Set it in database 
		try {
			Connection con = DataBaseConnectivity.getConncetionObject();
			
			PreparedStatement st = con.prepareStatement("insert into confirmHiring(owner, worker, location) values (?, ?, ?)");
			st.setString(1, userEmail);
			st.setString(2, worker);
			st.setString(3, location);
			
			st.executeUpdate(); // succesfully inserted data to the database 
			System.out.println("Successfully Inserted hiring details.");
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("ConfirmationPage.jsp");
		rd.forward(req, resp);
	}
}
