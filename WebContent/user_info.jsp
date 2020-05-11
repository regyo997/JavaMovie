<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap"%>
<%@ page import="main.tbl_view.UserView" %>
<%UserView userview = (UserView)session.getAttribute("user_info");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人資料</title>
<style type="text/css">
      fieldset {
	    width:400px;
		border:#000 3px double;
      }	
    </style>
    
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
    
</head>
<body>
	<h1>個人資料</h1>
	
    <form name="userdata" method="post" action="http://localhost:8080/JavaMovie/userUpdate">
      <fieldset>
        <legend style='color:blue'>個人資料</legend>
       	帳號 ：<input type="text" name="id" size=20 readonly="readonly" value=<%=userview.getUserId()%>><p>
        *密碼 ：<input type="password" name="pw" size=20 value=<%=userview.getPassword() %>><p>
                 姓名：<input type="text" name="name" size=20 readonly="readonly" value=<%=userview.getName() %>><p> 
        *地址：<input type="text" name="address" size=35 value=<%=userview.getAddress() %>><p>
        *電話：<input type="text" name="phone" size=20 value=<%=userview.getPhone() %>><p>
       	電子信箱：<input type="text" name="email" size=30 readonly="readonly" value=<%=userview.getEmail() %>><p>
       	出生年月日：<input type="date" name="birthday" size=20 readonly="readonly" value=<%=userview.getBirthday() %>><p>
		<label style='color:red'>*:可直接修改資料並按下修改按鈕更新資料</label><br>
			<input type="submit" value="修改" onclick="check_Data(userdata)">
      </fieldset>
    </form>
</body>
</html>