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
import com.bit.entity.ExerciseEntity;
import com.bit.util.Methods;

@WebServlet(urlPatterns = "/ExerciseCon")
public class ExerciseCon extends HttpServlet {

	private static String INSERT_OR_EDIT = "/exercise_form.jsp";
	private static String LIST_USER = "/exercise_list.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String action = req.getParameter("action");
		String forward = "";
		ExerciseDAO dao = new ExerciseDAOImpl();
		
		if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("E", "exercise_id", "exercise_tbl");
			req.setAttribute("exer_id", generateID);
		} 
		
		else if (action.equalsIgnoreCase("list")) {
			
			List<ExerciseEntity> list = dao.getAllExercise();
			req.setAttribute("exercise", list);
			forward = LIST_USER;
			
			
		}
		else if (action.equalsIgnoreCase("edit")) {
			
			String exercise_id = req.getParameter("exercise_id");
			ExerciseEntity exercise = dao.getExerciseById(exercise_id);
			req.setAttribute("exerciseObj", exercise);
			forward = INSERT_OR_EDIT;

		}
		else if(action.equalsIgnoreCase("deactivate")){
			String exercise_id = req.getParameter("exercise_id");
			boolean result= dao.deactivateExercise(exercise_id);
			List<ExerciseEntity> list = dao.getAllExercise();
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
		else if (action.equalsIgnoreCase("activate")){
			String exercise_id = req.getParameter("exercise_id");
			boolean result=dao.activateExercise(exercise_id);
			List<ExerciseEntity> list = dao.getAllExercise();
			req.setAttribute("exercise", list);
			
			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.print(result);

				out.flush();
				out.close();
				return;
			}

		}
		
		if(forward !=""){
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}
		
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String forward = "";
		String exerciseId = req.getParameter("exercise_id");
		String desc = req.getParameter("desc");
		
	
		ExerciseEntity exercise = new ExerciseEntity();
		exercise.setExercise_id(exerciseId);
		exercise.setDescription(desc);
		exercise.setStatus(1);
		

		ExerciseDAO dao = new ExerciseDAOImpl();

		Methods methods = new Methods();
		String generateID = methods.generateID("E", "exercise_id", "exercise_tbl");
		boolean result = false;
		if (exerciseId.equals(generateID)) {
			result= dao.addExercise(exercise);

		} else {

			result = dao.updateExercise(exercise);

		}

		PrintWriter out=resp.getWriter();
		out.print(result);
	
	}
}
