<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="main.tbl_view.MovieShowTimeView"%>
<%@ page import="java.util.ArrayList"%>
<%
%>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>爪蛙免費電影-訂票紀錄</title>
	
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
			width: 70%;
			margin: 15px 180px;
		}
		
		.col-md-14 {
			width: 80%;
			margin: auto;
		}
		
		input {
    		border-radius: 3px;
			border: 1px solid rgba(0, 0, 0, 0.1);
			width: 300px;
			height: 35px;
			font-size: 15px;
		}
	</style>
	<script>
	$(document).ready(function(){
		$.ajax({
			type	: 'post',
			url		: 'bookingRecord',
			data	: {"userId":$("#userId").val()},
			dataType: 'json',
			success	: function(response){
				showRecord(response);
			},
			
			error	: function(xhr, ajaxOptions, thrownError){
				console.log(xhr.status);
                console.log(thrownError);
			}
		});
		
		$("#doAjaxBtn").click(function(){
			$.ajax({
				type	: 'post',
				url		: 'bookingRecord',
				data	: {"transactionNo":$("[name='transactionNo']").val()},
				dataType: 'json',
				success	: function(response){
					showRecord(response);
				},
				
				error	: function(xhr, ajaxOptions, thrownError){
					console.log(xhr.status);
	                console.log(thrownError);
				}
			});
		});
		
		function showRecord(response){
			var str="";
			for(var no in response){
				var views = response[no];
				var total=0;
				
				str+="<details><summary>";
				str+="<label>交易序號:&nbsp;</label><span>"+no+"</span>&emsp;";
				str+="<label>交易時間:&nbsp;</label><span>"+views[0].transactionTime+"</span>";
				str+="</summary>";
				str+="<table>";
				str+="<tr style='background-color:rgba(0, 0, 0, 0.1);'>";
				str+="<th style='width:60px;'>票號</th>";
				str+="<th style='width:200px;'>電影</th>";
				str+="<th style='width:180px;'>場次</th>";
				str+="<th style='width:60px;'>廳</th>";
				str+="<th style='width:100px;'>座位</th>";
				str+="<th style='width:80px;'>票種</th>";
				str+="<th style='width:60px;'>價錢</th></tr>";
				
				$.each(views, function(index, view) {
					str+="<tr>";
					str+="<td>"+view.ticketNo+"</td>";
					str+="<td>"+view.movieName+"</td>";
					str+="<td>"+view.showtime+"</td>";
					str+="<td>"+view.hall+"</td>";
					str+="<td>"+view.row+" 排 "+view.col+" 號"+"</td>";
					str+="<td>"+view.type+"</td>";
					str+="<td>$"+view.price+"</td></tr>";
					
					total += parseInt(view.price);
				});
				str+="<tr>";
				str+="<td></td>";
				str+="<td></td>";
				str+="<td></td>";
				str+="<td></td>";
				str+="<td></td>";
				str+="<td>總金額</td>";
				str+="<td>$"+total+"</td>";
				str+="</tr></table></details><br>";

				$("#record").html(str);
			}
		}
	});
	</script>
  </head>
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <input type="hidden" id="userId" value="<%=userview.getUserId() %>">
      <div class="gtco-container">
        <div class="row">
          <div class="col-md-14">
      		<h2>訂票紀錄</h2>
          </div>
          <br>
          <div class="col-md-13">
            <span style=font-size:20px>交易序號 ：</span>
      		 <input type="text" name="transactionNo" size=50 maxlength=12 placeholder="數字12位">&nbsp;
            &nbsp;<a class="btn btn-sm btn-special" id="doAjaxBtn">查詢</a>
          </div>
        </div><!-- class="row" -->
      </div><!-- class="gtco-container" -->
      <div class="gtco-container">
        <div class="row" id="row">
          <div class='col-md-13' id="record"></div>
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