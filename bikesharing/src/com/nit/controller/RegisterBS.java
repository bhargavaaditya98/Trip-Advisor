package com.nit.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class RegisterBS extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	String user=req.getParameter("userName");
	String pass=req.getParameter("password");
	UserDAO dao=new UserDAO();
	String  target="";
	try
	{
	int i=dao.registerBS(user,pass);
	if(i>0)
	{
		target="AdminHome.jsp?status=Successfully uploaded";
	}
	else
	{
		target="AdminHome.jsp?status=Something went wrong";
	}
	
	}catch(Exception e)
	{
		e.printStackTrace();
		target="AdminHome.jsp?status=User Already Registered..";
	}

RequestDispatcher re=req.getRequestDispatcher(target);
re.forward(req, resp);
	}

}
