<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="css/jquery.seat-charts.css">
	<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">
	
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">
	
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
		<script src="js/respond.min.js"></script>
		<![endif]-->
	
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.seat-charts.min.js"></script>
	<script src="js/jquery.seat-charts.js"></script>
	<script type="text/javascript">
		//var firstSeatLabel = 1;
		$(document).ready(function(){
			var sc = $('#seat-map').seatCharts({
				map: [
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa',
					'aa_aaaaaa_aa'
				],
				seats: {
					a: {
						classes : 'front-seat' //your custom CSS class
					}
				
				},
				naming:{
					columns: ['A', 'B', '', 'C', 'D', 'E', 'F', 'G', 'H', '', 'I', 'J']
				},
				click: function () {
					if (this.status() == 'available') {
						//do some stuff, i.e. add to the cart
						return 'selected';
					} else if (this.status() == 'selected') {
						//seat has been vacated
						return 'available';
					} else if (this.status() == 'unavailable') {
						//seat has been already booked
						return 'unavailable';
					} else {
						return this.style();
					}
				}
			});
		
			//Make all available 'c' seats unavailable
			sc.find('a.available').status('available');
			
			/*
			Get seats with ids 2_6, 1_7 (more on ids later on),
			put them in a jQuery set and change some css
			*/
			sc.get(['2_6', '1_7']).node().css({
				color: '#ffcfcf'
			});
			
			console.log('Seat 1_2 costs ' + sc.get('1_2').data().price + ' and is currently ' + sc.status('1_2'));
		});
	
	</script>
	
  </head>
  
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-section">
        <div class="gtco-container">
          <div class="row">

			<div id="seat-map">
  			  <div class="front-indicator">Front</div>
			</div>
			
			<div class="booking-details">
  				<h2>Booking Details</h2>
  				<h3> Selected Seats (<span id="counter">0</span>):</h3>
  				<ul id="selected-seats">
  				</ul>
  				Total: <b>$<span id="total">0</span></b>
  				<button class="checkout-button">Checkout &raquo;</button>
  				<div id="legend"></div>
			</div>
        
          </div><!-- class="row" -->
        </div><!-- class="gtco-container" -->
      </div><!-- class="gtco-section" -->
      
      <%@ include file="footer.jsp" %>
    </div><!-- class="page" -->
    <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery
	<script src="js/jquery.min.js"></script> -->
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Main -->
	<script src="js/main.js"></script>
  </body>
</html>