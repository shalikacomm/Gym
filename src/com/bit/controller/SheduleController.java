package com.bit.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
import com.bit.entity.WorkoutDetailEntity;
import com.bit.entity.WorkoutEntity;
import com.bit.util.DBUtil;
import com.bit.util.Methods;
import com.google.gson.Gson;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;

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
			else if (action.equalsIgnoreCase("AllMemberUsers")) {
				UserDAO userDao = new UserDAOImpl();
				List<UserEntity> users = userDao.getAllMemberUsers();
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
			 else if (action.equalsIgnoreCase("getWorkOutNames")) {
				 SheduleDAO Dao = new SheduleDAOImpl();
				 List<WorkoutEntity> exercise = Dao.getWorkoutList();
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
			 else if (action.equalsIgnoreCase("getOneWorkout")) {
				 SheduleDAO Dao = new SheduleDAOImpl();
				 String workout_id = req.getParameter("work_id");
				List<WorkoutDetailEntity> workoutDetail = Dao.getOneWorkout(workout_id);
				 Gson gson = new Gson();
				 
				 try (PrintWriter out = resp.getWriter()) {
					 resp.setContentType("application/json");
					 resp.setCharacterEncoding("UTF-8");
					 
					 out.write("{ \"record\":" + new Gson().toJson(workoutDetail) + "}");
					 
					 out.flush();
					 out.close();
					 return;
				 }
				 
				 
				 
			 }
			 else if (action.equalsIgnoreCase("sheduleEmail")) {

					try {
						Connection con = DBUtil.getConnection();
						File reportFile = new File(req.getRealPath("/reports/workout_shedule.jasper"));
						Map parameters = new HashMap();
						parameters.put("shedule_id", req.getParameter("shedule_id"));

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
			 else if (action.equalsIgnoreCase("sheduleEmailAttach")) {
				 boolean res = false;
				 String instructor = req.getParameter("instructor");
				 String name = req.getParameter("first_name");
				 String email = req.getParameter("email");
				 String subject = "Workout Schedule";
				 String msg_body = "Hi " +name+ ", \n \n Please find the attachment below, You can use this PDF as your workout schedule."
	                        	                        + " \n \n Thanks you, \n "+instructor+", \n Gym Instructor,\n Fit & Fun Health club";
				 try {
					
					 
					 Methods method=new Methods();
					 String filepath="C:\\AirDroid\\schedule.pdf";
					 try {
						method.ExportPDFquote(req.getRealPath("/reports/workout_shedule.jasper"), filepath,  req.getParameter("shedule_id"), "shedule_id");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				String result =  method.SendMailAttachment(email,subject,msg_body, filepath);
					 if(result != null){
						 res = true;
					 }else{
						 res = false;
					 }
				 } catch (JRException ex) {
					 ex.printStackTrace();
				 }
					try (PrintWriter out = resp.getWriter()) {
						resp.setContentType("application/json");
						resp.setCharacterEncoding("UTF-8");

						out.print(res);

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

