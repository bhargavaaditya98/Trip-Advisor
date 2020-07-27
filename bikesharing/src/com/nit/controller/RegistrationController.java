package com.nit.controller;


import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.bean.Customer;
import com.nit.dao.UserDAO;
import com.sun.org.apache.commons.beanutils.BeanUtils;

public class RegistrationController extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	Customer c=new Customer();
	Map map=req.getParameterMap();
	UserDAO dao=new UserDAO();
	String target="index.jsp";
	try {
		BeanUtils.populate(c, map);
		int i=dao.register(c);
		if(i>0)
		{
			 target="index.jsp?status=Registration Success";
		}
		
	} catch (IllegalAccessException e) {
		 target="index.jsp?status=Registration Failed or already registered";
		e.printStackTrace();
	} catch (InvocationTargetException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	catch(Exception e)
	{
		 target="index.jsp?status=Registration Failed or already registered";
	}
	RequestDispatcher r=req.getRequestDispatcher(target);
	r.forward(req, resp);
	

}
}
