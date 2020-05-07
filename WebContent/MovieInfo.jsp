<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.tbl_view.MovieView" %>
<%@ page import="java.util.HashMap" %>

<%
MovieView view = (MovieView)request.getAttribute("movieInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=view.getMovieName() %></title>
</head>
<style>
	.info div {
		display: inline-block;
	    vertical-align:top;
	    text-align:left;
	    width:450px;
		
	}
</style>
<body>
  <div>
  	<div class="info" style="text-align:center;">
  	  <div><img width="80%" height="80%" src="movie_picture/<%=view.getMovieId() %>.jpg"></div>
      <div>
        <h2><%=view.getMovieName() %></h2>
        <lu>
          <li><b>導演:&nbsp;&nbsp;</b><%=view.getDirectedBy() %></li>
          <li><b>演員: </b><br>
<%
	String[] casts = view.getCast().split("、");
	for(String cast:casts){
		out.print(cast+"<br>");
	}
%>        
          </li><br>
          <li><b>級數:&nbsp;&nbsp;</b><%=view.getMovieRating() %></li>
          <li><b>片長:&nbsp;&nbsp;</b><%=view.getRuntime() %></li>
          <li><b>上映日期:&nbsp;&nbsp;</b><%=view.getReleaseDate() %></li>
        </lu>
        <br>
        <br>
        <br>
        <div><input type="button" value="前往訂票"></div>
      </div>
      <div style="text-align:left;width:1000px"><h2>電影介紹</h2><p style="max-width:900px;">&emsp;&emsp;<%=view.getMovieInfo() %></p></div>
  	</div>
  </div>
</body>
</html>