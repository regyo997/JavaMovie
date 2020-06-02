<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影-選擇座位</title>
	<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/animate.css"><!-- Animate.css -->
	<link rel="stylesheet" href="css/icomoon.css"><!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/themify-icons.css"><!-- Themify Icons-->
	<link rel="stylesheet" href="css/bootstrap.css"><!-- Bootstrap  -->
	
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/style.css"><!-- Theme style  -->
	
	<link rel="stylesheet" href="css/jquery.seat-charts.css">
	
	<script src="js/modernizr-2.6.2.min.js"></script><!-- Modernizr JS -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.seat-charts.min.js"></script>
	<script src="js/jquery.seat-charts.js"></script>
	
	<style>
		.zi_box_1 {
			border: 2px solid rgba(0, 0, 0, 0.1); /* 框線顏色 */
			border-radius: 4px;
			padding: 20px;
			position: relative;
			box-shadow: 0 0 5px 2px rgba(116, 251, 31, 0.56) inset; /*陰影*/
			height: 240px;
			width: 80%;
			margin: 0 90px;
		}
	</style>
	
	<script type="text/javascript">
	function changeCount(){
		var totalCount=0, totalPrice=0, price=0, count = 0;
        var type = "";
        var str = "";
        
        $('#selected-seats').empty();
        for(var i=0; i<$('#ticketTypes tr').length; i++){
        	type = $('#ticketTypes tr:eq('+i+') td:eq(0)').attr('value');
        	price = $('#ticketTypes tr:eq('+i+') td:eq(1)').attr('value');
        	count = $('#ticketTypes tr:eq('+i+') .count').val();
        	if(count != 0){
        		str+="<li>"+type+" "+price+" x "+count+"</li>";
        	}
        	
        	totalCount += parseInt(count);
        	totalPrice += parseInt(count)*parseInt(price);
        }
        $(str).appendTo($('#selected-seats'));
        
        $("#totalCount").html(totalCount);
        $('#total').text(totalPrice);
	}
	
	$(document).ready(function(){
		var cart = $('#selected-seats');
	    var total = $('#total');
		var sc = $('#seat-map').seatCharts({
			map: [
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
					category:'全票'
				}
			},
			naming:{
				columns: ['1', '2', '', '3', '4', '5', '6', '7', '8', '', '9', '10'],
				rows: ['A', 'B', 'C', 'D', 'E', 'F', 'G']
			},
			legend : {
				node : $('#legend'),
				items : [
					['a','available',  '可選' ],
					['a','selected',  '您的座位'],
					['a','unavailable','已售']
				]        
			},
			click: function () {
				if (this.status() == 'available') {
					//do some stuff, i.e. add to the cart
					var length = sc.find('selected').length+1;
					var totalCount = $("#totalCount").html();
					
					if(length == totalCount){
						$("#checkOut").val("結帳").prop('disabled', false);
						//counter.text(length+1);
						return 'selected';
					}else if(length < totalCount){
						$("#checkOut").val("結帳").prop('disabled', false);
						$("#checkOut").val("已選座位: "+length);
						//counter.text(length+1);
						return 'selected';
					}else if(length > totalCount){
						//$('<li>('+this.data().category+') '+(this.settings.row+1)+' 排'+this.settings.label+' 號'+': <b>$'+this.data().price+'</b></li>')
						//.attr('id','cart-item-'+this.settings.id)
						//.data('seatId',this.settings.id)
						//.appendTo(cart);
						alert("超過票數");
						$("#checkOut").val("結帳").prop('disabled', false);
						
						return 'available';
					}

				} else if (this.status() == 'selected') {
		            //remove the item from our cart
		            //$('#cart-item-'+this.settings.id).remove();
		         
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
		
		getSeatChart();
		
		function getSeatChart(){
			$.ajax({
				type     : 'post',
				url      : 'seatQuery',
				data	 : {"id":"<%=request.getParameter("id")%>","showtime":"<%=request.getParameter("showtime")%>"},
				dataType : 'json',
				async	 : false,
				success  : function(response) {
					var seatViews = response["seatViews"];
					var movieView = response["movieViews"];
					var type = response["ticketType"];
					var row = "";
					var col = "";
					var occupied = "";
					
					//movie info
					$("#name_h").text(movieView[0].movieName);
					$("#showtime_label").text(seatViews[0].showtime);
					$("#runtime_label").text(movieView[0].runtime);
					$("#rating_label").text(movieView[0].movieRating);
					$("#hall_label").text(seatViews[0].hall);
					
					$("#id").val(movieView[0].movieId);
					$("#showtime").val(seatViews[0].showtime);
					$("#rating").val(movieView[0].movieRating);
					$("#hall").val(seatViews[0].hall);
					
					var str="";
					$.each(type, function(type, price) {
						//console.log(type);
						str+="<tr style='height:50px;'>";
						str+="<td value='"+type+"'>"+type+"</td>";
						str+="<td class='price' value='"+price+"'>TWD "+price+"</td><td></td>";
						str+="<td><select class='count' name='count_"+price+"' id='count_"+price+"' onchange='changeCount()'>";
						for(var i=0; i<6; i++){
							str+="<option>"+i+"</option>";
						}
						str+="</select></td></tr>";
						$("#ticketTypes").html(str);
					});
					
					//iterate through all bookings for our event 
					$.each(seatViews, function(index, view) {
						//find seat by id and set its status to unavailable
						row=view.row;
						col=view.no;
						occupied = view.occupied;
						if(occupied == 'Y'){
							sc.status(row+'_'+col, 'unavailable');
						}else{
							sc.status(row+'_'+col, 'available');
						}
					});
				}
			});
		}
		
		function recalculateTotal(sc) {
			var total = 0;
			 
			sc.find('selected').each(function () {
			  total +=this.data().price;
			});
			   
			return total;
		}
		
		function getLength(){
			return sc.find('selected').length;
		}
		
		$("#checkOut").on("click",function(){
			var seats=[];
			var types=[];
			var type = "";
			var price = 0;
			var counts = 0;
			
			sc.find('selected').each(function () {
				seats.push({"row":this.settings.id.substring(0,1),"col":this.settings.label});
			});
			
			for(var i=0; i<$('#ticketTypes tr').length; i++){
	        	type = $('#ticketTypes tr:eq('+i+') td:eq(0)').attr('value');
	        	price = $('#ticketTypes tr:eq('+i+') td:eq(1)').attr('value');
	        	count = $('#ticketTypes tr:eq('+i+') .count').val();
	        	if(count != 0){
	        		types.push({type:type,price:price,count:count});
	        	}
	        }
			
			$("#seats").val(JSON.stringify(seats));
			$("#types").val(JSON.stringify(types));
			
			$.ajax({
				type     : 'post',
				url      : 'checkSeats',
				data	 : $("#myform").serialize(),
				dataType : 'json',
				success  : function(response) {
					var occupied = response["occupied"];
					if(occupied == 'Y'){
						alert('座位已被選走，請重新選擇');
						getSeatChart();
					}else{
						window.location.href="bookingConfirm?"+$("#myform").serialize();
					}
					
				},
			
				error:function(xhr, ajaxOptions, thrownError){
	                console.log(xhr.status);
	                console.log(thrownError);
	            }
			});
		});
	});
	
	</script>
  </head>
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row" id="row">
      	<form id="myform" method="post" action="JavaMovie/bookingConfirm">
          <div class="zi_box_1">
			<h2 id="name_h"></h2>
			<input id="id" name="id" type="hidden" value="">
			<ul>
			  <li><label>場次:&emsp;</label><label id="showtime_label"></label></li>
			  <li><label>片長:&emsp;</label><label id="runtime_label"></label></li>
			  <li><label>級數:&emsp;</label><label id="rating_label"></label></li>
			  <li><label>廳:&emsp;</label><label id="hall_label"></label></li>
			</ul>
			  <input id="showtime" name="showtime" type="hidden" value="">
			  <input id="rating" name="rating" type="hidden" value="">
			  <input id="hall" name="hall" type="hidden" value="">
		  </div><br>
		  <div class="col-md-7 col-md-push-1 gtco-testimonials">
			<h3>選擇票種: </h3>
			<table style="width:600px;">
			  <thead style="background:rgba(116, 251, 31, 0.56);">
			    <tr style="height:30px;">
			      <th>票種</th>
			      <th>價錢</th>
			      <th></th>
			      <th>數量</th>
			    </tr>
			  </thead>
			  <tbody id="ticketTypes"></tbody>
			  <tfoot>
			    <tr>
			      <td></td>
			      <td></td>
			      <td>總數量:</td>
			      <td id="totalCount">0</td>
			    </tr>
			  </tfoot>
			</table>
			<br>
          	<h3>選擇座位: </h3>
			<div id="seat-map"></div>
		  </div>
		  <div class="col-md-5 col-md-push-1 gtco-testimonials" style="height:575px;">
			<div class="booking-details" style="height:575px;">
  			  <h3>購物清單</h3>
  			  <ul id="selected-seats"></ul>
  			  <br>
  			     總金額: <b>$<span id="total"> 0 </span></b>
  			  <br><br>
  			  
  			  <input id="userId" name="userId" type="hidden" value="<%=userview.getUserId() %>">
  			  <input id="seats" name="seats" type="hidden" value="">
  			  <input id="types" name="types" type="hidden" value="">
  			  
  			  <input type="button" class="btn btn-sm btn-special" id="checkOut" value="結帳 &raquo;" disabled>
  			  <div id="legend" style="position: absolute;bottom: 0;"></div>
			</div>
		  </div>
      	</form>
        </div><!-- class="row" -->
      </div><!-- class="gtco-container" -->
      <%@ include file="footer.jsp" %>
    </div><!-- class="page" -->
    <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery <script src="js/jquery.min.js"></script> -->
	<script src="js/jquery.easing.1.3.js"></script><!-- jQuery Easing -->
	<script src="js/bootstrap.min.js"></script><!-- Bootstrap -->
	<script src="js/jquery.waypoints.min.js"></script><!-- Waypoints -->
	<script src="js/owl.carousel.min.js"></script><!-- Carousel -->
	<script src="js/main.js"></script><!-- Main -->
  </body>
</html>