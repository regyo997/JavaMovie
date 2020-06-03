package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.Login;
import main.model.UserQuery;
import main.tbl_view.UserView;

@WebServlet("/login")
public class LoginController extends HttpServlet {

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();

		Login login = new Login();
		String name = login.signin(request.getParameter("USER_ID"), request.getParameter("PASSWORD"));
		String state = login.getState();
	
		if (name != null && state.equals("1")) {
			session.setAttribute("login_success", name);
			UserQuery userquery = new UserQuery();
			UserView user_info = userquery.getUserDatas(request.getParameter("USER_ID"));
			session.setAttribute("user_info", user_info);
			session.setAttribute("USER_ID", request.getParameter("USER_ID"));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else if (name == null) {
			request.setAttribute("login_failed", "error");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (name != null && state.equals("0")) {
			request.setAttribute("login_failed", "disable");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
