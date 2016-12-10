package com.bit.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;
import com.bit.util.Methods;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;



/******************************************
* Author : Amanda Shalika
* Description : User COntroller
* Created Date : 04/03/2016
* Last modified Date : 05/10/2016
*******************************************/

@WebServlet(urlPatterns="/UserCon")
public class UserController  extends HttpServlet{
	private static String INSERT_OR_EDIT = "/user_form.jsp";
	private static String LIST_USER = "/user_list.jsp";
	private static String MEMBER_LIST = "/all_member_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String action = req.getParameter("action");
		String forward = "";
		UserDAO dao = new UserDAOImpl();
		
		if (action.equalsIgnoreCase("list")) {	
			List<UserEntity> list = dao.getAllUsers(); // get every user role in to an array list
			req.setAttribute("users", list);
			forward = LIST_USER;

		}else if(action.equalsIgnoreCase("member_list")) {	
			List<UserEntity> list = dao.getAllMemberUsers();
			req.setAttribute("users", list);
			forward = MEMBER_LIST;

		}
		
		else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods(); // generate the new User id 
			String generateID = method.generateID("U", "user_id", "user_tbl");
			req.setAttribute("user_id", generateID);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String user_id = req.getParameter("user_id");

			UserEntity user = dao.getUserById(user_id);
			req.setAttribute("userObject", user);

		}
		/* this method is used to check the existing mails are entered   
		 * register users, if exist boolean result will be true.
		 * */
		 else if (action.equalsIgnoreCase("checkExistingMail")) {
				String email = req.getParameter("email");
					boolean result = false;
					result = dao.UserEmailChecker(email);
					try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.print(result);

					out.flush();
					out.close();
					return;
				}

			}
		/* use to check the existing ID card numbers are entering, if existing id value 
		 * entered method will return false */
		 else if (action.equalsIgnoreCase("UserIdChecker")) {
			
				String nic = req.getParameter("nic");
					boolean result = false;
					result = dao.UserIdChecker(nic);
					try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.print(result);

					out.flush();
					out.close();
					return;
				}

			}
		
		/* this method is used to send mails to user in user_list.jsp page 
		 * as parameters subject, message_body have to be send manually*/
		else if (action.equalsIgnoreCase("sendEmail")) {
			boolean result = false;
			Methods method = new Methods();
			//forward = INSERT_OR_EDIT;
			String email = req.getParameter("email");
			String first_name = req.getParameter("first_name");
			String subject = req.getParameter("subject");
			String message_body = req.getParameter("message_body");
			String MsgBody = "Hi " + first_name + "," 
                    +  " \n \n "+message_body + " "
                    + "\n \n (Dear valued customer this is a System Generated message)"
                    + " \n \n Thank you, \n System Administrator, \n Fit & Fun Gym Management System";
			
			 result = method.sendMail(email, subject, MsgBody);
			
	
	try (PrintWriter out = resp.getWriter()) {
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");

		out.print(result);

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
		/* uses to generate barcodes for registered members*/
		else if (action.equalsIgnoreCase("barcode")) {

			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/barcode_generate.jasper"));// report.jrxml folder contains the source file
				Map parameters = new HashMap();
				
				String root = getServletContext().getRealPath("\\uploads\\");
				System.out.println(root);
				String user_id=req.getParameter("user_id");
				parameters.put("user_id", user_id);
				parameters.put("image_path", root+"\\"+user_id+".jpg");

				byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getAbsolutePath(), parameters, con);

				resp.setContentType("application/pdf");
				resp.setContentLength(bytes.length);
				ServletOutputStream outstream = resp.getOutputStream();
				outstream.write(bytes, 0, bytes.length);
				outstream.flush();
				outstream.close();

			} catch (JRException ex) {
				ex.printStackTrace();
			}
		}
		
		if(forward!=""){ // used to redirect to pages
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
		System.out.println("thisis test :" +user.getRole());
		UserDAO dao=new UserDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("U", "user_id", "user_tbl");
		int result_int ;
		boolean result=false;
		if (userId.equals(generateID)) {
			result=dao.addUser(user);
			 result_int = 1;
		} else {
			dao.updateUser(user);
			 result_int = 2;
		} 
		PrintWriter out=resp.getWriter();
		
		out.print(result_int);

	}
	
}
