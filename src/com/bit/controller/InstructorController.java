package com.bit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.InstructorDAO;
import com.bit.entity.InstructorEntity;
import com.bit.util.Methods;


@WebServlet(urlPatterns="/InsCon")
public class InstructorController extends HttpServlet {

	private static String INSERT_OR_EDIT = "/instructor_form.jsp";
	private static String LIST_USER = "/instructor_list.jsp";

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		String forward = "";
		if (action.equalsIgnoreCase("list")) {
			InstructorDAO ins_dao = new InstructorDAO();
			List<InstructorEntity> list = ins_dao.getAllInstructors();
			req.setAttribute("instructors", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("I", "ins_id", "instructor_tbl");
			req.setAttribute("ins_id", generateID);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String ins_id = req.getParameter("ins_id");

			InstructorDAO insDAO = new InstructorDAO();

			InstructorEntity instructor = insDAO.getInstructorById(ins_id);
			req.setAttribute("instructorObj", instructor);

		} else if (action.equalsIgnoreCase("deactive")) {

			String ins_id = req.getParameter("ins_id");
			InstructorDAO insDAO = new InstructorDAO();
			insDAO.deactiveInstructor(ins_id);

			List<InstructorEntity> list = insDAO.getAllInstructors();
			req.setAttribute("instructors", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("active")) {

			String ins_id = req.getParameter("ins_id");
			InstructorDAO insDAO = new InstructorDAO();
			insDAO.activeInstructor(ins_id);

			List<InstructorEntity> list = insDAO.getAllInstructors();
			req.setAttribute("instructors", list);
			forward = LIST_USER;
		}
		RequestDispatcher view = req.getRequestDispatcher(forward);
		view.forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String ins_id = req.getParameter("ins_id");
		String ins_name = req.getParameter("ins_name");
		String ins_mail = req.getParameter("ins_mail");

		String forward = "";
		InstructorEntity instructor = new InstructorEntity();
		instructor.setIns_id(ins_id);
		instructor.setIns_name(ins_name);
		instructor.setIns_email(ins_mail);

		InstructorDAO dao = new InstructorDAO();

		Methods methods = new Methods();

		String generateID = methods.generateID("I", "ins_id", "instructor_tbl");

		if (ins_id.equals(generateID)) {
			dao.addInstructor(instructor);

		} else {

			dao.updateInstructor(instructor);

		}

		forward = "InstructorController?action=list";
		resp.sendRedirect(forward);// Redirect to the instructor list.jsp

	}

}
