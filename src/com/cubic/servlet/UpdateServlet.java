package com.cubic.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cubic.UserBean.UserBean;
import com.cubic.dao.RegisterDAO;
import com.cubic.dao.UpdateDAO;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserBean user=new UserBean();
		user.setName(req.getParameter("uname"));
		user.setPassword(req.getParameter("pass"));
		user.setEmail(req.getParameter("email"));
		user.setId(Integer.parseInt(req.getParameter("id")));
		UpdateDAO.update(user);
		boolean status=user.isValid();
		if(status) {
			resp.sendRedirect("UpdateSuccess.jsp");
		}else
			resp.sendRedirect("index.jsp");
		
	}
}
