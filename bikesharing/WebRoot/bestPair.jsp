
<%@page import="java.util.List"%>
<%@page import="com.nit.bean.BaseStation"%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="com.nit.bean.Bike"%>
<%@page import="java.util.Map"%><jsp:include page="header.jsp"></jsp:include>
<div id="search" class="news">   
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>B</span>est Pair of Stations</h3>
			<div class="news-agileinfo">
				<div class="col-md-4 news-w3grid">
				</div>
				<%
				UserDAO dao=new UserDAO();
				Map<String,String> list=dao.getBestPair();
				
				if(list!=null && list.size()>0)
				{
				%>
				<br/>
				<br/>
				<center>
				</center>
				<table class="table table-striped">
				<tr><th>Source Station</th><th>Destination</th></tr>
				
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
				 %>
				
				
				<div class="clearfix"> </div>
			</div> 
		</div> 
	</div>
	<jsp:include page="footer.jsp"></jsp:include>