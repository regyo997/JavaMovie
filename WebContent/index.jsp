<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="main.tbl_view.NewsView" %>

<jsp:useBean id="movie" class="main.model.Movie"></jsp:useBean>
<jsp:useBean id="news" class="main.model.News"></jsp:useBean>

<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影</title>

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
	
	<style>
	.news {
    text-overflow : ellipsis;
    overflow:hidden;
    display: -webkit-box;
    -webkit-box-orient:vertical;
    -webkit-line-clamp:1;
    color:grey;
	}
	
	.title {
	font-size:30px;
	}

	</style>
	</head>
	<body>
	<div class="gtco-loader"></div>
	<div id="page">
		<%@ include file="header.jsp" %>
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-12">
					<div class="owl-carousel owl-carousel-fullwidth">
<%
	ArrayList<String> movieIds = movie.getMovieIds();
	for(String id:movieIds){
%>
						<div class="item">
							<img src="images/<%=id %>.jpg" alt="">
						</div>
<%} %>
					</div>
				</div>
			</div>
		</div>
		<div class="gtco-section">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-6 gtco-news">
						<h2>最新消息</h2>
						<%ArrayList<NewsView> newsviews=news.getNewsViews(); %>
						<ul>												
							<%for(int i=0;i<=2;i++){%>
								<li><a href="news_info.jsp?id=<%=i%>"> 
									<span class="post-date">發佈日期：<%=newsviews.get(i).getStart_date() %></span>
									<span class="title"><%=newsviews.get(i).getTitle() %></span><br>
									<span class="news"><%=newsviews.get(i).getContent() %></span>
									</a>
								</li>	
							<%}%>
						</ul>
						<p><a href="news" class="btn btn-sm btn-special">更多消息</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- END  -->
		<%@ include file="footer.jsp" %>
	</div>

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