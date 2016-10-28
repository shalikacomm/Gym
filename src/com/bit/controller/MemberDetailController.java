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

import com.bit.dao.MemberDAO;
import com.bit.dao.MemberDAOImpl;
import com.bit.dao.MemberDetailDAO;
import com.bit.dao.MemberDetailDAOImpl;
import com.bit.entity.MemberDetailEntity;
import com.bit.entity.MemberEntity;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/MemberDCon")
public class MemberDetailController extends HttpServlet {
	private static String INSERT_OR_EDIT = "/memberDetail_form.jsp";
	private static String LIST_USER = "/member_details_list.jsp";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		String forward = "";
		MemberDAO dao = new MemberDAOImpl();

		if (action.equalsIgnoreCase("list")) {
			List<UserEntity> list = dao.getAllUsersbyMember();
			req.setAttribute("users", list);
			forward = LIST_USER;

		}
		else if (action.equalsIgnoreCase("insert")) {
			
			Methods method = new Methods();
			String generateID = method.generateID("M", "detail_id", "member_detail_tbl");
			req.setAttribute("member_id", generateID);

			List<UserEntity> users = dao.getAllUsersbyMember();
			req.setAttribute("users", users);
			forward = INSERT_OR_EDIT;
		} 
		else if (action.equalsIgnoreCase("members")) {
			MemberDAO memDao = new MemberDAOImpl();
			List<UserEntity> members = memDao.getAllUsersbyMember();
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(members) + "}");

				out.flush();
				out.close();
				return;
			}
		}
		else if (action.equalsIgnoreCase("body_part")) {
			String user_id = req.getParameter("userName");
			//String bodyPart = req.getParameter("bodypart");
			MemberDetailDAO memDao = new MemberDetailDAOImpl();
			List <MemberDetailEntity> details = memDao.getprogress(user_id);
			Gson gson = new Gson();

			try (PrintWriter out = resp.getWriter()) {
				resp.setContentType("application/json");
				resp.setCharacterEncoding("UTF-8");

				out.write("{ \"record\":" + new Gson().toJson(details) + "}");

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
		
		String memberDetail_id = req.getParameter("memberDetail_id");
		String user_id = req.getParameter("user_id");
		Double height = Double.parseDouble(req.getParameter("height"));
		Double weight = Double.parseDouble(req.getParameter("weight"));
		Double bmi = Double.parseDouble(req.getParameter("bmi"));
		Double goal_weight = Double.parseDouble(req.getParameter("goal_weight"));
		Double chest = Double.parseDouble(req.getParameter("chest"));
		Double hip = Double.parseDouble(req.getParameter("hip"));
		Double sholuder_length = Double.parseDouble(req.getParameter("sholuder_length"));
		Double thigh = Double.parseDouble(req.getParameter("thigh"));
		Double bicep = Double.parseDouble(req.getParameter("bicep"));
		
		MemberDetailEntity details = new MemberDetailEntity();
		
		details.setDetail_id(memberDetail_id);
		details.setUser_id(user_id);
		details.setHeight(height);
		details.setWeight(weight);
		details.setBmi(bmi);
		details.setGoal_weight(goal_weight);
		details.setChest(chest);
		details.setHip(hip);
		details.setShoulder_length(sholuder_length);
		details.setThigh(thigh);
		details.setBicep(bicep);
		
		MemberDetailDAO dao = new MemberDetailDAOImpl();
		dao.addMemberDetail(details);
		
		PrintWriter out = resp.getWriter();
		out.print(true);

	}
	
	

}
