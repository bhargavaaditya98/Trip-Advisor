<%
String user=(String)session.getAttribute("userid");
if(user==null)
{
	response.sendRedirect("index.jsp?status=Please Login First...");
}
%>
<jsp:include page="header.jsp"></jsp:include>
	
	<div class="slid jarallax" id="cust">
		<div class="slid-text">
			<h4>24/7 Customer Service Support</h4>
			<p>Proin tincidunt sodales faucibus. Curabitur ut metus sed urna dignissim sodales ac a tellus. Sed varius justo tellus, at convallis libero cursus non. In malesuada accumsan felis, a imperdiet arcu blandit sed. Ut id faucibus eros. Fusce sed vulputate dui, non consectetur felis. Etiam id enim sem. Suspendisse commodo tempor magna </p>
		</div>
		<div class="clearfix"> </div>
	</div>
	<!-- //slid -->
	<!-- services -->
	
	<div class="gallery" id="gallery">	 
		<h3 class="agileits-title w3title2"><span>G</span>allery</h3>
		<div class="gallery-info">	
			<div class="col-sm-6 gallery-grids glry-grid1">
				<div class="gallery-grids-top">
					<a class="b-link-stripe b-animate-go" href="images/g3.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
						<img src="images/g3.jpg" class="img-responsive" alt=""/>
						<div class="b-wrapper">
							<span class="b-animate b-from-left"> 
								<i class="fa fa-arrows-alt" aria-hidden="true"></i>
							</span>					
						</div>
					</a>
				</div>
				<div class="gallery-grids-top">
					<div class="col-sm-6 col-xs-6 bottom-grids">
						<a class="b-link-stripe b-animate-go" href="images/img2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
							<img src="images/img2.jpg" class="img-responsive" alt=""/>
							<div class="b-wrapper">
								<span class="b-animate b-from-left">
									<i class="fa fa-arrows-alt" aria-hidden="true"></i>
								</span>					
							</div>
						</a>
					</div>
					<div class="col-sm-6 col-xs-6 bottom-grids">
						<a class="b-link-stripe b-animate-go" href="images/img4.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
							<img src="images/img4.jpg" class="img-responsive" alt=""/>
							<div class="b-wrapper">
								<span class="b-animate b-from-left">
									<i class="fa fa-arrows-alt" aria-hidden="true"></i>
								</span>					
							</div>
						</a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-sm-3 col-xs-6 gallery-grids glry-grid2">
				<a class="b-link-stripe b-animate-go" href="images/g2.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
					<img src="images/g2.jpg" class="img-responsive" alt=""/>
					<div class="b-wrapper">
						<span class="b-animate b-from-left">
							<i class="fa fa-arrows-alt" aria-hidden="true"></i>
						</span>					
					</div>
				</a>
			</div>
			<div class="col-sm-3 col-xs-6 gallery-grids glry-grid3">
				<a class="b-link-stripe b-animate-go" href="images/g1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
					<img src="images/g1.jpg" class="img-responsive" alt=""/>
					<div class="b-wrapper">
						<span class="b-animate b-from-left">
							<i class="fa fa-arrows-alt" aria-hidden="true"></i>
						</span>					
					</div>
				</a>
				<a class="b-link-stripe b-animate-go" href="images/img1.jpg" data-lightbox="example-set" data-title="Lorem Ipsum is simply dummy the when an unknown galley of type and scrambled it to make a type specimen book It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ">
					<img src="images/img1.jpg" class="img-responsive" alt=""/>
					<div class="b-wrapper">
						<span class="b-animate b-from-left">
							<i class="fa fa-arrows-alt" aria-hidden="true"></i>
						</span>					
					</div>
				</a>
			</div>
			<div class="clearfix"></div>
			<script src="js/lightbox-plus-jquery.min.js"> </script>
		</div>
	</div>
	<!-- //gallery -->
	
	<!-- //contact --> 
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>