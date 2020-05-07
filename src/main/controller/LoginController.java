package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.Login;
import main.model.UserQuery;
import main.tbl_view.UserView;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		UserQuery userquery=null;

		Login login = new Login();
		String msg = login.signin(request.getParameter("USER_ID"), request.getParameter("PASSWORD"));

		request.setAttribute("msg", msg);
		
		if (msg.equals("success")) {
			userquery=new UserQuery();
			UserView userdata=userquery.getUserDatas(request.getParameter("USER_ID"));
			request.setAttribute("userdata", userdata);
			request.getRequestDispatcher("User.jsp").forward(request, response);
		} else if (msg.equals("error")) {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
