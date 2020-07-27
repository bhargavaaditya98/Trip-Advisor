package com.nit.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;
import com.nit.util.Constants;

public class BaseStationRegister extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	UserDAO dao=new UserDAO();
	String base=req.getParameter("baseStation");
	String near=req.getParameter("nearLocations");
	int ca=Integer.parseInt(req.getParameter("capacity"));
	String target="";
	int i;
	try {
		i = dao.registerBaseStation(base,near.replace(" ", "").toUpperCase(),ca);
		if(i>0)
		{
			 target="AdminHome.jsp?status=Registration Success";
		}
		else
		{
			 target="AdminHome.jsp?status=Registartion  Failed";
		}

	} catch (Exception e) {
		 target="AdminHome.jsp?status=Already Registered";
		e.printStackTrace();
	}

	
	RequestDispatcher r=req.getRequestDispatcher(target);
	r.forward(req, resp);
}
}
