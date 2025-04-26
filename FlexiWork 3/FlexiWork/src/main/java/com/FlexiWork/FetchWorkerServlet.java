package com.FlexiWork;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//location based searching

public class FetchWorkerServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Map<String, Object>> workers = new ArrayList<>();
		
		PrintWriter out = resp.getWriter();
		String location = req.getParameter("location");
		String domain = req.getParameter("domain");
				
		try {
			Connection con = DataBaseConnectivity.getConncetionObject();
		
			if(domain.equals("Housecleaner")) {
				domain = "House Cleaner";
			}
			
			PreparedStatement st = con.prepareStatement(
				    "SELECT * FROM workers WHERE (LOWER(city)=? OR LOWER(state)=?) AND domain=?"
				);
				st.setString(1, location.toLowerCase());
				st.setString(2, location.toLowerCase());
				st.setString(3, domain);
			ResultSet result = st.executeQuery();
			
			while(result.next()) {

				Map<String, Object> worker = new HashMap<>();
                worker.put("name", result.getString("name"));
                worker.put("email", result.getString("email")); // Assuming the column is 'photo' and it's a URL or filename
                worker.put("phone", result.getString("phone"));
                worker.put("exp", result.getString("experience"));
                worker.put("rating", result.getString("rating"));
                worker.put("available", result.getString("available"));
                worker.put("username", result.getString("username"));
                // Add more fields as necessary
                
                workers.add(worker); // added to the list of workers
			}		
			
			// getting all workers data 
			// Check if the workers list is not empty and forward the request to JSP
			System.out.println("Total workers found: "+workers.size());
            if (!workers.isEmpty()) {
            	//if worker data is not empty it will save in jsp file as data
            	req.setAttribute("workers", workers);
                out.print(workers);
            } else {
            		throw new Exception("Not any worker found");
            }
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		for (Map<String, Object> w : workers) {
		    System.out.println(w);
		}

		
		// we pass important value before jump to the jsp file 
		req.setAttribute("location", location); // pass location to the jsp file
		req.setAttribute("domain", domain); // similarly domain we are passing
		
		if(domain.equals("House Cleaner")) {
			domain = "Housecleaner";
		}
		// in last pass all the data we fetch from the database to the jsp file 
		req.getRequestDispatcher(domain+".jsp").forward(req, resp);
	}
}
