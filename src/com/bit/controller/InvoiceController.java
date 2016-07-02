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

import com.bit.dao.MemberDAO;
import com.bit.dao.MemberDAOImpl;
import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.MemberEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns="/InvoiceCon")
public class InvoiceController  extends HttpServlet{
	private static String INSERT_OR_EDIT = "/invoice_form.jsp";
	private static String LIST_USER = "/user_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String action = req.getParameter("action");
		String forward = "";
		MemberDAO dao = new MemberDAOImpl();

		if (action.equalsIgnoreCase("list")) {
			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("users")) {
			UserDAO userDao = new UserDAOImpl();
			List<UserEntity> users = userDao.getAllUsers();
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(users) + "}");

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("products")) {
			ProductDAO productDao = new ProductDAOImpl();
			List<ProductEntity> products =productDao.getAllProducts();
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(products) + "}");

				out.flush();
				out.close();
				return;
			}

		}else if (action.equalsIgnoreCase("user_details")) {
			UserDAO userDao = new UserDAOImpl();
			String userId=req.getParameter("user_id");
			UserEntity user = userDao.getUserById(userId);
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(user) + "}");

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("M", "member_id", "member_tbl");
			req.setAttribute("member_id", generateID);

			List<UserEntity> users = dao.getAllUsersbyMember();
			req.setAttribute("users", users);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String member_id = req.getParameter("member_id");

			List<UserEntity> users = dao.getAllUsersbyMember();
			req.setAttribute("users", users);
			
			MemberEntity member = dao.getMemberById(member_id);
			req.setAttribute("memObject", member);

		} else if (action.equalsIgnoreCase("deactive")) {

			String member_id = req.getParameter("member_id");
			dao.deactivate(member_id);

			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("active")) {

			String member_id = req.getParameter("member_id");
			dao.activate(member_id);

			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;
		}
		if (forward != "") {
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
	//	int marital_status=Integer.parseInt(req.getParameter("marital_status"));
		
		String forward = "";
		UserEntity user = new UserEntity();
		System.out.println("DOB:"+dob);
		
		
		 SimpleDateFormat format = new SimpleDateFormat("DD-MM-YYYY");
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
		user.setMarital_status(0);
		
		UserDAO dao=new UserDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("U", "user_id", "user_tbl");
		
		
		if (userId.equals(generateID)) {
			dao.addUser(user);
		} else {
			dao.updateUser(user);
		}

		forward = "UserCon?action=list";
		resp.sendRedirect(forward);// Redirect to the reg_list.jsp

	}
	
}
