package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.FrontRegisterDAO;
import com.bit.dao.FrontRegisterDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;


@WebServlet(urlPatterns="/FRegisterCon")
public class FrontRegistrationController extends HttpServlet{
	private static String INSERT_OR_EDIT = "/register_front.jsp";
	private static String LIST_USER = "/user_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String forward = "";
		
		if (action.equalsIgnoreCase("insert")) {	
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("U", "user_id", "user_tbl");
			req.setAttribute("user_id", generateID);
		}
		
			if(forward!=""){
				RequestDispatcher view = req.getRequestDispatcher(forward);
				view.forward(req, resp);
				}
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String userId = req.getParameter("user_id");
		String firstName = req.getParameter("first_name");
		String lastName = req.getParameter("last_name");
		String dob = req.getParameter("dob");
		String nic = req.getParameter("nic");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		Integer mobileNumber = Integer.parseInt(req.getParameter("mobile_number"));
		String role = req.getParameter("role");
		Integer marital_status=Integer.parseInt(req.getParameter("status"));
		
		String forward = "";
		UserEntity user = new UserEntity();
		System.out.println("DOB:"+dob);
		
		
		 SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD");
	        java.util.Date parsed = null;
			
				try {
					parsed =  format.parse(dob);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
	        java.sql.Date sql_date = new java.sql.Date(parsed.getTime());
		System.out.println(sql_date);
		user.setUser_id(userId);
		user.setFirst_name(firstName);
		user.setLast_name(lastName);
		user.setDob(sql_date);
		user.setNic(nic);
		user.setEmail(email);
		user.setGender(gender);
		user.setAddress(address);
		user.setMobile_number(mobileNumber);
		user.setRole(role);
		user.setMarital_status(marital_status);
		
		FrontRegisterDAO dao=new FrontRegisterDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("U", "user_id", "user_tbl");
		
		boolean result=false;
		if (userId.equals(generateID)) {
			result=dao.addUserFront(user);
			result = true;
		} else {
			
			result = false;
		} 
		PrintWriter out=resp.getWriter();
		
		out.print(result);
	}
}
