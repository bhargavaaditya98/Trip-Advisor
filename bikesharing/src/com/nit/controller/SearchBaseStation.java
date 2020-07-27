package com.nit.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.bean.BaseStation;
import com.nit.dao.UserDAO;

public class SearchBaseStation extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
UserDAO dao=new UserDAO();
String type=req.getParameter("type");
String target="";
if(type.equals("BS"))
{
	target="searchbasestation.jsp";
}
if(type.equals("SLOT"))
{
	target="searchslot.jsp";
}
List<BaseStation> list=dao.searchBaseStation(req.getParameter("cLocation"));
req.getSession().setAttribute("stations",list);
RequestDispatcher r=req.getRequestDispatcher(target);
r.forward(req, resp);
}
}
