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

import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.entity.ProductEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;
import com.sun.org.apache.bcel.internal.classfile.Method;

@WebServlet(urlPatterns = "/ProductCon")
public class ProductCon extends HttpServlet {

	private static String INSERT_OR_EDIT = "/product_form.jsp";
	private static String LIST_USER = "/product_list.jsp";

	public static final int getMonthsDifference(Date date1, Date date2) {
		int m1 = date1.getYear() * 12 + date1.getMonth();
		int m2 = date2.getYear() * 12 + date2.getMonth();
		return m2 - m1 + 1;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String forward = "";

		if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("P", "product_id", "product_tbl");
			req.setAttribute("prd_id", generateID);
		}

		else if (action.equalsIgnoreCase("list")) {
			ProductDAO prd_dao = new ProductDAOImpl();
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);
			forward = LIST_USER;

		} 
	
		
		else if (action.equalsIgnoreCase("edit")) {
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			ProductEntity product = prd_dao.getProductById(prd_id);
			req.setAttribute("productobj", product);
			forward = INSERT_OR_EDIT;

		} else if (action.equalsIgnoreCase("deactivate")) {
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			boolean result = prd_dao.deactivateProduct(prd_id);
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.print(result);

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("products")) {

			String prd_id = req.getParameter("product_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			ProductEntity product = prd_dao.getProductById(prd_id);

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(product) + "}");

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("lowQuantity")) {

			
			ProductDAO prd_dao = new ProductDAOImpl();
			List <ProductEntity> product = prd_dao.lowQuantityWarning();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(product) + "}");

				out.flush();
				out.close();
				return;
			}

		} else if (action.equalsIgnoreCase("activate")) {
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			boolean result = prd_dao.activateProduct(prd_id);
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.print(result);

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

		String productId = req.getParameter("prd_id");
		String desc = req.getParameter("desc");
		String measuringUnit = req.getParameter("unit_id");
		float purchasePrice = Float.parseFloat(req.getParameter("p_price"));
		float sellingPrice = Float.parseFloat(req.getParameter("s_price"));
		// float stock = Float.parseFloat(req.getParameter("stock"));
		Integer reorderLevel = Integer.parseInt(req.getParameter("r_level"));

		String forward = "";
		ProductEntity product = new ProductEntity();
		product.setProductID(productId);
		product.setDescription(desc);
		product.setPurchasePrice(purchasePrice);
		product.setSellingPrice(sellingPrice);
		product.setReorderLevel(reorderLevel);
		// product.setStock(stock);
		product.setMeasuringUnit(measuringUnit);

		ProductDAO dao = new ProductDAOImpl();

		Methods methods = new Methods();
		String generateID = methods.generateID("P", "product_id", "product_tbl");
		boolean result = false;
		if (productId.equals(generateID)) {
			result = dao.addProduct(product);

		} else {

			result = dao.updateProduct(product);

		}

		PrintWriter out = resp.getWriter();
		out.print(result);

		// forward = "ProductCon?action=list";
		// resp.sendRedirect(forward);
	}

}
