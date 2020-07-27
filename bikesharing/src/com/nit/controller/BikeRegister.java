package com.nit.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.nit.bean.Bike;
import com.nit.dao.UserDAO;

public class BikeRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Bike b=new Bike();
		UserDAO dao=new UserDAO();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		String target="registration.jsp";
		try {

			List fileItems = upload.parseRequest(req);
				
			FileItem bNo=(FileItem)fileItems.get(0);
			b.setBikeNo(bNo.getString());
		
			FileItem model=(FileItem)fileItems.get(1);
			b.setBikeModel(model.getString());
		
			
			FileItem yr=(FileItem)fileItems.get(2);
			b.setBikeYear(yr.getString());
		
			
			FileItem image=(FileItem)fileItems.get(3);
			byte[] bytes = image.get();
			b.setImage(bytes);
			

			FileItem dee=(FileItem)fileItems.get(4);
			b.setBikeDesc(dee.getString());
			
			FileItem base=(FileItem)fileItems.get(5);
			b.setBaseStation(base.getString());
			
			
			int id=dao.bikeRegister(b);
			
			if(id>0)
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
				target="AdminHome.jsp?status=Bike No Already Registered..";
			}
		
		RequestDispatcher re=req.getRequestDispatcher(target);
		re.forward(req, resp);
	}

}
