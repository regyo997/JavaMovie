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
			session.setAttribute("login_failed", "error");
			// out.print("<script>
			// alert('登入失敗，帳號或密碼錯誤');window.location='login.jsp'</script>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else if (name != null && state.equals("0")) {
			session.setAttribute("login_failed", "disable");
			// out.print("<script>
			// alert('帳號尚未啟用，請至email開啟認證信啟用帳號');window.location='login.jsp'</script>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
