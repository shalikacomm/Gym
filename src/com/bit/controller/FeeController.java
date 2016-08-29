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

import com.bit.dao.FeeDAO;
import com.bit.dao.FeeDAOImpl;
import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.entity.FeeEntity;
import com.bit.entity.InsEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns="/FeeCon")
public class FeeController extends HttpServlet {
	

	private static String INSERT_OR_EDIT = "/fee_form.jsp";
	private static String LIST_USER = "/fee_list.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = req.getParameter("action");
		String forward = "";
		
		
		if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("F", "fee_id", "fee_tbl");
			req.setAttribute("fee_id", generateID);
		}
		
		else if (action.equalsIgnoreCase("list")) {
			FeeDAO fee_dao = new FeeDAOImpl();
			List<FeeEntity> list = fee_dao.getAllFees();
			req.setAttribute("feeList", list);
			forward = LIST_USER;
			
			
		}
		
		if(forward !=""){
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String feeID = req.getParameter("fee_id");
		double fee = Double.parseDouble(req.getParameter("fee"));
		
		FeeEntity feePay = new FeeEntity();
		
		feePay.setFee_id(feeID);
		feePay.setFee(fee);
		
		FeeDAO dao = new FeeDAOImpl();
		
		Methods methods = new Methods();
		String generateID = methods.generateID("F", "fee_id", "fee_tbl");
		boolean result = false;
		if (feeID.equals(generateID)) {
			result=dao.addFee(feePay);
	
	}else{

		 dao.updateFee(feePay);

	}
	
		PrintWriter out=resp.getWriter();
		out.print(result);
	
	
}
}

