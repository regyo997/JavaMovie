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
    color: blue;
	}

	</style>
	
	<script>
		function check_data(element){
			
			var pw=element.pw.value;
			var pw2=element.pw2.value;
			var re_pw=/[a-zA-Z0-9]{4}/;
			var re_email=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	 		
			if(!re_email.test(element.email.value)){
	 			document.getElementById("email").innerHTML="電子信箱格式有誤，請重新輸入，例:abc123@gmail.com";
	 			element.email.focus();
	 			return false;
	 		}else{
	 			clear("email");
	 		}
			
	 		if(!re_pw.test(pw)){
	 			document.getElementById("pw").innerHTML="密碼格式有誤，請重新輸入，英文或數字(長度4-8位)";
	 			element.pw.focus();
	 			return false;
	 		}else
	 			clear("pw");
	 		
	 		var re_pw2=/[a-zA-Z0-9]{4}/;
	 		if(!re_pw2.test(pw2)){
	 			document.getElementById("pw2").innerHTML="密碼格式有誤，請重新輸入，英文或數字(長度4-8位)";
	 			element.pw2.focus();
	 			return false;
	 		}else
	 			clear("pw2");
	 		
	 		if(pw!==pw2){
	 			document.getElementById("pw").innerHTML="兩次輸入密碼必須相同";
	 			document.getElementById("pw2").innerHTML="兩次輸入密碼必須相同";
	 			element.pw.focus();
	 			return false;
	 		}else{
	 			clear("pw");
	 			clear("pw2");
	 		}
	 		
	 		document.password.submit();
		}
		function clear(id){
	    	  document.getElementById(id).innerHTML="";
	      }
	</script>
	
  </head>
  
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
			<form name="password" method="post" action="passwordreset">
			<h1 style='color:blue'>重設密碼</h1><p>
			
			<label style=font-size:20px><b>電子郵件：</b></label><p>
			<input class=login type="text" name="email" size="20" maxlength="30"><p>
			<span id="email" style="color:red;"></span><br>
			
			<label style=font-size:20px><b>新密碼：</b></label><p>
			<input class=login type="password" name="pw" size="20" maxlength="12"><p>
			<span id="pw" style="color:red;"></span><br>
			
			<label style=font-size:20px><b>再次確認密碼：</b></label><p>
			<input class=login type="password" name="pw2" size="20" maxlength="12"><p>
			<span id="pw2" style="color:red;"></span><br>
			
			<input class="btn btn-sm btn-special" type="button" value="修改" onclick="check_data(password)">
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