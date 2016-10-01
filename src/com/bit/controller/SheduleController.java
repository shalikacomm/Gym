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

import com.bit.dao.ExerciseDAO;
import com.bit.dao.ExerciseDAOImpl;
import com.bit.dao.ProductDAO;
import com.bit.dao.ProductDAOImpl;
import com.bit.dao.SheduleDAO;
import com.bit.dao.SheduleDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.ExerciseEntity;
import com.bit.entity.MemberEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.SheduleDetailEntity;
import com.bit.entity.SheduleEntitiy;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/SheduleCon")
public class SheduleController extends HttpServlet {

	private static String INSERT_OR_EDIT = "/shedule_form.jsp";
	private static String LIST_USER = "/shedule_list.jsp";
	private String[] sets_per_rep;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		String forward = "";
		
		  if (action.equalsIgnoreCase("user_details")) {
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
			} 
		  
			else if (action.equalsIgnoreCase("insert")) {
				forward = INSERT_OR_EDIT;
				Methods method = new Methods();
				String generateID = method.generateID("S", "shedule_id", "shedule_tbl");
				req.setAttribute("shedule_id", generateID);
				
			} 
		  
			  
			else if (action.equalsIgnoreCase("users")) {
				UserDAO userDao = new UserDAOImpl();
				List<UserEntity> users = userDao.getAllActiveMemberUsers();
				Gson gson = new Gson();

				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.write("{ \"record\":" + new Gson().toJson(users) + "}");

					out.flush();
					out.close();
					return;
				}

			}
		  
			else if(action.equalsIgnoreCase("deactivate")){
				String shedule_id = req.getParameter("shedule_id");
				SheduleDAO shedule_dao = new SheduleDAOImpl();
				boolean result= shedule_dao.deactivateShedule(shedule_id);
				List<SheduleEntitiy> list = shedule_dao.getAllShedules();
				req.setAttribute("shedule", list);
				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.print(result);

					out.flush();
					out.close();
					return;
				}
				
			}
		  
			else if (action.equalsIgnoreCase("activate")){
				String shedule_id = req.getParameter("shedule_id");
				SheduleDAO shedule_dao = new SheduleDAOImpl();
				boolean result= shedule_dao.activateShedule(shedule_id);
				List<SheduleEntitiy> list = shedule_dao.getAllShedules();
				req.setAttribute("shedule", list);
				
				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					out.print(result);

					out.flush();
					out.close();
					return;
				}

			}
		  
			else if (action.equalsIgnoreCase("list")) {
				SheduleDAO dao = new SheduleDAOImpl();
				List<SheduleEntitiy> list = dao.getAllShedules();
				req.setAttribute("shedule", list); // for jstl  pass object 
				forward = LIST_USER;

			}
		  
			 else if (action.equalsIgnoreCase("exercises")) {
					SheduleDAO Dao = new SheduleDAOImpl();
					List<ExerciseEntity> exercise = Dao.getActiveExercise();
					Gson gson = new Gson();

					try (PrintWriter out = resp.getWriter()) {
						resp.setContentType("application/json");
						resp.setCharacterEncoding("UTF-8");

						out.write("{ \"record\":" + new Gson().toJson(exercise) + "}");

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
		
		String shedule_id = req.getParameter("shedule_id");
		String user_id = req.getParameter("user_id");
		String instructor_name =  req.getParameter("ins_name");
		
		SheduleDAO dao = new SheduleDAOImpl();
		int workout = 0;
		SheduleEntitiy shedule  = new SheduleEntitiy();
		shedule.setShedule_id(shedule_id);
		shedule.setUser_id(user_id);
		shedule.setInstructor_name(instructor_name);
		
		SheduleEntitiy maxVal = dao.getMaxSheduleById(user_id);
		workout = maxVal.getWorkout_no();
		System.out.println("before :" + workout);
		workout = workout+1;
		System.out.println("after :" +workout);
		shedule.setWorkout_no(workout);
		
		dao.addShedule(shedule);
	
		
		
		SheduleDetailEntity shedule_detail = new SheduleDetailEntity();
		
		String [] exercise = req.getParameterValues("exercise");
		String [] no_of_rep = req.getParameterValues("no_of_rep");
		String [] set_per_rep = req.getParameterValues("set_per_rep");
		
		
		for(int i=0 ;i < exercise.length;i++){
			System.out.println(exercise[i]);
			System.out.println(no_of_rep[i]);
			System.out.println(set_per_rep[i]);
			
		shedule_detail.setShedule_id(shedule_id);
		shedule_detail.setExercise_id(exercise[i]);
		shedule_detail.setSets_per_rep(new Integer(set_per_rep[i]));
		shedule_detail.setNo_of_rep(new Integer(no_of_rep[i]));
		
		SheduleDAO dao_detail = new SheduleDAOImpl();
		dao_detail.addSheduleDetails(shedule_detail);
		
		}
		
		PrintWriter out = resp.getWriter();
		out.print(true);
		
	}
}

