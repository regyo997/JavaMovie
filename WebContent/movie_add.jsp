<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	
  </head>
  
  <body>
    <div id="page">
      <div class="gtco-section">
        <div class="gtco-container">
          <div class="row">
          <form method="post" action="/JavaMovie/movieAdd">
			id：<input type = "text" name = "id" size = "10"><p><p>
      		name：<input type = "text" name = "name" size = "40"><p>
      		rating：<input type = "text" name = "rating" size = "10"><p>
      		release_date：<input type = "text" name = "release_date" size = "15" placeholder="yyyy-mm-dd"><p>
      		runtime：<input type = "text" name = "runtime" size = "15" placeholder="02時35分"><p>
      		directed_by：<textarea name="directed_by" rows="2" cols="60"></textarea><p>
      		cast：<textarea name="cast" rows="5" cols="60"></textarea><p>
      		info：<textarea name="info" rows="10" cols="60"></textarea><p>
      		<input type="submit" value="傳送"> 
      		<input type="reset" value="取消"> 
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