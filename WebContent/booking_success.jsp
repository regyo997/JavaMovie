<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String transactionNo = (String)request.getAttribute("transactionNo");
%>	
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影-訂票成功</title>
	
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
  </head>
  
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
          <div class='col-md-13'>
            <h2>訂票成功!</h2>
        	<h3>交易序號: <%=transactionNo %></h3>
        	<p style="color:red;">請在電影開演前 30 分到櫃檯取票, 逾時無法取票亦不兌換, 謝謝!</p>
        	<br>
			<div style="text-align:center;">
			  <a class='btn btn-sm btn-special' id='back' href='index.jsp'>回到首頁</a>
			</div>
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