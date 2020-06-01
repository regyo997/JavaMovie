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
 		var re_id=/[a-zA-Z][0-9a-zA-Z]{7,11}/;
 		if(!re_id.test(element.id.value)){
 			alert("帳號格式有誤，請重新輸入，首字英文其餘英文或數字(長度8-12位)");
 			element.id.focus();
 			return false;
 		}
 		
 		var re_pw=/[a-zA-Z0-9]{4}/;
 		if(!re_pw.test(element.pw.value)){
 			alert("密碼格式有誤，請重新輸入，英文或數字(長度4-8位)");
 			element.pw.focus();
 			return false;
 		}
 		
 		var re_name=/[\D]+/;
 		if(!re_name.test(element.name.value)){
 			alert("姓名不可為空值");
 			element.name.focus();
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
 		
 		var re_email=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
 		if(!re_email.test(element.email.value)){
 			alert("電子信箱格式有誤，請重新輸入　例:abc123@gmail.com");
 			element.email.focus();
 			return false;
 		}
 		
 		var re_birthday=/[1-2][0-2||9][\d]{2}\-[0-1][\d]\-[0-3][\d]/;
 		if(!re_birthday.test(element.birthday.value)){
 			alert("生日格式有誤，請重新輸入(yyyy-mm-dd)");
 			element.birthday.focus();
 			return false;
 		}
 		
 		
 		
 		document.userform.submit();
      }	
      
    </script>
    
	<style>
	.signup {
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
        <div class="row" id="user_info">
   			<form name="userform" method="post" action="http://localhost:8080/JavaMovie/signup">
      		  <h1 style='color:blue'>個人資料</h1>
      		  <%
      		  String msg=(String)session.getAttribute("failed");
      		  if(msg!=null && msg.equals("both")){
      			  out.print("<h2 style='color:red'>"+"帳號、電子郵件已被使用"+"</h2>");
      		  	  session.removeAttribute("failed");
      		  }else if(msg!=null && msg.equals("USERID")){
      			  out.print("<h2 style='color:red'>"+"帳號已被使用"+"</h2>");
      			  session.removeAttribute("failed");
      		  }else if(msg!=null && msg.equals("EMAIL")){
      			  out.print("<h2 style='color:red'>"+"電子郵件已被使用"+"</h2>");
      			  session.removeAttribute("failed");
      		  }
      		  %>
      		 <label style=font-size:20px><b>*帳號 ：</b></label><p>
      		 <input class=signup type="text" name="id" size=50 maxlength=12 placeholder="首字必須英文(長度8-12位)"><p><br>
      		 <label style=font-size:20px><b>*密碼：</b></label><p>
      		 <input class=signup type="password" name="pw" size=50 maxlength=8 placeholder="英文或數字(長度4-8位)"><p>
      	     <label style=font-size:20px><b>*姓名：</b></label><p>
      	     <input class=signup type="text" name="name" size=50 maxlength=14 placeholder="ex:王小明"><p> 
       	   	 <label style=font-size:20px><b>*地址：</b></label><p>
       	   	 <input class=signup type="text" name="address" size=50 maxlength=30 placeholder="ex:台北市萬華區中正路二段10號10樓"><p>
       		 <label style=font-size:20px><b>*電話：</b></label><p>
       		 <input class=signup type="text" name="phone" size=50 maxlength=10 placeholder="ex:0912345678"><p>
       		 <label style=font-size:20px><b>*電子郵件：</b></label><p>
       		 <input class=signup type="text" name="email" size=50 maxlength=30 placeholder="ex:abc12345@gmail.com"><p>
        	 <label style=font-size:20px><b>*生日：</b></label><p>
        	 <input class=signup type="date" name="birthday" size=50><p>
			 <label style='color:red'><b style=font-size:20px>*:必須輸入</b></label><br>
    		 <br><input class="btn btn-sm btn-special" type="button" value="加入會員" onclick="check_Data(userform)">
   			 <input class="btn btn-sm btn-special" type="reset" name="reset" value="重新填寫">     
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