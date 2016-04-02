package com.bit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.dao.StudentDAO;
import com.bit.entity.StudentEntity;
import com.google.gson.Gson;

public class St_Con extends HttpServlet {

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
			  //out.write("{ \"record\":" + new Gson().toJson(list) + "}");
			
		}else if(action.equalsIgnoreCase("edit")){
			
			
		}else if(action.equalsIgnoreCase("deactive")){
			
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String st_name = req.getParameter("st_name");
		String mail = req.getParameter("mail");

		StudentEntity entity = new StudentEntity();
		entity.setSt_name(st_name);
		entity.setEmail(mail);

		StudentDAO dao = new StudentDAO();
		boolean rs = dao.addStudent(entity);

		try {
			PrintWriter out = resp.getWriter();

			if (rs) {
				out.write("SUCCESS!!!!");
			} else {
				out.write("FAIL!!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
