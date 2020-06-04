package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.SendMail;

@WebServlet("/passwordresetsendmail")
public class PasswordResetSendMailController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
//		request.setCharacterEncoding("utf-8");
		SendMail sendmail=new SendMail();
		sendmail.setTo(request.getParameter("email"));
		sendmail.setSubject("爪蛙電影會員密碼重置");
		sendmail.setContent(" 您已申請密碼重置服務，請點選以下連結重新設置您的密碼:<br>"+
		"<a href='http://localhost:8080/JavaMovie/password_reset.jsp'>請點我</a><br>"+
		"此信件為系統自動發送, 請勿點選回覆信件");
		sendmail.execute();
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("sendmail", "已寄信至信箱，請至信箱收信去修改密碼");
		request.getRequestDispatcher("password_forget.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
