package com.nit.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.nit.util.DbConnection;

public class DBConnectionServlet extends HttpServlet 
{
	@Override
	public void init(ServletConfig sc) throws ServletException 
	{
		DbConnection dbClass;
		ServletContext context=sc.getServletContext();
		InputStream fis=context.getResourceAsStream(sc.getInitParameter("config"));
		Properties properties=new Properties();
		try 
		{
			properties.load(fis);
		}
		catch (IOException e) 
		{
			
			e.printStackTrace();
		}
		
	
		
		dbClass =new DbConnection();
		dbClass.setProperties(properties);
		

	}

	

}
