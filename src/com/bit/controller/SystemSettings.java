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
import com.bit.dao.SystemSettingDAO;
import com.bit.dao.SystemSettingDAOImpl;
import com.bit.entity.SystemSettingEntity;
import com.bit.util.Methods;


@WebServlet(urlPatterns = "/SystemCon")
public class SystemSettings extends HttpServlet{

	private static String INSERT_OR_EDIT = "/system_setting_form.jsp";
	private static String LIST_USER = "/system_setting_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String forward = "";
		
		 if (action.equalsIgnoreCase("list")) {
				SystemSettingDAO dao = new SystemSettingDAOImpl();
				List<SystemSettingEntity> list = dao.getAllSettings();
				req.setAttribute("settings", list);
				forward = LIST_USER;
				
				
			}
		 
		 else if (action.equalsIgnoreCase("edit")) {
				
				String set_id = req.getParameter("set_id");
				SystemSettingDAO dao = new SystemSettingDAOImpl();
				SystemSettingEntity set = dao.getSetById(set_id);
				req.setAttribute("settings", set);
				forward = INSERT_OR_EDIT;

			}
		 
		 
		 if(forward !=""){
				RequestDispatcher view = req.getRequestDispatcher(forward);
				view.forward(req, resp);
			}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String setId = req.getParameter("set_id");
		String desc = req.getParameter("desc");
		double value = Double.parseDouble(req.getParameter("value"));

		String forward = "";
		SystemSettingEntity set = new SystemSettingEntity();
		set.setSet_id(setId);
		set.setDescription(desc);
		set.setValue(value);
	

		SystemSettingDAO dao = new SystemSettingDAOImpl();

		Methods methods = new Methods();
		String generateID = methods.generateID("s", "set_id", "system_set_tbl");
		boolean result = false;
		if (!setId.equals(generateID)) {
			result = dao.updateSettings(set);

		} else {

		

		}

		PrintWriter out=resp.getWriter();
		out.print(result);
		
		
		
		
		
	
	}
	
	
}
