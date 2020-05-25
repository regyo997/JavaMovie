package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.PasswordReset;

@WebServlet("/passwordreset")
public class PasswordResetController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		
		PasswordReset password=new PasswordReset();
		String msg=password.reset(pw, email);
		
		if(msg.equals("success")) {
			session.setAttribute("reset_success", "Password reset success.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else {
			session.setAttribute("reset_failed", "Password reset failed");
			request.getRequestDispatcher("password_reset.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
