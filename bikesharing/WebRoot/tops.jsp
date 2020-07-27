
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="java.util.Map"%>
<%@page import="com.nit.bean.BikeHistory"%>
<%@page import="java.util.Set"%>

<%@page import="java.util.Iterator"%>
<jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>T</span>op Bike Details</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				</div>
				<%
				UserDAO dao=new UserDAO();
				Map<String,Integer> bike=dao.getTopBike();
				
				if(bike!=null && bike.size()>0)
				{
				Set<String> s=bike.keySet();
				%>
				<br/>
				<br/>
				<center>
				</center>
				<table class="table table-striped">
				<tr><th>Bike No</th><th>Count</th></tr>
				<%
				for(String st:s)
				{
				 %>
				
				<tr><td><%= st%></td><td><%=bike.get(st)%></td>
				</tr>
				<%
				}
				}
				%>
				</table>
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	
	
	
	
	
	<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>T</span>op User Details</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				</div>
				<%
				
				Map<String,Integer> user=dao.getTopUser();
				
				if(user!=null && user.size()>0)
				{
				Set<String> s=user.keySet();
				%>
				<br/>
				<br/>
				<center>
				</center>
				<table class="table table-striped">
				<tr><th>UserName</th><th>Count</th></tr>
				<%
				for(String st:s)
				{
				 %>
				
				<tr><td><%= st%></td><td><%=user.get(st)%></td>
				</tr>
				<%
				}
				}
				%>
				</table>
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	
	
	
	<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>S</span>ervice Not Available Time</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				</div>
				<%
				
				List<String> stations=dao.getBaseStations();
				 %>
					<form action="tops.jsp">
					<div >
								
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
								<select name="type" class="form-control" required>
					<option value="">Select Type</option>
					
					<option>bike</option>
					<option>slot</option>
					
					</select>
							
							</div>
							
							<div class="clearfix"> </div>
					<br/>
					<div >
								<p><input type="submit" name="submit" class="btn btn-success" value="Submit"/></p>
							</div>
							
							<div class="clearfix"> </div>
					
				</div>
				<br/>
				</form>
				<%
				
				if(request.getParameter("submit")!=null)
				{
				String station=request.getParameter("station");
				String type=request.getParameter("type");
				
				 int hours=dao.getNoServiceTime(station,type);
				
				if(hours!=0)
				{
				
				%>
				<br/>
				<br/>
				<center>
				<font color="red"><b><%=hours+" to "+(hours+1)+" "+type+" service not availbel in "+station  %></b></font>
				</center>
				<%
				}
				else
				{
				%>
				
				<font color="red"><b><%="Result Not Found" %></b></font>
				
				<div class="clearfix"> </div>
				<%
				}
				}
				 %>
			</div> 
		</div> 
	</div>
	
	
	
	<jsp:include page="footer.jsp"></jsp:include>