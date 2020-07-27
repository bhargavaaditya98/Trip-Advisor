<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bikeshare</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Motorbike Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all"> 
<link href="css/font-awesome.css" rel="stylesheet"> <!-- font-awesome icons -->
<link rel="stylesheet" href="css/lightbox.css">
<!--//Custom Theme files-->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>  
<!-- //js -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Arsenal:400,400i,700,700i" rel="stylesheet"> 
<!-- //web-fonts --> 
</head> 
<body> 
	<!-- banner -->
	<div id="home" class="banner">
		<div class="banner-agileinfo">
			<!-- header -->
			<div class="header">
				<div class="container">		
					<div class="logo">
						<h1><a href="index.html">Bikeshare</a></h1>
					</div> 
					<div class="menu">
						<a href="" id="menuToggle"> <span class="navClosed"></span> </a>
						<%
						String role=(String)session.getAttribute("role");
						if(role==null)
						{
						%>
						<jsp:include page="menu.jsp"></jsp:include>
						<%
						}
						else if(role.equals("ADMIN"))
						{
						%>
						<jsp:include page="adminmenu.jsp"></jsp:include>
						<%
						}
						else if(role.equals("CUSTOMER"))
						{
						%>
						<jsp:include page="customermenu.jsp"></jsp:include>
						<%
						}else if(role.equals("BS"))
						{
						%>
						<jsp:include page="bsmenu.jsp"></jsp:include>
						<%
						}
						 %>
				
						<script>
						(function($){
							// Menu Functions
							$(document).ready(function(){
							$('#menuToggle').click(function(e){
								var $parent = $(this).parent('.menu');
							  $parent.toggleClass("open");
							  var navState = $parent.hasClass('open') ? "hide" : "show";
							  $(this).attr("title", navState + " navigation");
									// Set the timeout to the animation length in the CSS.
									setTimeout(function(){
										console.log("timeout set");
										$('#menuToggle > span').toggleClass("navClosed").toggleClass("navOpen");
									}, 200);
								e.preventDefault();
							});
						  });
						})(jQuery);
						</script>
		 
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<!-- //header -->
			<div class="banner-text">
				<div class="container">		
					<h2>Utilization-Aware Trip Advisor in <span>Bike-sharing</span> Systems Based on User Behavior Analysis </h2>
					<a href="#about" class="buy btn-wayra scroll">Login</a>
				</div> 
			</div>
		</div>
	</div>



<center>
<font color="red" size="4">
<b>

 <%
    String status=request.getParameter("status");
    if(status!=null)
    {
    	out.println(status);
    }
    %>
    </b>
    </font>
    </center>