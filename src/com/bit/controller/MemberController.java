package com.bit.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bit.dao.MemberDAO;
import com.bit.dao.MemberDAOImpl;
import com.bit.dao.UserDAO;
import com.bit.dao.UserDAOImpl;
import com.bit.entity.MemberEntity;
import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.bit.util.*;
import com.google.gson.Gson;

@WebServlet(urlPatterns = "/MemberCon")
public class MemberController extends HttpServlet {
	private static String INSERT_OR_EDIT = "/member_form.jsp";
	private static String LIST_USER = "/member_list.jsp";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = req.getParameter("action");
		String forward = "";
		MemberDAO dao = new MemberDAOImpl();

		if (action.equalsIgnoreCase("list")) {
			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;

		}else if (action.equalsIgnoreCase("members")) {
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
		
		 else if (action.equalsIgnoreCase("user_details")) {
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
		 else if (action.equalsIgnoreCase("get_image")) {
				MemberDAO memberdao = new MemberDAOImpl();
				String userId = req.getParameter("user_id");
				//UserEntity user = userDao.getImagePath(userId);
				String img_path=memberdao.getImagePath(userId);
				
				try (PrintWriter out = resp.getWriter()) {
					resp.setContentType("application/json");
					resp.setCharacterEncoding("UTF-8");

					//out.write("{ \"record\": \"" + img_path + "\"}");
					out.write( img_path );

					out.flush();
					out.close();
					return;
				}

			} 
		
		else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
			Methods method = new Methods();
			String generateID = method.generateID("M", "member_id", "member_tbl");
			req.setAttribute("member_id", generateID);

			List<UserEntity> users = dao.getAllUsersbyMember();
			req.setAttribute("users", users);

		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			String member_id = req.getParameter("member_id");

			List<UserEntity> users = dao.getAllUsersbyMember();
			req.setAttribute("users", users);
			
			MemberEntity member = dao.getMemberById(member_id);
			req.setAttribute("memObject", member);

		} else if (action.equalsIgnoreCase("deactive")) {

			String member_id = req.getParameter("member_id");
			dao.deactivate(member_id);

			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;

		} else if (action.equalsIgnoreCase("active")) {

			String member_id = req.getParameter("member_id");
			dao.activate(member_id);

			List<MemberEntity> list = dao.getAllMembers();
			req.setAttribute("members", list);
			forward = LIST_USER;
		}
		if (forward != "") {
			RequestDispatcher view = req.getRequestDispatcher(forward);
			view.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberEntity member = new MemberEntity();
		Methods method=new Methods();
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		System.out.println(isMultipart);
		if (isMultipart) {
			// Create a factory for disk-based file items
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			try {
				// Parse the request
				List /* FileItem */ items = upload.parseRequest(req);
				Iterator iterator = items.iterator();
				String img_path = "";
				while (iterator.hasNext()) {
					FileItem item = (FileItem) iterator.next();
					if (!item.isFormField()) {
						
						String fileName="";
						if(item.getContentType().equalsIgnoreCase("image/jpeg")){
						fileName = member.getUser_id()+".jpg";
						}else if(item.getContentType().equalsIgnoreCase("image/png")){
							fileName = member.getUser_id()+".png";
						}else{
							//return false;
						}
						String root = getServletContext().getRealPath("\\");
					//	File path = new File("C:\\Users\\amantha\\git\\Gym\\WebContent\\uploads");
                          File path = new File(root + "\\uploads\\");
						if (!path.exists()) {
							boolean status = path.mkdirs();
						}

						File uploadedFile = new File(path + "\\" + fileName);
						//img_path = "C:\\Users\\amantha\\git\\Gym\\WebContent\\uploads\\" + fileName;									 
						img_path = "/uploads/" + fileName;
						System.out.println(uploadedFile.getAbsolutePath());
						item.write(uploadedFile);
					}

					if (item.isFormField()) {
						String name = item.getFieldName();
						String value = item.getString();
						System.out.println("fields : " + name + " " + value);
						if (name.equalsIgnoreCase("user_id")) {
							member.setUser_id(value);
						}
						
					}
				}
				

				MemberDAO dao = new MemberDAOImpl();
				dao.updateImage(member.getUser_id(), img_path);
				
				PrintWriter out=resp.getWriter();
				out.print(true);
				out.flush();
				//resp.sendRedirect("MemberCon?action=list");
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
