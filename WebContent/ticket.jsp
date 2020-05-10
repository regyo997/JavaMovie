<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- todo:select date, font-size, 字體 -->
<!DOCTYPE HTML>
<html>
  <head>
	<title>爪蛙免費電影-線上訂票</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
  
	<script>
		$(document).ready(function(){
			$("#doAjaxBtn").click(function(){
				$.ajax({
                    type:"POST",                    //指定http參數傳輸格式為POST
                    url: "showtimeQuery",        //請求目標的url，可在url內加上GET參數，如 www.xxxx.com?xx=yy&xxx=yyy
                    data: {"date":$("#date").val()}, //要傳給目標的data為id=formId的Form其序列化(serialize)為的值，之
                    dataType: "json",               //目標url處理完後回傳的值之type，此列為一個JSON Object

                    //Ajax成功後執行的function，response為回傳的值
                    success : function(response){
                    	var key = response["key"];
                    	var movie = "";
                    	
                    	for(var info in key){
                    		movie+="<div class='gtco-container'>";
                    		movie+="<div class='row'>";
                    		movie+="<div class='col-md-13'>";
                    		movie+="<div class='zi_box_1'>";
                    		movie+="<div class='relative1'>";
                    		movie+="<img style='float:left;margin:0px 60px 20px 20px;' width='20%' height='20%' src='movie_picture/"+key[info].movieId+".jpg'></div>";
                    		movie+="<div><h3>"+key[info].movieName+"</h3>";
                    		movie+="<lu><li>上映日期: "+key[info].releaseDate+"</li><li>片長: "+key[info].runtime+"</li><li>級數: "+key[info].movieRating+"</li></lu>";
                    		movie+="<br><h4>場次: </h4>";
                    		
                    		for(var i = 0 ; i<response.key[info].times.length; i++){
                    			movie+="<span>"+response.key[info].times[i]+" | </span>"
                            }
                    		movie+="</div></div></div></div></div>";
                        }
                        	$("#movie").html(movie);
                    },

                    //Ajax失敗後要執行的function，此例為印出錯誤訊息

                    error:function(xhr, ajaxOptions, thrownError){

                        alert(xhr.status+"\n"+thrownError);
                    }

                });
			});
		});
	</script>
	<style>
		.col-md-13 {
			width: 70%;
			margin: 10px 180px;
		}
		
		.col-md-13 select {
			border-radius: 3px;
			border: 1px solid rgba(0, 0, 0, 0.1);
			width: 200px;
			height: 45px;
			font-size: 20px;
		}
		
		.relative1 {
			position: relative;
		}
		
		.zi_box_1 {
			border: 2px solid rgba(0, 0, 0, 0.1); /* 框線顏色 */
			border-radius: 4px;
			padding: 20px;
			position: relative;
			box-shadow: 0 0 5px 2px rgba(0, 0, 0, 0.1) inset; /*陰影*/
			height: 280px;
		}
	</style>
  </head>
  <body>
    <div id="page">
      <%@ include file="header.jsp" %>
      <div class="gtco-container">
        <div class="row">
          <div class="col-md-13">
            <select id="date"><option selected>2020-05-11</option><option>2020-05-12</option><option>2020-05-13</option></select>
            &nbsp;<a class="btn btn-sm btn-special" id="doAjaxBtn">查詢</a>
          </div>
        </div><!-- class="row" -->
      </div><!-- class="gtco-container" -->
      
      <div id="movie"></div>
      
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