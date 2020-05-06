<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%
	LinkedHashMap<String,ArrayList<String>> movieId_time
			= (LinkedHashMap<String,ArrayList<String>>)request.getAttribute("showtime");
	HashMap<String,ArrayList<String>> movieInfo 
			= (HashMap<String,ArrayList<String>>)request.getAttribute("movieInfo");
%>
<!-- TODO:星期 -->
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
	if(movieId_time == null || movieInfo == null){
		out.print("data is null.");
	}else{
		//int rowspan = 0;
		for(String movieId:movieId_time.keySet()){
	
%>
<div class="movie">
  <div><img width="80%" height="80%" src="movie_picture/<%=movieId%>.jpg"></div>
  <div>
  	<h3><%=movieInfo.get(movieId).get(0)%></h3>
  	<lu>
  	  <li>上映日期: <%=movieInfo.get(movieId).get(1) %></li>
  	  <li>片長: <%=movieInfo.get(movieId).get(2) %></li>
  	  <li>級數: <%=movieInfo.get(movieId).get(3) %></li>
  	</lu>
  	<div><input type="button" value="電影介紹"></div>
  </div>
</div>
<div>
<%
			String date="";
			String time="";
			
			for(String showtime:movieId_time.get(movieId)){
				time=showtime.substring(15, 20);
				if(date.equals(showtime.substring(0, 15))){
					out.print("<label>"+time+" | </label>");
				}else{
					date=showtime.substring(0, 15);
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