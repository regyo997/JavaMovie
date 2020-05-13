package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.ShowTimeAdd;

@WebServlet("/showtimeAdd")
public class ShowTimeAddController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String hall = request.getParameter("hall");
		String showtime = date+" "+time;
		
		ShowTimeAdd showtimeAdd = new ShowTimeAdd();
		showtimeAdd.setShowTimeSeat(id, showtime, hall);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
