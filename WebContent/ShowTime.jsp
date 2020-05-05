<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>電影場次</title>
</head>
<style>
	.movie div {
		display: inline-block;
	    vertical-align:top;
	    text-align:left;
	    width:300px;
		
	}
</style>
<body>
<%
LinkedHashMap<String,ArrayList<String>> movieId_time
			= (LinkedHashMap<String,ArrayList<String>>)request.getAttribute("showtime");
	
	if(movieId_time == null){
		out.print("movieId_time is null.");
	}else{
		//int rowspan = 0;
		for(String movieId:movieId_time.keySet()){
	
%>
<div class="movie">
  <div><img width="80%" height="80%" src="movie_picture/<%=movieId%>.jpg"></div>
  <div>
  	<h3><%=movieId%></h3>
  	<lu>
  	  <li>上映日期: </li>
  	  <li>片長: </li>
  	  <li>級數: </li>
  	</lu>
  	<div><input type="button" value="電影介紹"></div>
  </div>
</div>
<div>
<%
			String date="";
			String time="";
			for(String showtime:movieId_time.get(movieId)){
				time=showtime.substring(11, 16);
				if(date.equals(showtime.substring(0, 11))){
					out.print("<label>"+time+" | </label>");
				}else{
					date=showtime.substring(0, 11);
					out.print("<br><label style='color:red'>"+date+"</label><br>"+"<label>"+time+" | </label>");
				}
			}
%>
</div>

	
<%
	}}
%>


</body>
</html>