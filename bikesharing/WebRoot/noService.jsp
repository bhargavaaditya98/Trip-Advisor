
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%><jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>NO</span>Service</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				<%
				UserDAO dao=new UserDAO();
				List<String> stations=dao.getBaseStations();
				 %>
					<form action="noService.jsp">
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
								<br/>
								<input type="date"  class="form-control" name="date" required/>
								
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
				 List<String> list=dao.getNoServiceCount(station,type,date);
				
				if(list!=null && list.size()>0)
				{
				%>
				<br/>
				<br/>
				<center>
				<h1><font color="red"><%=list.size()+" "+type+" not available" %></font></h1>
				
				</center>
				<table class="table table-striped">
				<tr><th>Time</th><th>Count</th></tr>
				
				<%
				for(String s:list)
				{
				
				%>
				<tr><td><%=s %></td><td><%=1%></td>
				</tr>
				<%
				}
				%>
				</table>
				<%
				}
				}
				 %>
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	<jsp:include page="footer.jsp"></jsp:include>