<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.tbl_view.BookingConfirmView"%>
	
<%
	BookingConfirmView view = (BookingConfirmView)request.getAttribute("confirmView");
%>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影</title>
	
	<link href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/animate.css"><!-- Animate.css -->
	<link rel="stylesheet" href="css/icomoon.css"><!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/themify-icons.css"><!-- Themify Icons-->
	<link rel="stylesheet" href="css/bootstrap.css"><!-- Bootstrap  -->
	
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<link rel="stylesheet" href="css/style.css"><!-- Theme style  -->
	
	<script src="js/modernizr-2.6.2.min.js"></script><!-- Modernizr JS -->
	<script src="js/jquery-1.8.3.min.js"></script>
	<style>
		.col-md-13 {
			width: 60%;
			margin: 10px 180px;
			border:solid;
			padding:20px;
			border-radius: 10px;
		}
	</style>
	<script>
	$(document).ready(function(){
		$("#back").click(function(){
			window.location.href="back?"+$("#confirmForm").serialize();
		});
		
		$("#confirm").click(function(){
			$.ajax({
				type	: 'post',
				url		: 'booking',
				data	: $("#confirmForm").serialize(),
				dataType: 'json',
				success	: function(response){
				},
				
				error	: function(xhr, ajaxOptions, thrownError){
					console.log(xhr.status+"\n"+thrownError);
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
        <div class="row">
          <div class='col-md-13'>
            <form id="confirmForm">
            <h2><%=view.getMovieName() %></h2>
            <br>
            <ul>
			    <li><label>場次:</label><p><%=view.getShowtime() %></p></li>
			    <li><label>級數:</label><p><%=view.getMovieRating() %></p></li>
			    <li><label>廳:</label><p><%=view.getHall() %></p></li>
			    <li><label>座位:</label><p>
<%	for(String seat:view.getSeats()){ 
		String[] str = seat.split("_");
		
		out.print(str[0]+" 排  "+str[1]+" 號 &emsp;");
	}
%>
				</p></li>
<%	
	int price=0, counts=0, total=0;
	for(String type:view.getTypes().keySet()){
		String[] str = view.getTypes().get(type).split("_");
		price = Integer.parseInt(str[0]);
		counts = Integer.parseInt(str[1]);
		total += price*counts;
%>			  
			    <li><label>票種:</label><p>(<%=type %>)&emsp;$<%=price %> X <%=counts %> = $<%=price*counts %></p></li>
<%}%>			  
			  
			    <li><label>總金額:</label><p>$<%=total %></p></li>
			  </ul>
			
			  <input type="hidden" name="movieId" value="<%=view.getMovieId() %>">
			  <input type="hidden" name="showtime" value="<%=view.getShowtime() %>">
			  <input type="hidden" name="seats" value="<%=view.getSeats() %>">
			  <input type="hidden" name="types" value="<%=view.getTypes() %>">
			  <input type="hidden" name="userId" value="<%=view.getUserId() %>">
			  <div style="text-align:center;"><a class="btn btn-sm btn-special" id="back">上一步</a>
			  								  <a id="confirm" class="btn btn-sm btn-special">確認</a></div>
		    </form>
          </div><!-- col-md-13 -->
        </div><!-- class="row" -->
      </div><!-- class="gtco-container" -->
      
      <%@ include file="footer.jsp" %>
    </div><!-- class="page" -->
    <div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
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