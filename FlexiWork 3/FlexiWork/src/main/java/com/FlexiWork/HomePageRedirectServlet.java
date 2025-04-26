package com.FlexiWork;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class HomePageRedirectServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		// i want to fetch data of login information
		String uname = (String) req.getParameter("uname");
		String pass = (String) req.getParameter("upassword");

		System.out.println("Uname is : " + uname);
		System.out.println("Password is : " + pass);
		
		
		

		// also add cookie here 
		
		
		
		
		
		
		// storing data in login table
		try {
			Connection cn = DataBaseConnectivity.getConncetionObject(); // we'll be get connection object

			// now store the data
			PreparedStatement st = cn.prepareStatement("select * from ? where email=? and pass");
			
			System.out.println("Information Stored succesfully");

		} 
		catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e);
		}
		catch(Exception ex) {
			System.out.println(ex);
		}
		
		
//		Cookie cokkies = resp.addCookie(uname);
		resp.sendRedirect("index.jsp");
		out.print("Succesfully login");
	}
}
