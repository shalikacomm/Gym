package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/AttenCon")
public class AttendenceController extends HttpServlet{
	 
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
	}

}
