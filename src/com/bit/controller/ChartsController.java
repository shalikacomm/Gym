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

import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.entity.ProductEntity;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/ChartCon")
public class ChartsController extends HttpServlet {
	
	private static String INSERT_OR_EDIT = "/charts_form.jsp";
//	private static String LIST_USER = "/add_stock_list.jsp";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String forward = "";
		
		 if (action.equalsIgnoreCase("charts")) {
				
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
			}
		 
		 
		 if (forward != "") {
				RequestDispatcher view = req.getRequestDispatcher(forward);
				view.forward(req, resp);
			}
		
	}

	
	
}
