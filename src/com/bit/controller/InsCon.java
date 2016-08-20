package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.InsDAO;
import com.bit.dao.InsDAOImpl;
import com.bit.dao.MasterDataDAO;
import com.bit.dao.MasterDataDAOImpl;
import com.bit.entity.InsEntity;

import com.google.gson.Gson;


@WebServlet(urlPatterns="/InsCon2")
public class InsCon extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String action = req.getParameter("action");
		String forward = "";
		InsDAO dao = new InsDAOImpl();

		
		 if (action.equalsIgnoreCase("users")) {
				
				List<InsEntity> ins = dao.getAllInstructors();
				Gson gson = new Gson();

				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

				
				out.write("{ \"record\":" + new Gson().toJson(ins) + "}");
				
					out.flush();
					out.close();
					return;
				}
			}
		 
		 
		 else if (action.equalsIgnoreCase("user_details")) {
				String userId=req.getParameter("ins_id");
				InsEntity ins = dao.getUserById(userId);
				Gson gson = new Gson();

				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

				
					out.write("{ \"record\":" + new Gson().toJson(ins) + "}");

					out.flush();
					out.close();
					return;
				}
		// TODO Auto-generated method stub
		
	}
	
} 
	
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	super.doPost(req, resp);
	
	
	String loc = req.getParameter("location");
	System.out.println("location " + loc);
	if(loc == "paris"){
		MasterDataDAO dao  = new MasterDataDAOImpl();
		String product = dao.getdata();
	
	Gson gson = new Gson();

	try (PrintWriter out = resp.getWriter()) {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
	
		out.write("{ \"record\":" + new Gson().toJson(product) + "}");

		out.flush();
		out.close();
		return;
	}
	}
}

}
