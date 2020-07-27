
<%
String user=(String)session.getAttribute("userid");
if(user==null)
{
	response.sendRedirect("index.jsp?status=Please Login First...");
}
%>
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="java.util.List"%><jsp:include page="header.jsp"></jsp:include>
	<!-- //banner -->
	<!-- welcome -->	
	<div id="users" class="welcome">
		<div class="container"> 
			<div class="welcome-agileinfo">
				<div class="col-md-6 w3ls_welcome_left"> 
					<div class="w3ls_welcome_right1">
						<h3 class="agileits-title"><span>BS</span> Users Register</h3>
						<form action="RegisterBS">
					
							<div >
								<p><input type="text"  placeholder="username" name="userName" class="form-control" required/></p>
							</div>
							<div class="clearfix"> </div>
						
							<div>
								<p><input type="password"  placeholder="password" name="password" class="form-control" required/></p>
							</div>
							
							<div class="clearfix"> </div>
						
							<div >
								<p><input type="submit" value="Login" class="btn btn-success"/></p>
							</div>
							
							<div class="clearfix"> </div>
					
						</form>
						
						
					</div> 
				</div>
				<div class="col-md-6 w3ls_welcome_right">  	
					<div class="agileits_w3layouts_welcome_grid">
						<img src="images/img1.jpg" alt=" " class="img-responsive" />
					</div> 
				</div> 
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //welcome -->	
	<!-- slid -->
	
	<!-- //slid -->
	<!-- services -->
	<div id="services" class="services">
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>S</span>ervices</h3>
			<div class="services-row-agileinfo">
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-heart hi-icon" aria-hidden="true"></span>
					<h5><A href="balanceBike.jsp">Balance Bike Usage</A></h5>
					<p>get bikes for every half an hour and minute wise also </p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-wrench hi-icon" aria-hidden="true"></span>
					<h5><A href="noService.jsp">No Service</A></h5>
					<p>somtimes user will get service not available</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-bell hi-icon" aria-hidden="true"></span>
					<h5><A href="successRate.jsp">Fine grained </A></h5>
					<p>Success Rate at arriving time</p>
				</div> 
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-motorcycle hi-icon" aria-hidden="true"></span>
					<h5><a href="frequentUsers.jsp">Frequent Users</a></h5>
					<p>Display Frequent Customers List</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-check-square-o hi-icon" aria-hidden="true"></span>
					<h5><a href="bestPair.jsp">Best Pair Stations</a></h5>
					<p>User take bike from one station and return to another station.best pair stations</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-gears hi-icon" aria-hidden="true"></span>
					<h5><a href="bikeHistory.jsp">BikeHistory</a></h5>
					<p>No of Bikes rent from one station and return to other station</p>
				</div> 
				<br/>
				<div class="col-sm-4 col-xs-6 services-w3grid">
					<span class="fa fa-gears hi-icon" aria-hidden="true"></span>
					<h5><a href="tops.jsp">Tops</a></h5>
					<p>Top Bike Usage , Top Bike User</p>
				</div> 
				<div class="clearfix"> </div>
			</div> 
		 </div>
	</div>
	<!-- //services -->
	<!-- specifications -->
	

	<!-- //gallery -->
	<!-- contact -->
	<div class="contact" id="base">
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>B</span>ase station</h3>
			<div class="contact-grids">
				<div class="col-md-5 address">
					<h4>BaseStation Data</h4>
					<p class="cnt-p">basestastion contains bikes </p>
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
				<form action="BaseStationRegister" method="get">
					<input type="text" name="baseStation"
						placeholder="Basestation Name" class="form-control" required>
					<input type="number" name="capacity"
						placeholder="Station Parking Capacity" class="form-control" required>
					<br/>
					<textarea placeholder="Near Locations ex:Ameerpet,S.R Nager"
						name="nearLocations" class="form-control" required></textarea>
					<input type="submit" value="SUBMIT">
				</form>
			</div>
				<div class="clearfix"> </div>	
			</div>
			
		</div>
	</div>
	<br/>
	<br/>
	<br/>
	
	
	
	<div class="contact" id="bike">
		<div class="container"> 
			<h3 class="agileits-title w3title2"><span>B</span>ike Registration</h3>
			<div class="contact-grids">
				<div class="col-md-5 address">
					<h4>Bike Data</h4>
					<p class="cnt-p">Bike complete information</p>
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
					<form action="BikeRegister" method="post" enctype="multipart/form-data">
						<input type="text" name="bikeNo" placeholder="Bike No" class="form-control" required>
						
						<input type="text" name="bikeModel" placeholder="Bike Model" class="form-control" required>
						<input type="text" name="bikeYear" placeholder="Bike Year" class="form-control" required>
						<input type="file" name="image" placeholder="Bike No" class="form-control" required>
								<br/>
						<textarea placeholder="Bike Description" name="desc" class="form-control"></textarea>
						<br/>
						<select name="baseStation" class="form-control" required>
						<option value="">Select BaseStation</option>
						
						<%
						UserDAO dao=new UserDAO();
						List<String> stations=dao.getBaseStations();
						if(stations!=null && !stations.isEmpty())
						{
						for(String s:stations)
						{
						%>
						<option><%=s %></option>
						<%
						
						}
						}
						 %>
						</select>
						<input type="submit" value="SUBMIT">
					</form>
				</div>
				<div class="clearfix"> </div>	
			</div>
			
		</div>
	</div>
	
	<!-- //contact --> 
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>