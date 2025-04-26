package com.FlexiWork;

import java.sql.*;

public class DataBaseConnectivity {

	// because of these three modifiers these are not accesible by outside peoples ,
	// final will be make variables constant, private will make it safe.
	private final static String url = "jdbc:mysql://localhost:3306/flexiwork";
	private final static String uname = "root";
	private final static String pass = "kanha@987";

	// hence we will get connection object publically without violate the private
	// data
	public static Connection getConncetionObject() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(url, uname, pass); // we will get Connection object
		
	}
	
}
