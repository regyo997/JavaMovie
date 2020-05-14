package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.UserQuery;
import main.tbl_view.UserView;

@WebServlet("/userinfo")
public class UserInfoController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		UserQuery userquery=null;
		
		userquery=new UserQuery();
		UserView user_info=userquery.getUserDatas((String)session.getAttribute("USER_ID"));
		session.setAttribute("user_info", user_info);
		request.getRequestDispatcher("user_info.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
