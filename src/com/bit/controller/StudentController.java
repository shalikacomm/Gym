package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.StudentDAO;
import com.bit.entity.StudentEntity;
import com.bit.util.DBUtil;
import com.google.gson.Gson;

public class StudentController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");

		if (action.equalsIgnoreCase("list")) {

			StudentDAO st_dao = new StudentDAO();

			List<StudentEntity> list = st_dao.getAllStudents();
			Gson gson = new Gson();
			PrintWriter out = resp.getWriter();
			out.println(gson.toJson(list));

		} else if (action.equalsIgnoreCase("edit")) {

		}

		PrintWriter writer = new PrintWriter("myFile.txt", "UTF-8");
		writer.println("The line");

		writer.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int st_id = new Integer(req.getParameter("st_id"));
		String st_name = req.getParameter("st_name");

		StudentEntity st_entity = new StudentEntity();
		// st_entity.setSt_id(st_id);
		st_entity.setSt_name(st_name);

		StudentDAO st_dao = new StudentDAO();

		boolean rs = st_dao.addStudent(st_entity);

		PrintWriter out = resp.getWriter();

		if (rs) {
			out.println("Student Added");
			out.println("<br /><a href='student_reg.jsp'>Add New</a>");
		} else {
			out.println("Student Not added");
			out.println("<br /><a href='student_reg.jsp'>Try Again</a>");
		}

	}
}
