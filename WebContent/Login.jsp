<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>登入會員</title>
</head>
<style>
	h2{
		color:red;
	}
</style>

<body>
	<form method="post" action="http://localhost:8080/JavaMovie/LoginController">
	<h1>登入會員</h1><p>
	<%
		String msg=(String)request.getAttribute("msg");
		if(msg!=null)
			out.print("<h2>"+"帳號或密碼錯誤，請重新輸入"+"</h2>");
	%>
	帳號：<input type="text" name="USER_ID" size="20" maxlength="12"><p>
	密碼：<input type="password" name="PASSWORD" size="20" maxlength="8"><p>
	<input type="submit" value="登入">
	<input type="reset" value="重填">
	</form>
</body>
</html>