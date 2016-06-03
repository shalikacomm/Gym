package com.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.entity.InstructorEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.Methods;
import com.sun.org.apache.bcel.internal.classfile.Method;

@WebServlet(urlPatterns = "/ProductCon")
public class ProductCon extends HttpServlet {

	private static String INSERT_OR_EDIT = "/product_form.jsp";
	private static String LIST_USER = "/product_list.jsp";

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
		} else if (action.equalsIgnoreCase("list")) {
			ProductDAO prd_dao = new ProductDAOImpl();
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);
			forward = LIST_USER;
			
		} else if (action.equalsIgnoreCase("edit")) {
			
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			ProductEntity product = prd_dao.getProductById(prd_id);
			req.setAttribute("productobj", product);
			forward = INSERT_OR_EDIT;

		}
		else if(action.equalsIgnoreCase("deactivate")){
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			prd_dao.deactivateProduct(prd_id);
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);
			forward = LIST_USER;
			
		}else if (action.equalsIgnoreCase("activate")){
			String prd_id = req.getParameter("prd_id");
			ProductDAO prd_dao = new ProductDAOImpl();
			prd_dao.activateProduct(prd_id);
			List<ProductEntity> list = prd_dao.getAllProducts();
			req.setAttribute("product", list);
			forward = LIST_USER;
			
		}
			
	
		RequestDispatcher view = req.getRequestDispatcher(forward);
		view.forward(req, resp);
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

		if (productId.equals(generateID)) {
			dao.addProduct(product);

		} else {

			 dao.updateProduct(product);

		}

		dao.addProduct(product);

		// forward = "ProductCon?action=list";
		// resp.sendRedirect(forward);
	}

}
