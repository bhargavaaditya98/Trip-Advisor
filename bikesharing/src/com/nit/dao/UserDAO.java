package com.nit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nit.bean.BaseStation;
import com.nit.bean.Bike;
import com.nit.bean.BikeHistory;
import com.nit.bean.CheckOutBean;
import com.nit.bean.Customer;
import com.nit.controller.CheckOut;
import com.nit.util.DbConnection;

public class UserDAO extends DbConnection {
	Connection con = null;
	boolean flag = false;
	PreparedStatement pstmt = null, pst = null;

	public UserDAO() {
		con = getConnection();
	}
	
	public int getNoServiceTime(String bs,String type) {
		int time=0;
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select t  from ( select t,mn,rownum rn from (" +
							" select t,max(cn) as mn from(" +
							" select to_char(time,'HH') as t,count(to_char(time,'HH')) as cn" +
							" from noservice where basestation=? and type=?" +
							" group by to_char(time,'HH'))" +
							" group by t) order by mn desc) where rn=1");
			pst.setString(1, bs);
			pst.setString(2, type);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				
				time=rs.getInt(1);
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return time;
		
	}
	
	
	public Map<String,Integer> getTopUser() {
		Map<String,Integer> list=new HashMap<String,Integer>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select customername,count(*) as c from checkout group by customername order by c desc");
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				
				list.put(rs.getString(1),rs.getInt(2));
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	public Map<String,Integer> getTopBike() {
		Map<String,Integer> list=new HashMap<String,Integer>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select bikeno,count(*) as c from checkout group by bikeno order by c desc");
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				
				list.put(rs.getString(1),rs.getInt(2));
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	public List<BikeHistory> getBikeHistory() {
		List<BikeHistory> list=new ArrayList<BikeHistory>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select source,destination,count(*) as c from ride group by source,destination having source!=destination order by c desc");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				BikeHistory b=new BikeHistory();
				b.setCount(rs.getInt(3));
				b.setSource(rs.getString(1));
				b.setDestination(rs.getString(2));
				list.add(b);
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	public Map<String,String> getBestPair() {
		Map<String,String> list=new HashMap<String,String>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select source,destination,count(*) as c from ride group by source,destination order by c desc");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				
				list.put(rs.getString(1),rs.getString(2));
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	public Map<String,Integer> getFrequentUsers() {
		Map<String,Integer> list=new HashMap<String,Integer>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select customername,count(*) as c from checkout group by CUSTOMERNAME order by c desc");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				
				list.put(rs.getString(1),rs.getInt(2));
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	

	public List<CheckOutBean> getSuccessRate(String bs) {
		List<CheckOutBean> list=new ArrayList<CheckOutBean>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select c.bikeno,c.customername,c.status,c.time,c.success from checkout c,bike b where c.bikeno=b.bikeno and b.basestation=?");
			pst.setString(1, bs);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CheckOutBean c=new CheckOutBean();
				c.setBikeNo(rs.getString(1));
				c.setCustomerName(rs.getString(2));
				c.setStatus(rs.getString(3));
				c.setTime(rs.getTimestamp(4));
				c.setSuccess(rs.getString(5));
				list.add(c);
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	
	
	
	public Map<String,Integer> getBalanceBikeUsage(String station,String d,String type) throws ParseException
	{
		Map<String,Integer> list=new HashMap<String,Integer>();
	
		try {
			String qry="select case when substr(cv,4,1)='5' then substr(cv,1,2)||'.30 to '||substr(cv,1,2)||'.59'" +
					" else substr(cv,1,2)||'.00 to '||substr(cv,1,2)||'.29' end as ranges, cn as countvalue" +
					" from ( select cv,count(cv) cn from ( select to_char(time,'hh.mi') gt," +
					" case when substr(to_char(time,'hh.mi'),4,1)>3 then to_char(time,'hh')||'.59'" +
					" else to_char(time,'hh')||'.00' end as cv from checkout,BIKE  where basestation=? and bike.bikeno=checkout.bikeno and to_char(time,'yyyy-MM-dd')=?)" +
					" group by cv) order by cn";
			String qry1="select * from ( select to_char(time,'hh.mi') gt,count(to_char(time,'hh.mi')) as c from checkout,BIKE" +
					" where basestation=? and bike.bikeno=checkout.bikeno" +
					" and to_char(time,'yyyy-MM-dd')=?" +
					" group by to_char(time,'hh.mi') ) order by c desc";
			
			if(type.equals("h"))
			{
			
			pst = con
					.prepareStatement(qry);
			}
			else
			{
				pst = con
				.prepareStatement(qry1);
			}
			pst.setString(1, station);
			pst.setString(2,d);
			
		ResultSet rs=	pst.executeQuery();
		while(rs.next())
		{
		list.put(rs.getString(1),rs.getInt(2));
		}
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<String> getNoServiceCount(String station,String type,String d) throws ParseException
	{
		List<String> list=new ArrayList<String>();
	
		try {
			String qry="select time,count(*) from (" +
					" select basestation,to_char(time,'yyyy-MM-dd hh.mi') as time,type from noservice)" +
					" where basestation=? and substr(time,1,10)=? and type=?" +
					" group by TIME ";

			pst = con
					.prepareStatement(qry);
			pst.setString(1, station);
			pst.setString(2,d);
			pst.setString(3, type);
		ResultSet rs=	pst.executeQuery();
		while(rs.next())
		{
		list.add(rs.getString(1));
		}
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	public void noServiceBike(String bs,Date d,String type)
	{
	
		try {
			pst = con
					.prepareStatement("insert into noservice values(?,?,?)");
			pst.setString(1, bs);
			pst.setTimestamp(2, new Timestamp(d.getTime()));
			pst.setString(3, type);
			pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void getHalfHourWise(String date)
	{
		try
		{
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	public List<CheckOutBean> getCustomerCurrent(String s) {
		List<CheckOutBean> list=new ArrayList<CheckOutBean>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select * from checkout where customername=? and status='1'");
			pst.setString(1,s);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				CheckOutBean b=new CheckOutBean();
				b.setSno(rs.getInt(1));
				b.setBikeNo(rs.getString(2));
				b.setTime(rs.getTimestamp(5));
				list.add(b);
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}
	
	public List<String> getUsers() {
		List<String> list=new ArrayList<String>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select * from logininfo where status='CUSTOMER' ");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				
				list.add(rs.getString(1));

			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
	}
	
	public List<Bike> getBikes() {
		List<Bike> list=new ArrayList<Bike>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select * from bike where status='0'");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Bike b=new Bike();
				b.setBaseStation(rs.getString(6));
				b.setBikeNo(rs.getString(1));
				b.setBikeDesc(rs.getString(2));
				b.setBikeModel(rs.getString(3));
				b.setBikeYear(rs.getString(4));
				b.setImage(rs.getBytes(5));
				list.add(b);

			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
	}
	
	
	public List<Bike> getBikesByName(String name) {
		List<Bike> list=new ArrayList<Bike>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select * from bike where basestation=?");
			pst.setString(1,name);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Bike b=new Bike();
				b.setBaseStation(name);
				b.setBikeNo(rs.getString(1));
				b.setBikeDesc(rs.getString(2));
				b.setBikeModel(rs.getString(3));
				b.setBikeYear(rs.getString(4));
				b.setImage(rs.getBytes(5));
				list.add(b);

			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
	}
	
	
	public List<String> getBaseStations() {
		List<String> list=new ArrayList<String>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select name from basestations");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));

			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
	}
	
	public int register(Customer user) {
		int i = 0;
		try {
			pst = con
					.prepareStatement("insert into logininfo values(?,?,?)");
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getPassword());
			pst.setString(3, "CUSTOMER");
			i = pst.executeUpdate();
			pst.close();
			registerCustomer(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	
	
	public int registerCustomer(Customer user) {
		int i = 0;
		try {
			pst = con
					.prepareStatement("insert into customerinfo values(?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, user.getUserName());
			pst.setString(2, user.getaNo());
			pst.setString(3, user.getAddress());
			pst.setString(4, user.getContactNo());
			pst.setString(5, user.getdNo());
			pst.setString(6, user.getEmail());
			pst.setString(7, user.getHelmet());
			pst.setString(8, user.getpNo());
			pst.setString(9, user.getPassword());
			pst.setString(10, user.getStatus());
			i = pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}
	

	public Customer loginCheck(Customer regbean) {
		String loginid = regbean.getUserName();
		String password = regbean.getPassword();
		Customer regbean1 = new Customer();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select status,username from logininfo where username=? and password=?");
			pst.setString(1, loginid);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				regbean1.setStatus(rs.getString(1));
				regbean1.setUserName(rs.getString(2));

			} else {
				flag = false;
				regbean1.setStatus("");
				regbean1.setUserName("");

			}
			pst.close();
		} catch (SQLException ex) {
			System.out.println(ex);

			flag = false;
		}

		return regbean1;
	}



	public int registerBaseStation(String base, String near,int cap) throws Exception {
		int i = 0;
		try {
			pst = con
					.prepareStatement("insert into basestations values(?,?,?,?)");
			pst.setString(1, base);
			pst.setString(2, near);
			pst.setInt(3, cap);
			pst.setInt(4, 0);
			i = pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			throw new Exception();
		}
		return i;
	}



	public int bikeRegister(Bike b) throws Exception {
		int i = 0;
		try {
			pst = con
					.prepareStatement("insert into bike values(?,?,?,?,?,?,?)");
			pst.setString(1, b.getBikeNo());
			pst.setString(2, b.getBikeDesc());
			pst.setString(3, b.getBikeModel());
			pst.setString(4, b.getBikeYear());
			pst.setBytes(5, b.getImage());
			pst.setString(6, b.getBaseStation());
			pst.setString(7, "0");
			i = pst.executeUpdate();
			pst.close();
			
			pst = con
			.prepareStatement("update basestations set avail=avail+1 where name=?");
			pst.setString(1,b.getBaseStation());
			i = pst.executeUpdate();
			pst.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception();
		}
		return i;
	}

	public List<BaseStation> searchBaseStation(String s) {
		List<BaseStation> list=new ArrayList<BaseStation>();
		try {
			con = getConnection();
			pst = con
					.prepareStatement("select * from basestations where locations like '%"+s.toUpperCase()+"%'");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				BaseStation b=new BaseStation();
				b.setCapacity(rs.getInt(3));
				b.setName(rs.getString(1));
				b.setAvail(rs.getInt(4));
				list.add(b);
			} 
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
		
	}


	public int registerBS(String user, String pass) {
		int i = 0;
		try {
			pst = con
					.prepareStatement("insert into logininfo values(?,?,?)");
			pst.setString(1, user);
			pst.setString(2, pass);
			pst.setString(3, "BS");
			i = pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int checkOut(String bkNo, String customer,String station,Date time) {
		int i = 0;
		try {
			pst = con.prepareStatement("insert into checkout values((select nvl(max(sno),0)+1 from checkout),?,?,?,?,?,?)");
			pst.setString(1, bkNo);
			pst.setString(2, customer);
			pst.setString(3, "1");
			pst.setTimestamp(4, new Timestamp(new Date().getTime()));
			pst.setTimestamp(5, new Timestamp(time.getTime()));
			pst.setString(6, "0");
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("update bike set status='1' where bikeno='"+bkNo+"'");
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("update basestations set avail=avail-1 where name='"+station+"'");
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("insert into ride(bikeno,source) values(?,?)");
			pst.setString(1, bkNo);
			pst.setString(2,station);
			pst.executeUpdate();
			pst.close();
			
			
		
			
			i++;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int checkIn(String bno, String station) {
		int i = 0;
		try {
			
			
			
			
			pst=con.prepareStatement("select avail from basestations where name=? and avail<capacity");
			pst.setString(1,station);
			ResultSet  r=pst.executeQuery();
			if(r.next())
			{
				
			
			
			pst = con.prepareStatement("update checkout set status='0' where bikeno=?");
			pst.setString(1, bno);
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("update bike set status='0',basestation=? where bikeno='"+bno+"'");
			pst.setString(1, station);
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("update basestations set avail=avail+1 where name='"+station+"'");
			pst.executeUpdate();
			pst.close();
			
			pst=con.prepareStatement("select desttime from checkout where bikeno=?");
			pst.setString(1,bno);
			ResultSet  r1=pst.executeQuery();
			if(r1.next())
			{
				Timestamp t=new Timestamp(new Date().getTime());
				long val=r1.getTimestamp(1).getTime()- t.getTime();
				System.out.println("---val"+val);
				if(val>0)
						{
					System.out.println("inside if");
					PreparedStatement p=con.prepareStatement("update checkout set success='1' where bikeno=?");
			p.setString(1, bno);
			p.executeUpdate();
			p.close();
						}
			}
			pst.close();
			
			pst=con.prepareStatement("update ride  set destination=? where bikeno=?");
			pst.setString(1,station);
			pst.setString(2,bno);
			pst.executeUpdate();
			pst.close();
			
			
			
			
			
			
			
			
			
			
			i++;
		
			}
			else
				return 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	
}
