<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Date" %>
<html>
  <head>
    <title>會員註冊</title>
    <meta charset="utf-8">
    <style type="text/css">
      fieldset {
	    width:400px;
		border:#000 3px double;
      }	
    </style>
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
  </head>
  <body>
    <h2>基本資料</h2>
    <form name="userform" method="post" action="http://localhost:8080/JavaMovie/SignupController">
      <fieldset>
        <legend>個人資料</legend>
        *帳號 ：<input type="text" name="id" size=20 maxlength=12 placeholder="首字必須英文(長度8-12位)"><p>
        *密碼 ：<input type="password" name="pw" size=20 maxlength=8 placeholder="英文或數字(長度4-8位)"><p>
        *姓名：<input type="text" name="name" size=20 maxlength=14 placeholder="ex:王小明"><p> 
        *地址：<input type="text" name="address" size=35 maxlength=30 placeholder="ex:台北市萬華區中正路二段10號10樓"><p>
        *電話：<input type="text" name="phone" size=20 maxlength=10 placeholder="ex:0912345678"><p>
        *電子信箱：<input type="text" name="email" size=30 maxlength=30 placeholder="ex:abc12345@gmail.com"><p>
        *出生年月日：<input type="date" name="birthday" size=20><p>
		<label style='color:red'>*:必須輸入</label><br>
      </fieldset>
      <br><input type="button" value="加入會員" onclick="check_Data(userform)">
      <input type="reset" name="reset" value="重新填寫">     
    </form>
  </body>
</html>
