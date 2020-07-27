
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="java.util.Map"%><jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>B</span>alance Bike usage</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				<%
				UserDAO dao=new UserDAO();
				List<String> stations=dao.getBaseStations();
				 %>
					<form action="balanceBike.jsp">
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
								<input type="date"  class="form-control" name="date" required/>
								<br/>
								<select name="type" class="form-control" required>
					<option value="">Select Station</option>
					<option value="h">Half an hour</option>
					<option value="m">Minute</option>
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
				String date=request.getParameter("date");
				 Map<String,Integer> list=dao.getBalanceBikeUsage(station,date,type);
				
				if(list!=null && list.size()>0)
				{
				%>
				<br/>
				<br/>
				<center>
				
				
				</center>
				<table class="table table-striped">
				<tr><th>Time Range</th><th>Count</th></tr>
				
				<%
				for(String s:list.keySet())
				{
				
				%>
				<tr><td><%=s %></td><td><%=list.get(s)%></td>
				</tr>
				<%
				}
				%>
				</table>
				<%
				}
				else
				
				out.println("<center><br><h1><font color='red'>not available</font></h1></center>");
				}
				 %>
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	<jsp:include page="footer.jsp"></jsp:include>