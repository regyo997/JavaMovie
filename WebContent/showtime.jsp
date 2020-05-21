<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.tbl_view.MovieShowTimeView"%>
<%@ page import="java.util.ArrayList"%>
<%
	ArrayList<MovieShowTimeView> views
			= (ArrayList<MovieShowTimeView>)request.getAttribute("movieShowtimeViews");
%>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影-電影場次</title>
	
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
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
<%
	if(views == null){
		out.print("data is null.");
	}else{
		for(MovieShowTimeView view:views){
%>
	  <div class="gtco-section">
        <div class="gtco-container">
          <div class="row">
		    <div class="col-md-5 col-md-push-1 gtco-testimonials">
		  	  <img width="70%" height="70%" src="movie_picture/<%=view.getMovieId() %>.jpg">
		  	</div>
  		    <div class="col-md-5 col-md-push-1 gtco-testimonials">
		  	  <h3><%=view.getMovieName() %></h3>
		  	  <lu>
		  	    <li>上映日期: <%=view.getReleaseDate() %></li>
		  	    <li>片長: <%=view.getRuntime() %></li>
		  	    <li>級數: <%=view.getMovieRating() %></li>
		  	  </lu>
		  	  <p>
		  	  <div><a href="http://localhost:8080/JavaMovie/movieInfo?id=<%=view.getMovieId() %>" class="btn btn-sm btn-special">電影介紹</a></div>
		  	  <br><br>
<%
			for(String date:view.getShowtimes().keySet()){
				out.print("<br><label style='color:red'>"+date+"</label><br>");
				for(String time:view.getShowtimes().get(date)){
					out.print("<label>"+time+" | </label>");
				}
			}
%>
            </div><!-- class="col-md-5 col-md-push-1 gtco-testimonials" -->
          </div><!-- class="row" -->
        </div><!-- class="gtco-container" -->
      </div><!-- class="gtco-section" -->
<%
		}
	}
%>
      
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