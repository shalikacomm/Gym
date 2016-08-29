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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.InvoiceDAO;
import com.bit.dao.InvoiceDAOImpl;

import com.bit.dao.MemberDAO;
import com.bit.dao.MemberDAOImpl;
import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.InvoiceEntity;
import com.bit.entity.InvoiceProductEntity;
import com.bit.entity.MemberEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;
import com.bit.util.Methods;
import com.google.gson.Gson;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

@WebServlet(urlPatterns = "/InvoiceCon")
public class InvoiceController extends HttpServlet {
	private static String INSERT_OR_EDIT = "/invoice_form.jsp";
	private static String LIST_USER = "/invoice_list.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = req.getParameter("action");
		String forward = "";
		MemberDAO dao = new MemberDAOImpl();

		if (action.equalsIgnoreCase("list")) {
			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list); // for jstl  pass object 
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
			List<ProductEntity> products = productDao.getActiveProducts();
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(products) + "}");

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("user_details")) {
			UserDAO userDao = new UserDAOImpl();
			String userId = req.getParameter("user_id");
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
			String generateID = method.generateID("I", "invoice_id", "invoice_tbl");
			req.setAttribute("invoice_id", generateID);
				}

		else if (action.equalsIgnoreCase("invoice_list")) {
			InvoiceDAO insL_dao  = new InvoiceDAOImpl();
			List<InvoiceEntity> invo_list = insL_dao.getInvoiceList();
			req.setAttribute("invoices", invo_list);
			forward = LIST_USER;

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

		} else if (action.equalsIgnoreCase("pdf")) {

			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/report1.jasper"));
				Map parameters = new HashMap();
				parameters.put("pro_id", req.getParameter("Id"));

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
		} else if (action.equalsIgnoreCase("pdf2")) {

			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/report23.jasper"));
				Map parameters = new HashMap();
				parameters.put("product_name", req.getParameter("Name"));

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
		} else if (action.equalsIgnoreCase("recipt")) {

			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/invoice_report.jasper"));
				Map parameters = new HashMap();
				parameters.put("invoice_id", req.getParameter("inv_id"));

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
		if (forward != "") {
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String invoice_id = req.getParameter("invoice_id");
		String user_id = req.getParameter("user_id");
		
		//String no_reg_user = req.getParameter("idfor");
		String cus_name = req.getParameter("b_name");
		System.out.println("NAME:" + cus_name);
	
		String email = req.getParameter("email");
		Double vat = Double.parseDouble(req.getParameter("vat"));
		Double disc = Double.parseDouble(req.getParameter("disc"));
		Double total = Double.parseDouble(req.getParameter("total"));
		Double invoiced_total = Double.parseDouble(req.getParameter("invoiced_tot"));
		String payment_type = req.getParameter("payment_type");
		String card_type = req.getParameter("card");
		String bank_name = req.getParameter("bank_name");
		Double subscrip_total = Double.parseDouble(req.getParameter("fee_total"));
		String f4=req.getParameter("f4");
		String l4=req.getParameter("l4");
		Integer first_4=1111;
		Integer last_4=2222;
		if(f4 !="" && l4 != ""){
		 first_4 = Integer.parseInt(f4);
		 last_4 = Integer.parseInt(l4);
		}
		
		
		
		InvoiceEntity sellerDetails = new InvoiceEntity();
		
		if("subs".equals(req.getParameter("payment_type")))
			sellerDetails.setSub_status(0);
			else{
				sellerDetails.setSub_status(2);
			}

		if (user_id != null){
			sellerDetails.setUser_id(user_id);
		}else{
			sellerDetails.setUser_id("0");
		}
		
	
		sellerDetails.setInvoice_id(invoice_id);
		sellerDetails.setCustomer_name(cus_name);
		sellerDetails.setEmail(email);
		sellerDetails.setVat(vat);
		sellerDetails.setInvoiced_total(invoiced_total);
		sellerDetails.setPayment_type(payment_type);
		sellerDetails.setCard_type(card_type);
		sellerDetails.setbank_name(bank_name);
		sellerDetails.setTotal_subscription(subscrip_total);
		sellerDetails.setF4(first_4);
		sellerDetails.setL4(last_4);
		sellerDetails.setDiscount(disc);
		sellerDetails.setTotal(total);

	
		InvoiceDAO dao = new InvoiceDAOImpl();
		boolean result = false;
		dao.addSellerDetails(sellerDetails);

		String[] inv_items = req.getParameterValues("inv_item");
		String[] inv_units = req.getParameterValues("inv_qty");
		String[] inv_sub = req.getParameterValues("inv_sub_total");

		for (int i = 0; i < inv_items.length; i++) {
			System.out.println("Invoice_id:" + invoice_id);
			System.out.println("product_id:" + inv_items[i]);
			System.out.println(" qty:" + inv_units[i]);
			System.out.println(" subtotal:" + inv_sub[i]);

			InvoiceProductEntity productSell = new InvoiceProductEntity();
			productSell.setInvoice_id(invoice_id);
			productSell.setProduct_id(inv_items[i]);
			productSell.setQty(new Double(inv_units[i]));
			productSell.setItem_total(new Double(inv_sub[i]));

			InvoiceDAO Seller = new InvoiceDAOImpl();

			Seller.addInvoiceProduct(productSell);
			Seller.updateBatchQty(inv_items[i], new Float(inv_units[i]));
		}
// to reduce the sold items from the old stock
		for (int r = 0; r < inv_items.length; r++) {
			System.out.println("Item name :" + inv_items);
			System.out.println("Item quantity :" + inv_units);

			ProductEntity stk_product = new ProductEntity();
			// stk_product.setProductID(inv_items[r]);
			InvoiceDAO new_dao = new InvoiceDAOImpl();
			stk_product = new_dao.getStockById(inv_items[r].toString());
			System.out.println("qty " + stk_product.getStock());
			float old_stock = stk_product.getStock();
			double qty = new Double(inv_units[r]);
			double new_stock = old_stock - qty;

			// InvoiceDAO stock_dao = new InvoiceDAOImpl();//

		}

		PrintWriter out = resp.getWriter();
		out.print(true);

	}

}