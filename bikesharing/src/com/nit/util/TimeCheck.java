package com.nit.util;


import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.management.j2ee.statistics.TimeStatistic;


public class TimeCheck {
	public static void main(String[] args) throws InterruptedException {
		Calendar c=Calendar.getInstance();
		Date d=new Date();
		d.setHours(18);
		d.setMinutes(20);
		c.setTime(d);
		
		Timestamp t=new Timestamp(c.getTime().getTime());
		Timestamp t1=new Timestamp(new Date().getTime());
		
		System.out.println(t1.getTime()-t.getTime());
		
		
		
	}

}
