package com.nit.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class CheckIn extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	String bno=req.getParameter("bNo");
	String station=req.getParameter("station");
	
	UserDAO dao=new UserDAO();
	String  target="";

	int i=dao.checkIn(bno,station);
	if(i>0)
	{
		target="BsHome.jsp?status=Successfully ChekckIn";
	}
	else
	{
		target="BsHome.jsp?status=Something went wrong or Slots not availble";
	}
	
	

RequestDispatcher re=req.getRequestDispatcher(target);
re.forward(req, resp);
	}
}
