package com.nit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DbConnection 
{
	public static Connection connection;
	public static Properties properties;
	
	
	public static Properties getProperties() {
		return properties;
	}
	public static void setProperties(Properties properties) {
		DbConnection.properties = properties;
	}
	
	
	public static Connection getConnection()
	{
		Properties properties=getProperties();
		try
		{
		Class.forName(properties.getProperty("driver"));
		connection = DriverManager.getConnection(properties.getProperty("url"),properties.getProperty("username"),properties.getProperty("password"));
		System.out.println("connection established..");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return connection;
	}
	
	
	
	

}
