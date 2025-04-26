<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%@ page import="java.sql.*" %>

<%
	Connection con = null;
	PreparedStatement st = null;
	String jdbcURL = "jdbc:mysql://localhost:3306/flexiwork";
    String dbUser = "root";
    String dbPass = "kanha@987";
    ResultSet rs = null;
    
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");		
		con = DriverManager.getConnection(jdbcURL, dbUser, dbPass);
        st = con.prepareStatement("SELECT * FROM workers WHERE category='Electrician'");
        rs = st.executeQuery();
	}
	catch(Exception e){
		
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>DBConnection</title>
	
</head>

<body>
	<p>Db connections</p>
</body>
</html>
