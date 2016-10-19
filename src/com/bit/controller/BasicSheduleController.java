package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bit.dao.BasicChartDAO;
import com.bit.dao.BasicChartDAOImpl;
import com.bit.entity.BasicChartEntity;
import com.bit.util.Methods;


@WebServlet(urlPatterns="/BasicSheduleCon")
public class BasicSheduleController extends HttpServlet {
	
	private static String INSERT_OR_EDIT = "/workout_chart_form.jsp";
	private static String LIST_USER = "/workout_chart_list.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String forward = "";
		 BasicChartDAO dao = new BasicChartDAOImpl();
		
		if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("W", "workout_id", "workout_charts");
			req.setAttribute("workoutID", generateID);
		} 
		
		if(forward !=""){
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String workout_id = req.getParameter("workout_id");
		String instructor = req.getParameter("ins_name");
		String chartName = req.getParameter("chartName");
		
		BasicChartEntity basic = new BasicChartEntity();
		BasicChartDAO dao_detail = new BasicChartDAOImpl();
		
		basic.setWorkout_id(workout_id);
		basic.setInstructor_name(instructor);
		basic.setWorkout_name(chartName);
		dao_detail.addBasicCharts(basic);
		
		String [] exerciseID = req.getParameterValues("exerciseID");
		String [] no_of_rep = req.getParameterValues("no_of_rep");
		String [] set_per_rep = req.getParameterValues("set_per_rep");
		
		BasicChartEntity details = new BasicChartEntity();
		for(int i=0 ;i < exerciseID.length;i++){
		
			System.out.println(exerciseID[i]);
			System.out.println(no_of_rep[i]);
			System.out.println(set_per_rep[i]);
			
			details.setWorkout_id(workout_id);
			details.setExercise_id(exerciseID[i]);
			details.setSets_per_rep(new Integer(set_per_rep[i]));
			details.setNo_of_reps(new Integer(no_of_rep[i]));
			
			
		BasicChartDAO dao = new BasicChartDAOImpl();
		dao.addBasicChartDetails(details);
		
		}
		PrintWriter out = resp.getWriter();
		out.print(true);
		
	}
	
}
