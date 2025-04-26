package com.FlexiWork;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// check log in user/worker data 

public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String role = req.getParameter("role");
		String myname = req.getParameter("uname"); //email
		String mypass = req.getParameter("upassword");
//		String name = req.getParameter("");
		PrintWriter out = resp.getWriter();
		
		boolean userExists = false;

		try {

		    Connection conn = DataBaseConnectivity.getConncetionObject(); // we get the object

		    String sql = "SELECT * FROM " + role + " WHERE email = ? AND password = ?";
		    
		    PreparedStatement pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, myname);
		    pstmt.setString(2, mypass);

		    ResultSet rs = pstmt.executeQuery();
		  //now here add session for this data 
	        HttpSession session = req.getSession();
	        
		    if (rs.next()) {
		        userExists = true;
		        PreparedStatement st = conn.prepareStatement("insert into loginActivity values (?,?,?)"); //email, pass, role
		        st.setString(1, myname);
		        st.setString(2, mypass);
		        st.setString(3, role);
		    
		        st.executeUpdate();
		        
		        System.out.println("User data inserted to loginActivity Succesfully");           
		       
		        // send redirect to home page 
		        resp.sendRedirect("index.jsp");
		        
		        if(myname != null && mypass != null)
		        {
		        	 session.setAttribute("uname",myname);
				     session.setAttribute("role",role);
		        }else {
		        	session.setAttribute("invalidMsg","Invalid user email or password");
		    	    resp.sendRedirect("login.jsp");
		    	 
		        }
		    }
		    else {
		    	session.setAttribute("invalidMsg","Invalid user email or password");
	    	    resp.sendRedirect("login.jsp");
		    }
		    
		    rs.close();
		    pstmt.close();
		    conn.close();

		} catch (Exception e) {
			out.println("<h3>Database Error: " + e.getMessage() + "</h3>");
		    e.printStackTrace();
		}
		
  }
}
