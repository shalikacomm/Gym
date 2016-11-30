package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.AttendanceDAO;
import com.bit.dao.AttendanceDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.AttendenceEntity;
import com.bit.entity.CalenderEntity;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/AttenCon")
public class AttendenceController extends HttpServlet{
	 
	private static String INSERT_OR_EDIT = "/attendance_form.jsp";
	private static String LIST_USER = "";
	private static String SEE_USER_ATTEN = "/calendar.jsp";
	private static String SEE_USER_FRONT_ATTEN = "/attendence_front.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String forward = "";
		
		if (action.equalsIgnoreCase("check")) {
			//forward = INSERT_OR_EDIT;
			String user = req.getParameter("user_id");
			UserDAO dao = new UserDAOImpl();
			boolean res_status = false;
			res_status=dao.getUserStatus(user);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(res_status) + "}");

				out.flush();
				out.close();
				return;
			}
			
		} 
		else if (action.equalsIgnoreCase("users")) {
			UserDAO userDao = new UserDAOImpl();
			List<UserEntity> users = userDao.getAllMemberUsers();
			//Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(users) + "}");

				out.flush();
				out.close();
				return;
			}
			
		} 
		else if (action.equalsIgnoreCase("getAttendance")) {
			String user_id  = req.getParameter("user_id");
			AttendanceDAO attenDao = new AttendanceDAOImpl();
			List<CalenderEntity> cal = attenDao.getAttendanceUser(user_id);
			//Gson gson = new Gson();
			forward = SEE_USER_ATTEN;
			req.setAttribute("user_id", user_id);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");
				
				out.write(new Gson().toJson(cal));
				
				
				out.flush();
				out.close();
				return;
			}
		}
		else if (action.equalsIgnoreCase("getFrontMemAttendance")) {
			String user_id  = req.getParameter("user_id");
			AttendanceDAO attenDao = new AttendanceDAOImpl();
			List<CalenderEntity> cal = attenDao.getAttendanceUser(user_id);
			forward = SEE_USER_FRONT_ATTEN;
			req.setAttribute("user_id", user_id);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");
				
				out.write(new Gson().toJson(cal));
				
				
				out.flush();
				out.close();
				return;
			}
		
		}
			else if (action.equalsIgnoreCase("getCalendar")) {
				String user_id  = req.getParameter("user_id");
				forward = SEE_USER_ATTEN;
				req.setAttribute("user_id", user_id);
		
			
		} 
			else if (action.equalsIgnoreCase("getCalendarFront")) {
				String user_id  = req.getParameter("user_id");
				forward = SEE_USER_FRONT_ATTEN;
				req.setAttribute("user_id", user_id);
				
				
			} 
		else if (action.equalsIgnoreCase("mark")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("A", "attendance_id", "attendance_tbl");
			req.setAttribute("atten_id", generateID);
			
			 
		}
		if (forward != "") {
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("barcode_name");
		String atten_id = req.getParameter("atten_id");
		
		System.out.println(user_id);
		System.out.println(atten_id);
		
		AttendenceEntity mark = new AttendenceEntity();
		
		mark.setAttendence_id(atten_id);
		mark.setUser_id(user_id);
		
		AttendanceDAO dao = new AttendanceDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("A", "attendance_id", "attendance_tbl");
		boolean result = false;
		if (atten_id.equals(generateID)) {
			result = dao.addAttendance(mark);

		} else {

			result = false;
		}

		PrintWriter out = resp.getWriter();
		out.print(result);
	}

}
