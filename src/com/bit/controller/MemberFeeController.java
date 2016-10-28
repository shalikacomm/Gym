package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.metal.MetalMenuBarUI;

import org.apache.catalina.tribes.Member;

import com.bit.dao.InvoiceDAO;
import com.bit.dao.InvoiceDAOImpl;
import com.bit.dao.MemberPaymentDAO;
import com.bit.dao.MemberPaymentDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;
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
				MemberPaymentDAO dao = new MemberPaymentDAOImpl();
				MemberPaymentEntity dates = dao.getLastActiveDate(userId);
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
			else if (action.equalsIgnoreCase("insert")) {
				forward = INSERT_OR_EDIT;
				Methods method = new Methods();
				String generateID = method.generateID("P", "payment_id", "member_payment_tbl");
				req.setAttribute("fee_id", generateID);
				MemberPaymentDAO dao = new MemberPaymentDAOImpl();
				MemberPaymentEntity pay = dao.getMonthlyFee();
				req.setAttribute("master_fee",pay);
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
		  else if (action.equalsIgnoreCase("getActiveDate")) {
			  String userId = req.getParameter("user_id");
			  MemberPaymentDAO dao = new MemberPaymentDAOImpl();
			  MemberPaymentEntity dates = dao.getLastActiveDate(userId);
			  Gson gson = new Gson();
			  
			  try (PrintWriter out = resp.getWriter()) {
				  resp.setContentType("application/json");
				  resp.setCharacterEncoding("UTF-8");
				  
				  out.write("{ \"record\":" + new Gson().toJson(dates) + "}");
				  
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
		
		String payment_id = req.getParameter("payment_id");
		String userID = req.getParameter("user_id");
		UserDAO actDao = new UserDAOImpl();
		actDao.activate(userID);
		String active_date = req.getParameter("activeUntil");
		Double due_payemnts = Double.parseDouble(req.getParameter("due_payment"));
			
		if(due_payemnts > 0){
			InvoiceDAO dao =  new InvoiceDAOImpl();
			dao.updateSubStatusWithPay(userID);
		}
		Double gross_payemnt = Double.parseDouble(req.getParameter("gross_payment"));
		Double Discount =Double.parseDouble(req.getParameter("disc"));
		Double totPay = Double.parseDouble(req.getParameter("total_payment"));
		String payment_type = req.getParameter("payment_type");
		String card_type = req.getParameter("card");
		String bank_name = req.getParameter("bank_name");
		Integer first_4 = Integer.parseInt(req.getParameter("f4"));
		Integer last_4 = Integer.parseInt(req.getParameter("l4"));
		
		MemberPaymentEntity pay  = new MemberPaymentEntity();
			
			pay.setPayment_id(payment_id);
			pay.setUser_id(userID);
			pay.setActive_period(active_date);
			pay.setAdditional_payments(due_payemnts);
			pay.setFee_amount(gross_payemnt);
			pay.setDiscount(Discount);
			pay.setTotal_subs(totPay);
			pay.setPayment_type(payment_type);
			pay.setCard_type(card_type);
			pay.setBank_name(bank_name);
			pay.setFirst4(first_4);
			pay.setLast4(last_4);
		
		System.out.println("pID:" + payment_id);
		System.out.println("UID:" + userID);
		System.out.println("ACt date:" + active_date);
		System.out.println("gross Pay:" + gross_payemnt);
		System.out.println("disc:" + Discount);
		System.out.println("totPay:" + totPay);
		
		MemberPaymentDAO daoAdd = new MemberPaymentDAOImpl();
		daoAdd.addFeeDetails(pay);
		
		PrintWriter out = resp.getWriter();
		out.print(true);
	}

}