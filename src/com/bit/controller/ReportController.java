package com.bit.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.entity.ReportEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
@WebServlet(urlPatterns = "/ReportCon")
public class ReportController extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String forward = "";
		
		if (action.equalsIgnoreCase("income_report")) {
			
				
		

		}
	}
	
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
			Date start_date = 	java.sql.Date.valueOf(req.getParameter("start_date"));
			Date end_date = 	java.sql.Date.valueOf(req.getParameter("end_date"));
			String income_type = req.getParameter("income_type");
			
			System.out.println(income_type);
		 if (income_type.equalsIgnoreCase("subscription")) {
			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/income_report_subscription.jasper"));
				Map parameters = new HashMap();
				parameters.put("start_date",start_date);
				parameters.put("end_date", end_date);

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
		}		else if (income_type.equalsIgnoreCase("suppliment")) {
			
			try {
				Connection con = DBUtil.getConnection();
				File reportFile = new File(req.getRealPath("/reports/income_report.jasper"));
				Map parameters = new HashMap();
				parameters.put("start_date", start_date);
				parameters.put("end_date", end_date);
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
		
		}	else if (income_type.equalsIgnoreCase("total")) {
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

}
}
