package com.bit.controller;

/**
 * @author Amanda
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.UserEntity;
import com.bit.util.Methods;

@WebServlet(name = "LoginCon", urlPatterns = { "/LoginCon" })
public class LoginController extends HttpServlet {

	RequestDispatcher rd = null;
	Cookie cookie;
	
	public LoginController() {
		cookie = new Cookie("JSESSIONID", null);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("logout")) {
			HttpSession session = request.getSession();
			session.removeAttribute("currentSessionUser");
			session.invalidate();

			rd = request.getRequestDispatcher("login.jsp");

			rd.forward(request, response);

			// }
		}
		else if (action.equalsIgnoreCase("resetPw")) {
			String test = null;
			HttpSession session = request.getSession();
			session.removeAttribute("currentSessionUser");
			session.invalidate();
			String email = request.getParameter("email");
			UserDAO dao = new UserDAOImpl();
			dao.resetPassword(email);
System.out.println("worning");
			rd = request.getRequestDispatcher("login.jsp");

			rd.forward(request, response);

			// }
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserDAO userDAO = new UserDAOImpl();
		

		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("login")) {
		try {
			UserEntity user = new UserEntity();
			user.setNic(request.getParameter("nic"));
			user.setPassword(request.getParameter("password"));
			user =userDAO.login(user);// Send User name and Password to User DAO
			if (user.isValid()) { // Check availability of the user
				if(user.getStatus()==1){
				if(user.getRole().equalsIgnoreCase("member")){
					HttpSession session = request.getSession(true);
					session.setAttribute("frontSessionUser", user);
					response.sendRedirect("index_front.jsp");
				}else {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				response.sendRedirect("dashboard.jsp"); // Redirect to Home page
				}
				
				}else if(user.getStatus()==3){
					HttpSession session = request.getSession(true);
					session.setAttribute("freshUser", user);
					response.sendRedirect("new_login.jsp"); 
				}
			} else {
				HttpSession session = request.getSession(true);
				session.setAttribute("InvalidUser", user);
				//session.setAttribute("msg", "User details not found ");
				response.sendRedirect("login.jsp"); // Return to index page

				
			}
		} finally {
			out.close();
		}
		}else if(action.equalsIgnoreCase("reset")){
			String test = null;
			HttpSession session = request.getSession();
			session.removeAttribute("currentSessionUser");
			session.invalidate();
			String email = request.getParameter("resetEmail");
			UserDAO dao = new UserDAOImpl();
			dao.resetPassword(email);
System.out.println("worning");
			rd = request.getRequestDispatcher("login.jsp");

			rd.forward(request, response);
		}
		
		else if (action.equalsIgnoreCase("passwordChange")) {
			try {
				UserDAO dao_new  = new UserDAOImpl();
				UserEntity user = new UserEntity();
				user.setNic(request.getParameter("username"));
				user.setPassword(request.getParameter("password"));
				dao_new.ChangePassword(user);// Send User name and Password to User DAO
				
					response.sendRedirect("login.jsp"); // Return to index page

			} finally {
				out.close();
			}
			}

	}
}
