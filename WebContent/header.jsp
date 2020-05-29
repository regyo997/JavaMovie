<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="main.tbl_view.UserView" %>
<%UserView userview = (UserView)session.getAttribute("user_info");%>
<nav class="gtco-nav" style="padding: 10px 0;">
	<div class="gtco-container">
		<div class="row">
			<div class="col-sm-2 col-xs-12"></div>
			<div class="col-xs-10 text-right menu-1">
				<%if(session.getAttribute("login_success")==null){%>
				<ul>
					<li><a style="font-size: 13px;" href="login.jsp">登入</a></li>
					<li><a style="font-size: 13px;" href="signup.jsp">註冊</a></li>
				</ul>
				<%}else{%>
				<ul>
					<li><a style="font-size: 13px;" href="logout"><%=session.getAttribute("login_success") +",您好   "%>登出</a></li>
				</ul>
				<%}%>
				
			</div>
		</div>
	</div>
</nav>
<nav class="gtco-nav" role="navigation">
	<div class="gtco-container">
		<div class="row">
			<div class="col-sm-2 col-xs-12">
				<div id="gtco-logo">
					<a href="index.jsp">爪蛙免費電影</a>
				</div>
			</div>
			<div class="col-xs-10 text-right menu-1">
				<ul>
					<li class="active"><a href="news">最新消息</a></li>
					<li><a href="about.jsp">關於爪蛙</a></li>
					<li><a href="movie_info_all.jsp">電影介紹</a></li>
					<li><a href="showTime">電影場次</a></li>
					<%if(session.getAttribute("login_success")!=null){ %>
							<li class="has-dropdown">
								<a href="#">會員中心</a>
								<ul class="dropdown">
									<li><a href="userinfo">修改資料</a></li>
									<li><a href="#">訂票紀錄</a></li>
								</ul>
							</li>
					<%}%>
					<li><a href="ticket.jsp">線上訂票</a></li>
				</ul>
			</div>
		</div>
		<hr>
	</div>
</nav>