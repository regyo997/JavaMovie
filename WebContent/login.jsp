<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影-</title>
	
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
	
	<style>
	.login {
    box-shadow: none;
    background: transparent;
    border-radius:4px;
    border: 2px solid rgba(0, 0, 0, 0.1);
    height: 40px;
    font-size: 20px;
    font-weight: 300;
}

	</style>
	
  </head>
  
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
			<form method="post" action="http://localhost:8080/JavaMovie/login">
			<h1 style='color:blue'>登入會員</h1><p>
			<%
				String msg=(String)session.getAttribute("login_failed");
				if(msg!=null && msg.equals("error")){
					out.print("<h2 style='color:red'>"+"帳號或密碼錯誤，請重新輸入"+"</h2>");
					session.removeAttribute("login_failed");
				}else if(msg!=null && msg.equals("disable")){
					out.print("<h2 style='color:red'>"+"帳號尚未啟用，請至email開啟認證信啟用帳號"+"</h2>");
					session.removeAttribute("login_failed");
				}
				
				String msg1=(String)session.getAttribute("signup_success");
				if(msg1!=null){
					out.print("<h2 style='color:red'>"+"註冊成功，請至email開啟認證信啟用帳號"+"</h2>");
					session.removeAttribute("signup_success");
				}
				
				String msg2=(String)session.getAttribute("reset_success");
				if(msg2!=null){
					out.print("<h2 style='color:red'>"+"修改密碼完成，請使用新密碼登入"+"</h2>");
					session.removeAttribute("reset_success");
				}
			
			%>
			<label style=font-size:20px><b>帳號 ：</b></label><p>
			<input class=login type="text" name="USER_ID" size="20" maxlength="12"><p>
			<label style=font-size:20px><b>密碼 ：</b></label><p>
			<input class=login type="password" name="PASSWORD" size="20" maxlength="8"><p>
			<input class="btn btn-sm btn-special" type="submit" value="登入">
			<input class="btn btn-sm btn-special" type="reset" value="重填">
			<input class="btn btn-sm btn-special" type="button" value="忘記密碼" onclick="location.href='password_forget.jsp'">
			</form>
        
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