<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="movie" class="main.model.Movie"></jsp:useBean>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	
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
  
  <script src="js/jquery-1.8.3.min.js"></script>
  
  <script type="text/javascript">
  	$(document).ready(function(){
		
		var select = document.getElementById("date");
		var fullDate = new Date();
		var yyyy = "";
		var MM = "";
		var dd = "";
		var date = "";
		
		for(var i=1; i<20; i++){
			fullDate.setDate(fullDate.getDate()+1);
			yyyy = fullDate.getFullYear();
			MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1) : ("0" + (fullDate.getMonth() + 1));
			dd = fullDate.getDate() < 10 ? ("0"+fullDate.getDate()) : fullDate.getDate();
			date = yyyy + "-" + MM + "-" + dd;
			select.options.add(new Option(date,date));
		}
	});
  </script>
  </head>
  
  <body>
    <div id="page">
      <div class="gtco-section">
        <div class="gtco-container">
          <div class="row">
          <form method="post" action="/JavaMovie/showtimeAdd">
			電影：<select name="id">
<%
	ArrayList<String> movieIds = movie.getMovieIds();
	for(String id:movieIds){
%>
					<option><%=id %></option>
<%} %>
				</select><br>
      		日期：<select id="date" name="date"></select><br>
      		時間：<select id="showtime" name="time">
      				<option>09:20</option>
      				<option>10:40</option>
      				<option>12:00</option>
      				<option>13:40</option>
      				<option>14:20</option>
      				<option>15:50</option>
      				<option>17:10</option>
      				<option>18:30</option>
      				<option>19:50</option>
      				<option>20:10</option>
      				<option>21:00</option>
      				<option>21:40</option>
      				<option>22:30</option>
      				<option>23:40</option>
      			</select><br>
      		廳：	<select name="hall">
      				<option>01</option>
      				<option>02</option>
      				<option>03</option>
      		    </select><br>
      		
      		<input type="submit" value="新增" id="add"> 
    	  </form> 
        
          </div><!-- class="row" -->
        </div><!-- class="gtco-container" -->
      </div><!-- class="gtco-section" -->
      
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