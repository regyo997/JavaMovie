<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
    
    <script language="JavaScript">
      
      function check_Data(element)
      {
 		var re_pw=/[a-zA-Z0-9]{4}/;
 		if(!re_pw.test(element.pw.value)){
 			alert("密碼格式有誤，請重新輸入，英文或數字(長度4-8位)");
 			element.pw.focus();
 			return false;
 		}
 		
 		var re_address=/.+/;
 		if(!re_address.test(element.address.value)){
 			alert("地址不可為空值");
 			element.address.focus();
 			return false;
 		}
 		
 		var re_phone=/[0][9][0-9]{8}/;
 		if(!re_phone.test(element.phone.value)){
 			alert("手機號碼格式有誤，請重新輸入，數字長度10位");
 			element.phone.focus();
 			return false;
 		}
 			
 		document.userdata.submit();
      }	
      
    </script>
	
	<style>
	.user_info {
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
			<form name="userdata" method="post" action="http://localhost:8080/JavaMovie/userUpdate">
      		  <h1 style='color:blue'>個人資料</h1>
      		  	<%
				String msg=(String)session.getAttribute("update");
				if(msg!=null)
					out.print("<h2 style='color:red'>"+"資料更新完成"+"</h2>");
				%>
      		 	<label style=font-size:20px><b>帳號 ：</b></label><p>
      		 	<label style=font-size:20px><%=userview.getUserId()%></label><p>
        		<label style=font-size:20px><b>密碼 ：</b></label><p>
        		<input class=user_info type="password" name="pw" size=50 value=<%=userview.getPassword() %>><p>
             	<label style=font-size:20px><b>姓名：</b></label><p>
       			<label style=font-size:20px><%=userview.getName()%></label><p>
       			<label style=font-size:20px><b>地址：</b></label><p>
       			<input class=user_info type="text" name="address" size=50 value=<%=userview.getAddress() %>><p>
      			<label style=font-size:20px><b>電話：</b></label><p>
      			<input class=user_info type="text" name="phone" size=50 value=<%=userview.getPhone() %>><p>
       			<label style=font-size:20px><b>電子信箱：</b></label><p>
       			<label style=font-size:20px><%=userview.getEmail()%></label><p>
       			<label style=font-size:20px><b>生日：</b></label><p>
       			<label style=font-size:20px><%=userview.getBirthday()%></label><p>
       			<input class="btn btn-sm btn-special" type="submit" value="修改" onclick="check_Data(userdata)">
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