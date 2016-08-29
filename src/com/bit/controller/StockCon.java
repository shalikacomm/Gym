package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.InvoiceDAO;
import com.bit.dao.InvoiceDAOImpl;
import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.dao.StockDAO;
import com.bit.dao.StockDAOImpl;
import com.bit.entity.InvoiceProductEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.StockEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/StockCon")
public class StockCon extends HttpServlet {
	private static String INSERT_OR_EDIT = "/stock_form.jsp";
	private static String LIST_USER = "/add_stock_list.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doGet(req, resp);
		String action = req.getParameter("action");
		String forward = "";
		StockDAO stock_dao = new StockDAOImpl();
		
		 if (action.equalsIgnoreCase("products")) {
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
		 else if (action.equalsIgnoreCase("insert")) {
				
				Methods method = new Methods();
				String generateID = method.generateID("S", "series_id", "batch_tbl");
				req.setAttribute("series_id", generateID);
				forward = INSERT_OR_EDIT;
					}
				 
		 else if (action.equalsIgnoreCase("getBatch")) {
				boolean result = false;
				
			String product_id = req.getParameter("prd_id");
			boolean prdAvailable = stock_dao.checkProductId(product_id);
			int batch = 0;
			 if(prdAvailable){
				 StockEntity newBatch = stock_dao.getMaxBatchById(product_id);
				 batch = newBatch.getBatch_no();
		    	// System.out.println(batch);
		    	 batch = batch+1;
		    		try (PrintWriter out = resp.getWriter()) {
						

						out.print(batch);
						// to pass as html value /out.print(value);

						out.flush();
						out.close();
						return;
					}
			 }else {
				// System.out.println("there isnt any");
				 batch = 1;
					try (PrintWriter out = resp.getWriter()) {
						

						out.print(batch);
						// to pass as html value /out.print(value);

						out.flush();
						out.close();
						return;
					}
			 }
			 
			 
			 
			 
					}
		 
		/* else if (action.equalsIgnoreCase("getMaxExpDate")) {
			
				String prd_id = req.getParameter("prd_id");
				String date = req.getParameter("date");
				boolean result = false;
			
				List<StockEntity> stockDates = stock_dao.getStockDates(prd_id);
				for(int i = 0; i < stockDates.size(); i++){
				     String exDate = stockDates.get(i).getExpiary_date();
				     if(exDate != date){
					  result = true;
				   }else {
					   
					   result = false;
				   }
				}
				int value=0;
				  if (result == true ){
				    	 StockEntity newBatch = stock_dao.getMaxBatchById(prd_id);
				    	  value = newBatch.getBatch_no();
				    	 System.out.println(value);
				    	 value = value+1;
				    	 //req.setAttribute("batchObj",value);
				    	
				    		try (PrintWriter out = resp.getWriter()) {
							

								out.print(value);
								// to pass as html value /out.print(value);

								out.flush();
								out.close();
								return;
							}

				    	 
				     }else{
				    	 System.out.println("donot add a batch");
				     }
			
			
	}*/
		 
			if (forward != "") {
				RequestDispatcher view = req.getRequestDispatcher(forward);
				view.forward(req, resp);
			}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		String seriesID = req.getParameter("series_id");
		String[] inv_items = req.getParameterValues("inv_item");
		String[] expDate = req.getParameterValues("dob");
		String[] batchNo = req.getParameterValues("batch_no");
		String[] qty = (req.getParameterValues("qty"));
		
	//	List<Integer> lsBatchNo = new ArrayList<Integer>();
		StockEntity stockAdd = new StockEntity();
		stockAdd.setSeriesID(seriesID);
		for (int i = 0; i < inv_items.length; i++) {
			
			
			boolean result = false; 
	
			System.out.println("products:" + inv_items[i]);
			System.out.println(" expDate:" + expDate[i]);
			System.out.println(" batch:" + batchNo[i]);
			System.out.println(" qty:" + qty[i]);

			
		
			stockAdd.setProduct_id(inv_items[i]);
			stockAdd.setExpiary_date(expDate[i]);
			stockAdd.setBatch_no(Integer.parseInt(batchNo[i]));
			stockAdd.setQty(Float.parseFloat(qty[i]));
	

			StockDAO Series = new StockDAOImpl();
			
			result = Series.addStock(stockAdd);
			
			PrintWriter out=resp.getWriter();
			out.print(result);
			
		}

	/*	
		for(Integer i:lsBatchNo){
			System.out.println("### "+i);
		}
		*/
		
	}

	
	
}
