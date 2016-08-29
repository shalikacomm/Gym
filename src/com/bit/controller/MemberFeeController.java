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


import com.bit.dao.MemberPaymentDAO;
import com.bit.dao.MemberPaymentDAOImpl;

import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.google.gson.Gson;


@WebServlet(urlPatterns = "/MemberFeeCon")
public class MemberFeeController extends HttpServlet {
	
	private static String INSERT_OR_EDIT = "/member_payment_form.jsp";
	private static String LIST_USER = "/member_list.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String forward = "";
		
		  if (action.equalsIgnoreCase("mem_status")) {
				MemberPaymentDAO mem_dao = new MemberPaymentDAOImpl();
				String userId = req.getParameter("user_id");
				UserEntity user = mem_dao.getMemberStatus(userId);
				Gson gson = new Gson();

				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.write("{ \"record\":" + new Gson().toJson(user) + "}");

					out.flush();
					out.close();
					return;
				}

			} 
		  
		  else if (action.equalsIgnoreCase("getSubs")) {
			  double due = 0;
			  double total_due = 0;
			  MemberPaymentDAO mem_dao = new MemberPaymentDAOImpl();
				 String userId = req.getParameter("user_id");
				List <MemberPaymentEntity> subList = mem_dao.getMemberSubs(userId);
				for(int i =0;i<subList.size();i++){
					  due = subList.get(i).getAdditional_payments();
					  total_due += due; 
					
				}
				System.out.println(total_due); 
			//	double totalSubs = due ;
				 Gson gson = new Gson();
				 
				 try (PrintWriter out = resp.getWriter()) {
					 resp.setContentType("application/json");
					 resp.setCharacterEncoding("UTF-8");
					 
					// out.write("{ \"record\":" + new Gson().toJson(total_due) + "}");
					 out.print(total_due);
					 
					 out.flush();
					 out.close();
					 return;
				 }
				 
			 } 
		
		
		
		if (forward != "") {
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

}
