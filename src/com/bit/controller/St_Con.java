package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.StudentDAO;
import com.bit.entity.StudentEntity;
import com.google.gson.Gson;

public class St_Con extends HttpServlet {
	private static String INSERT_OR_EDIT = "/reg_form.jsp";
	private static String LIST_USER = "/reg_list.jsp";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String forward = "";
		if (action.equalsIgnoreCase("list")) {

			forward = LIST_USER;
			StudentDAO st_dao = new StudentDAO();
			List<StudentEntity> list = st_dao.getAllStudents();

			request.setAttribute("users", list);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String st_id = request.getParameter("st_id");
			System.out.println(st_id);
			int student_id = new Integer(st_id);
			StudentDAO stDAO = new StudentDAO();

			StudentEntity student = stDAO.getUserById(student_id);

			request.setAttribute("student", student);

		} else if (action.equalsIgnoreCase("deactive")) {

		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// getting parameters from the reg_form.jsp
		String st_id = request.getParameter("st_id");
		String st_name = request.getParameter("st_name");
		String mail = request.getParameter("mail");

		System.out.println("OUT:: " + st_id);
		String forward = "";
		StudentEntity student = new StudentEntity();
		student.setSt_name(st_name);
		student.setEmail(mail);

		StudentDAO dao = new StudentDAO();

	
		
			if (st_id == null || st_id.isEmpty()) {
				 dao.addStudent(student);
				
			} else {
				student.setSt_id(Integer.parseInt(st_id));
				dao.updateStudent(student);
			}

		
		forward = "St_Con?action=list";
		response.sendRedirect(forward);// Redirect to the reg_list.jsp
		    System.out.println("SUCCESS");
	}
}
