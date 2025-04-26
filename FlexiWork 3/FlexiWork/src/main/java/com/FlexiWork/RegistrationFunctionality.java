package com.FlexiWork;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
public class RegistrationFunctionality extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("fullname");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		String ph = req.getParameter("phone");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String role = req.getParameter("role");

		String uname = null;
		String exp = null;
		InputStream imageStream = null;
		String domain = null;

		// only worker data
		if (role.equals("workers")) {
			domain = req.getParameter("domain");
			uname = req.getParameter("username");
			exp = req.getParameter("experience");

			// making conversion on the image
			Part imagePart = req.getPart("image");
			if (imagePart != null) {
				imageStream = imagePart.getInputStream();
			}

		}

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		try {
			Connection conn = DataBaseConnectivity.getConncetionObject();

			// Validate role
			if (!role.equals("user") && !role.equals("workers")) {
				out.println("Invalid role.");
				return;
			}

			// Check if user already exists
			String sql = "SELECT * FROM " + role + " WHERE email = ? AND password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email); // using email
			pstmt.setString(2, pass);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				out.println("User already exists.");
				System.out.println("User data already available.");
			} else {
				// Register new user or worker
				if (role.equals("user")) {
					registerUser(conn, name, email, pass, ph, city, state, req, resp, role);
				} else {
					registerWorker(conn, uname, name, email, pass, ph, imageStream, domain, city, state, exp, req, resp,
							role);
				}
			}

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.println("Error: " + e.getMessage());
		}
	}

	// registration for user
	private void registerUser(Connection conn, String name, String email, String pass, String ph, String city,
			String state, HttpServletRequest req, HttpServletResponse resp, String role) {
		try {
			String insertSql = "INSERT INTO user (name, email, password, phone, city, state ) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(insertSql);
			st.setString(1, name);
			st.setString(2, email);
			st.setString(3, pass);
			st.setString(4, ph);
			st.setString(5, city);
			st.setString(6, state);

			int rowsInserted = st.executeUpdate();
			PrintWriter out = resp.getWriter();
			if (rowsInserted > 0) {
				out.println("User Registration Successful.");

				// making sessiom to store the data
				HttpSession session = req.getSession();

				// for user setting the attributes
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("phone", ph);
				session.setAttribute("city", city);
				session.setAttribute("state", state);

				resp.sendRedirect("index.jsp");

				System.out.println("User registered successfully.");
			} else {
				out.println("Registration failed.");
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// register for worker
	private void registerWorker(Connection conn, String uname, String name, String email, String pass, String ph,
			InputStream imageStream, String domain, String city, String state, String exp, HttpServletRequest req,
			HttpServletResponse resp, String role) {
		try {
			String insertSql = "INSERT INTO workers (username, name, email, password, phone, image, domain, city, state, experience) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement st = conn.prepareStatement(insertSql);
			st.setString(1, uname);
			st.setString(2, name);
			st.setString(3, email);
			st.setString(4, pass);
			st.setString(5, ph);

			if (imageStream != null) {
				st.setBlob(6, imageStream);
			} else {
				st.setNull(6, java.sql.Types.BLOB);
			}

			st.setString(7, domain);
			st.setString(8, city);
			st.setString(9, state);
			st.setString(10, exp);

			int rowsInserted = st.executeUpdate();
			PrintWriter out = resp.getWriter();
			if (rowsInserted > 0) {
				out.println("Worker Registration Successful.");

				// creating the sesion
				HttpSession session = req.getSession();

				// for user setting the attributes
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				session.setAttribute("phone", ph);
				session.setAttribute("city", city);
				session.setAttribute("state", state);
				session.setAttribute("experience", exp);
				
				resp.sendRedirect("index.jsp");
				System.out.println("Worker registered successfully.");
			} else {
				out.println("Registration failed.");
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
