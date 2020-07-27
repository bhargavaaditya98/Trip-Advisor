
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="com.nit.controller.CheckOut"%>
<%@page import="com.nit.bean.CheckOutBean"%><jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>S</span>uccess Rate</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				<%
				UserDAO dao=new UserDAO();
				List<String> stations=dao.getBaseStations();
				 %>
					<form action="successRate.jsp">
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
								
					<div >
								<p><input type="submit" name="submit" class="btn btn-success" value="Submit"/></p>
							</div>
							
							<div class="clearfix"> </div>
					
				</div>
				</div> 
				<br/>
				</form>
				<%
				
				if(request.getParameter("submit")!=null)
				{
				String station=request.getParameter("station");
				
				 List<CheckOutBean> list=dao.getSuccessRate(station);
				
				
				
				
				if(list!=null && list.size()>0)
				{
				int k=0;
				for(CheckOutBean c:list)
				{
				if(c.getSuccess().equals("1"))
				k++;
				}
				
				%>
				<br/>
				<br/>
				<center>
				<h1><font color="red"><%="Success Rate is "+(k/list.size())*100%></font></h1>
				
				</center>
				
				<table class="table table-striped">
				<tr><th>BikeNo</th><th>Customer Name</th><th>Type</th><th>Time</th><th>Success</th></tr>
				
				<%
				for(CheckOutBean c:list)
				{
				
				%>
				<tr><td><%=c.getBikeNo() %></td><td><%=c.getCustomerName()%></td>
				<td><%if(c.getStatus().equals("1")){out.println("Checkout");}else out.println("CheckIn");%></td>
				<td><%=c.getTime()%></td>
				<td><%=c.getSuccess()%></td>				
				</tr>
				<%
				}
				%>
				</table>
				<%
				}
				}
				 %>
				
				
			
			
		</div> 
	</div>
	<jsp:include page="footer.jsp"></jsp:include>