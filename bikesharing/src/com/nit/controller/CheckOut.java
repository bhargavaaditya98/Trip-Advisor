package com.nit.controller;


import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class CheckOut extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String customer=req.getParameter("customerName");
		String bkNo=req.getParameter("bikeNo");
		String station=req.getParameter("station");
		String time[]=req.getParameter("time").split(":");
		Calendar c=Calendar.getInstance();
		
		Date d=new Date();
		d.setHours(Integer.parseInt(time[0]));
		d.setMinutes(Integer.parseInt(time[1]));
		c.setTime(d);
		UserDAO dao=new UserDAO();
		String  target="";
	
		int i=dao.checkOut(bkNo,customer,station,c.getTime());
		if(i>0)
		{
			target="BsHome.jsp?status=Successfully Checkcout";
		}
		else
		{
			target="BsHome.jsp?status=Something went wrong";
		}
		
		

	RequestDispatcher re=req.getRequestDispatcher(target);
	re.forward(req, resp);
		}
	

}
