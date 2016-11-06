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

import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.UserEntity;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/BarcodeCon")
public class BarcodeController extends HttpServlet{
	private static String INSERT_OR_EDIT = "/barcode_form.jsp";
	// private static String LIST_USER = "/product_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String action = req.getParameter("action");
		String forward = "";
		
		if (action.equalsIgnoreCase("insert")) {
			UserDAO dao = new UserDAOImpl();
			//forward = INSERT_OR_EDIT;
			List<UserEntity> list = dao.getAllMemberUsers();
			req.setAttribute("users", list);
			forward = INSERT_OR_EDIT;
			
		} 
		if(forward!=""){
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
			}
			
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
