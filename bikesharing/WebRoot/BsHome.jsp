<%
String user=(String)session.getAttribute("userid");
if(user==null)
{
	response.sendRedirect("index.jsp?status=Please Login First...");
}
%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="com.nit.controller.CheckOut"%>
<%@page import="com.nit.bean.CheckOutBean"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="com.nit.util.Constants"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="java.util.Map"%><jsp:include page="header.jsp"></jsp:include>
	<!-- //banner -->
	<!-- welcome -->	
	
	<div class="contact" id="checkout">
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>C</span>heckout</h3>
			<div class="contact-grids">
				<div class="col-md-5 address">
					<h4>Checkout Data</h4>
					<%
					UserDAO dao=new UserDAO();
					List<String> users=dao.getUsers();
					List<Bike> bikes=dao.getBikes();
					List<String> stations=dao.getBaseStations();
					System.out.println("users-----"+users.size());
					System.out.println("users-----"+bikes.size());
					 %>
					<p class="cnt-p">customer checkout bike </p>
					<div class="agile_social_icons">
						<ul class="agileits_social_list">
							<li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
						</ul>
					</div>  
					
				</div>
				<div class="col-md-7 contact-form">
				<form action="BsHome.jsp" method="get">
				
					<select name="customerName" class="form-control" required>
					<option value="">Select Customer</option>
					<%
					if(users!=null)
					{
					for(String s:users)
					{
					%>
					<option><%=s %></option>
					<%
					}
					}
					 %>
					
					</select>
					<br/>
					<select name="station" class="form-control" required>
					<option value="">Select Station</option>
					<%
					
					for(String s:stations)
					{
					%>
					
					<option><%=s %></option>
					<%
					}
					
					 %>
					
					</select>
					<br />
					
					<input type="submit" name="s" value="Get Bikes">
					</form>
				<form action="CheckOut" method="get">
				<input type="hidden" name="customerName" value="<%=request.getParameter("customerName") %>"/>
				<input type="hidden" name="station" value="<%=request.getParameter("station") %>"/>
					<%
					String ss=request.getParameter("s");
					String bs=request.getParameter("station");
					System.out.println("bs---"+bs);
					
					if(ss!=null)
					{
					
					%>
					
					
					<br/>
					<select name="bikeNo" class="form-control" required>
					<option value="">Select Bike</option>
					<%
					
					for(Bike s:bikes)
					{
					System.out.println("bs11---"+s.getBaseStation());
					if(s.getBaseStation().equals(bs))
					{
					
					%>
					
					<option><%=s.getBikeNo() %></option>
					<%
					}
					}
				
					%>
					</select>
					<br />
					<br/>
					<input type="text" class="form-control" name="time" placeholder="estimated destination time ex:16:30"/>
						<input type="submit" value="CHECKOUT">
					<%
					
						}
					
					 %>
					
					
					
					
					
				
				</form>
			</div>
				<div class="clearfix"> </div>	
			</div>
			
		</div>
	</div>
	<br/>
	<br/>
	<br/>
	
	
	<div class="contact" id="checkin">
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>C</span>heckIn</h3>
			<div class="contact-grids">
				<div class="col-md-5 address">
					<h4>Checkin Data</h4>
					
					<p class="cnt-p">customer checkin bike </p>
					<div class="agile_social_icons">
						<ul class="agileits_social_list">
							<li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
							<li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
						</ul>
					</div>  
					
				</div>
				<div class="col-md-7 contact-form">
				<form action="BsHome.jsp" method="get">
					<br/>
					<input type="text" placeholder="Customer Name" class="form-control" name="cName"/>
					<br/>
					
					<input type="submit" value="Get Details">
					<br/>
				</form>
				<%
				String cname=request.getParameter("cName");
				List<CheckOutBean> current=dao.getCustomerCurrent(cname);
				if(current!=null && !current.isEmpty())
				{
				for(CheckOutBean c:current)
				{
				int dis=0;
				Map<String,Integer> list=dao.getFrequentUsers();
				System.out.println("value---"+list.get(cname));
				
				
				if(list.containsKey(cname))
				{
				if(list.get(cname)>=5)
				{
				dis=10;
				}
				
				}
				Timestamp ts=new  Timestamp(new Date().getTime());
				Timestamp old=c.getTime();
				System.out.println("rs--"+ts);
				System.out.println("rs--"+old);
				
			long secs = (ts.getTime()/1000) - (old.getTime()/1000);

				
				int hours=(int)secs/3600;
				int price=(hours*Constants.MONEY)+Constants.MONEY;
				
				System.out.println("dis---"+dis);
				float val=((float)dis/100)*100;
				
				
				
				%>
				<br/>
				<br/><br/>
				<center>
				<h3><font color="red"><b>Discount-<%=val %></b></font></h3>
				
				</center>
				<form action="CheckIn">
					<select name="station" class="form-control" required>
					<option value="">Select Station</option>
					<%
					
					for(String s:stations)
					{
					%>
					
					<option><%=s %></option>
					<%
					}
					
					 %>
					
					</select>
					<br/>
				<input type="text" name="bNo" value="<%=c.getBikeNo() %>" class="form-control" readonly="readonly"/>
				<br/>
				<br/>
			
				<br/>
				<input type="text" name="time" value="<%=c.getTime() %>" class="form-control" readonly="readonly"/>
				<br/>
				<br/>
				
				
				<br/>
				<input type="text" name="time" value="<%=hours+"-hrs" %>" class="form-control" readonly="readonly"/>
				<br/>
				<br/>
				<br/>				
				
				
				<input type="text" name="time" value="<%="Rs "+(price - val)%>" class="form-control" readonly="readonly"/>
				<input type="submit" value="CheckIn">
					<br/>
					</form>
				<br/>
				<br/>
				<br/>
				<br/>
				<%
				}
				}
				
				 %>
				
				
				
			</div>
				<div class="clearfix"> </div>	
			</div>
			
		</div>
	</div>
	<br/>
	<br/>
	<br/>
	
	
	
	
	<!-- //contact --> 
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>