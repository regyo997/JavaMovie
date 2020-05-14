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
			var cart = $('#selected-seats');
		    var counter = $('#counter');
		    var total = $('#total');
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
						price:200,
						classes : 'front-seat', //your custom CSS class
						category:'一般'
					}
				},
				naming:{
					columns: ['1', '2', '', '3', '4', '5', '6', '7', '8', '', '9', '10'],
					rows: ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J']
				},
				click: function () {
					if (this.status() == 'available') {
						//do some stuff, i.e. add to the cart
						$('<li>('+this.data().category+')'+(this.settings.row+1)+'排'+this.settings.label+'號'+': <b>$'+this.data().price+'</b></li>')
						.attr('id','cart-item-'+this.settings.id)
						.data('seatId',this.settings.id)
						.appendTo(cart);
						
						counter.text(sc.find('selected').length+1);
						total.text(recalculateTotal(sc)+this.data().price);

						return 'selected';
					} else if (this.status() == 'selected') {
						//seat has been vacated
						//update the counter
			            counter.text(sc.find('selected').length-1);
			            //and total
			            total.text(recalculateTotal(sc)-this.data().price);
			         
			            //remove the item from our cart
			            $('#cart-item-'+this.settings.id).remove();
			         
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
			
			function recalculateTotal(sc) {
				var total = 0;
				 
				sc.find('selected').each(function () {
				  total +=this.data().price;
				});
				   
				return total;
			}
			
			//setInterval(function() {
				$.ajax({
					type     : 'get',
					url      : 'seatQuery',
					dataType : 'json',
					success  : function(response) {
						var key = response["key"];
						var row = "";
						var col = "";
						var occupied = "";
						
						//iterate through all bookings for our event 
						$.each(key, function(index, view) {
							//find seat by id and set its status to unavailable
							row=view.row;
							col=view.no;
							occupied = view.occupied;
							if(occupied == 'Y'){
							console.log(row+'_'+col);
								sc.status(row+'_'+col, 'unavailable');
							}else{
							console.log(row+'_'+col);
								sc.status(row+'_'+col, 'available');
							}
						});
					}
				});
			//}, 10000); //every 10 seconds
		});
	</script>
  </head>
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-section">
        <div class="gtco-container">
          <div class="row">
          
			<div class="col-md-5 col-md-push-1 gtco-testimonials">
			  <div id="seat-map"><div>座位表</div></div>
		  	</div>
			<div class="col-md-5 col-md-push-1 gtco-testimonials">
			  <div>
  				<h2>購物清單</h2>
  				<h3> 已選票數 (<span id="counter">0</span>):</h3>
  				<ul id="selected-seats"></ul>
  				總金額: <b>$<span id="total">0</span></b><br>
  				<button class="btn btn-sm btn-special">結帳 &raquo;</button>
  				<div id="legend"></div>
			  </div>
		  	</div>
        
          </div><!-- class="row" -->
        </div><!-- class="gtco-container" -->
      </div><!-- class="gtco-section" -->
      
      <%@ include file="footer.jsp" %>
    </div><!-- class="page" -->
    <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery <script src="js/jquery.min.js"></script> -->
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