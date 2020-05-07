<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.util.HashMap"%>
<%@ page import="main.tbl_view.UserView" %>
<%
UserView userview = (UserView)request.getAttribute("userdata");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>個人資料</title>
<style type="text/css">
      fieldset {
	    width:400px;
		border:#000 3px double;
      }	
    </style>
</head>
<body>
	<h1>個人資料</h1>
    <form name="userdata" method="post" action="">
      <fieldset>
        <legend style='color:blue'>個人資料</legend>
        *帳號 ：<input type="text" name="id" size=20 readonly="readonly" value=<%=userview.getUserId()%>><p>
        *密碼 ：<input type="password" name="pw" size=20 readonly="readonly" value=<%=userview.getPassword() %>><p>
        *姓名：<input type="text" name="name" size=20 readonly="readonly" value=<%=userview.getName() %>><p> 
        *地址：<input type="text" name="address" size=35 readonly="readonly" value=<%=userview.getAddress() %>><p>
        *電話：<input type="text" name="phone" size=20 readonly="readonly" value=<%=userview.getPhone() %>><p>
        *電子信箱：<input type="text" name="email" size=30 readonly="readonly" value=<%=userview.getEmail() %>><p>
        *出生年月日：<input type="date" name="birthday" size=20 readonly="readonly" value=<%=userview.getBirthday() %>><p>

      </fieldset>
    </form>
</body>
</html>