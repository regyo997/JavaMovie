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
	<title>爪蛙免費電影-關於爪蛙</title>
	
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
	
  </head>
  
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
          <h2><%=view.getMovieName() %></h2>
          <ul>
			  <li><label>場次:&emsp;</label><p><%=view.getShowtime() %></p></li>
			  <li><label>級數:&emsp;</label><p><%=view.getMovieRating() %></p></li>
			  <li><label>廳:&emsp;</label><p><%=view.getHall() %></p></li>
			  <li><label>座位:&emsp;</label><p>&emsp;排 &emsp;號</p></li>
			  <li><label>票種:&emsp;</label><p></p></li>
			  <li><label>總金額:&emsp;</label><p></p></li>
			</ul>
			
			<input type="button" class="btn btn-sm btn-special" value="上一步" >
			<input type="button" class="btn btn-sm btn-special" value="確認" id="confirm">
        
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