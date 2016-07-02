package com.bit.controller;

/**
 * @author Amanda
 */
import java.io.IOException;
import javax.servlet.ServletException;
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

			rd = request.getRequestDispatcher("index.jsp");

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
		try {
			UserEntity user = new UserEntity();
			user.setNic(request.getParameter("nic"));
			user.setPassword(request.getParameter("password"));
			user =userDAO.login(user);// Send User name and Password to User DAO
			if (user.isValid()) { // Check availability of the user

				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				response.sendRedirect("dashboard.jsp"); // Redirect to Home page

			} else {
				HttpSession session = request.getSession(true);
				response.sendRedirect("login.jsp"); // Return to index page
				session.setAttribute("InvalidUser", user);
				session.setAttribute("msg", "User details not found ");
				
			}
		} finally {
			out.close();
		}

	}
}
