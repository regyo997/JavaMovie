<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="main.tbl_view.MovieView" %>
<%@ page import="java.util.HashMap" %>

<%
	MovieView view = (MovieView)request.getAttribute("movieInfo");
%>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><%=view.getMovieName() %></title>
	
	<link
		href="https://fonts.googleapis.com/css?family=Merriweather:300,400|Montserrat:400,700"
		rel="stylesheet">
	
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
  <style>
	.info {
		text-align:center;
	    width:95%;
	}
	
	.info div {
		display: inline-block;
	    vertical-align:top;
	    text-align:left;
	}
  </style>
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
		  <div class="info" style="text-align:center;">
  	  <div><img width="70%" height="70%" src="movie_picture/<%=view.getMovieId() %>.jpg"></div>
      <div>
        <h3><%=view.getMovieName() %></h3>
        <lu>
          <li><b>導演:&nbsp;&nbsp;</b><%=view.getDirectedBy() %></li>
          <li><b>演員: </b><br>
<%
	String[] casts = view.getCast().split("、");
	for(String cast:casts){
		out.print(cast+"<br>");
	}
%>        
          </li><br>
          <li><b>級數:&nbsp;&nbsp;</b><%=view.getMovieRating() %></li>
          <li><b>片長:&nbsp;&nbsp;</b><%=view.getRuntime() %></li>
          <li><b>上映日期:&nbsp;&nbsp;</b><%=view.getReleaseDate() %></li>
        </lu>
        <br>
        <br>
        <br>
        <p><a href="#" class="btn btn-sm btn-special">前往訂票</a></p>
      </div>
      <div style="text-align:left;width:75%;"><h3><b>電影介紹</b></h3><p style="max-width:100%;">&emsp;&emsp;<%=view.getMovieInfo() %></p></div>
  	</div>
        
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