package main.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.UserUpdate;

@WebServlet("/UserUpdateController")
public class UserUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String pw = request.getParameter("pw");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		UserUpdate up=new UserUpdate();
		String msg=up.update(pw, address, phone);
		out.print("<h2>"+msg+"</h2>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
