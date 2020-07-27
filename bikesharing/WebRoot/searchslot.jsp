
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="java.util.Date"%><jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>S</span>earch Slot </h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
					<form action="SearchBaseStation">
					<input type="hidden" name="type" value="SLOT"/>
					<div >
								<p><input type="text"  placeholder="Current Location" name="cLocation" class="form-control"/></p>
							</div>
							
							<div class="clearfix"> </div>
					<br/>
					<div >
								<p><input type="submit"  class="btn btn-success" value="Search"/></p>
							</div>
							
							<div class="clearfix"> </div>
					
				</div>
				<br/>
				</form>
				<%
				if(session.getAttribute("stations")!=null)
				{
				List<BaseStation> list=(List)session.getAttribute("stations");
				if(list!=null && list.size()>0)
				{
				UserDAO dao=new UserDAO();
				
				%>
				<br/>
				<br/>
				<table class="table table-striped">
				<tr><th>BaseStation Name</th><th>Slots Capacity</th><th>Available Slots</th></tr>
				
				<%
				for(BaseStation bs:list)
				{
				List bks=dao.getBikesByName(bs.getName());
				%>
				<tr><td><%=bs.getName() %></td><td><%=bs.getCapacity() %></td><td><%=bs.getCapacity() - bks.size() %></td>
				<%
				if((bs.getCapacity() - bks.size())<bs.getCapacity())
				{
				
				}
				else
				{
				dao.noServiceBike(bs.getName(),new Date(),"slot");
			
				}
				 %>
				</tr>
				<%
				}
				%>
				</table>
				<%
				
				}else
				{
				%>
				<br/>
				<br/>
				<font color="red"><b>Not available</b></font>
				<%
				}
				String name=request.getParameter("name");
				if(name!=null)
				{
				UserDAO dao=new UserDAO();
				List<Bike> bikes=dao.getBikesByName(name);
				if(bikes !=null && !bikes.isEmpty())
				{
				%>
				<br/>
				<br/>
				<center><h1><font color="red"><%=name %></font></h1></center>
				<br/>
				<table class="table table-striped">
				<tr><th>Image</th><th>Bike No</th><th>Bike Model</th><th>Bike Year</th><th>Bike Desc</th></tr>
				
				<%
				int i=0;
				for(Bike bs:bikes)
				{
				i++;
				session.setAttribute(i+"img",bs.getImage());
				%>
				<tr><td><img src="image.jsp?i=<%=i %>" style="height: 100px;width: 100px;"/></td>
				<td><%=bs.getBikeNo() %></td>
				<td><%=bs.getBikeModel() %></td>
				<td><%=bs.getBikeYear() %></td>
				<td><%=bs.getBikeDesc() %></td>
				
				</tr>
				<%
				}
				%>
				</table>
				<%
				
				
				
				}
				
				
				
				}
				
				
				
				
				
				}
				
				 %>
				
				
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	<jsp:include page="footer.jsp"></jsp:include>