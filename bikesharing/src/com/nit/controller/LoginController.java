package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nit.bean.Customer;
import com.nit.dao.UserDAO;

public class LoginController extends HttpServlet {
	private String utype = "";
	private String username = "";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO service = new UserDAO();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Customer rb = new Customer();
		session.setAttribute("userid", request.getParameter("userName"));
		rb.setUserName(request.getParameter("userName"));
		rb.setPassword(request.getParameter("password"));
		Customer rb1 = new Customer();
		rb1 = service.loginCheck(rb);
		utype = rb1.getStatus();
		username = rb1.getUserName();
		
		String target = "login.jsp?status=Internal Proublem Please Try again!";
		session.setAttribute("uid", request.getParameter("userName"));
		
		if (utype.equals("CUSTOMER")) {
				target = "CustomerHome.jsp?status=Welcome " + username;
				session.setAttribute("user", username);
				session.setAttribute("role", utype);

		} 
		
		else if (utype.equals("ADMIN")) {
			target = "AdminHome.jsp?status=Welcome " + username;
			session.setAttribute("user", username);
			session.setAttribute("role", utype);

	}
		else if (utype.equals("BS")) {
			target = "BsHome.jsp?status=Welcome " + username;
			session.setAttribute("user", username);
			session.setAttribute("role", utype);

	}
		
		
		else {
			target = "index.jsp?status=Invalid username and password";
		}

		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);

		out.flush();
		out.close();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doGet(request, response);
		out.flush();
		out.close();
	}

}
