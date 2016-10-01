package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;

@WebServlet(urlPatterns="/UserCon")
public class UserController  extends HttpServlet{
	private static String INSERT_OR_EDIT = "/user_form.jsp";
	private static String LIST_USER = "/user_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String action = req.getParameter("action");
		String forward = "";
		UserDAO dao = new UserDAOImpl();
		
		if (action.equalsIgnoreCase("list")) {	
			List<UserEntity> list = dao.getAllUsers();
			req.setAttribute("users", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("U", "user_id", "user_tbl");
			req.setAttribute("user_id", generateID);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String user_id = req.getParameter("user_id");

			UserEntity user = dao.getUserById(user_id);
			req.setAttribute("userObject", user);

		}
		else if (action.equalsIgnoreCase("sendEmail")) {
			String result = null;
			Methods method = new Methods();
			//forward = INSERT_OR_EDIT;
			String email = req.getParameter("email");
			String first_name = req.getParameter("first_name");
			String subject = req.getParameter("subject");
			String message_body = req.getParameter("message_body");
			String MsgBody = "Hi " + first_name + "," 
                    +  " \n \n <strong>"+message_body + " </strong>"
                    + "\n \n (Dear valued customer this is a System Generated message)"
                    + " \n \n Thank you, \n System Administrator, \n Fit & Fun gym Management System";
			
			 result = method.sendMail(email, subject, MsgBody);
			 boolean res = false;
	if(result == "success"){
		res = true;
	}else {
		res = false;
	}
	try (PrintWriter out = resp.getWriter()) {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		out.print(res);

		out.flush();
		out.close();
		return;
	}

		}
		else if (action.equalsIgnoreCase("deactive")) {

			String userId = req.getParameter("user_id");
			boolean result =  dao.deactivateUser(userId);
			List<UserEntity> list = dao.getAllUsers();
			req.setAttribute("users", list);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.print(result);

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("active")) {

			String user_id = req.getParameter("user_id");
			 boolean result = dao.activate(user_id);
			 List<UserEntity> list = dao.getAllUsers();
			req.setAttribute("users", list);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.print(result);

				out.flush();
				out.close();
				return;
			}
		}
		
		if(forward!=""){
		RequestDispatcher view = req.getRequestDispatcher(forward);
		view.forward(req, resp);
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String userId = req.getParameter("user_id");
		String firstName = req.getParameter("first_name");
		String lastName = req.getParameter("last_name");
		String dob = req.getParameter("dob");
		String nic = req.getParameter("nic");
		String email = req.getParameter("email");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String mobileNumber = req.getParameter("mobile_number");
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
		
		UserDAO dao=new UserDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("U", "user_id", "user_tbl");
		
		boolean result=false;
		if (userId.equals(generateID)) {
			result=dao.addUser(user);
		} else {
			dao.updateUser(user);
		}
		PrintWriter out=resp.getWriter();
		
		out.print(result);

	}
	
}
