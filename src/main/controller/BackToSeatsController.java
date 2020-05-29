package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import main.model.Movie;
import main.model.ShowTime;

/**
 * Servlet implementation class BackToSeatsController
 */
@WebServlet("/back")
public class BackToSeatsController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String movieId = request.getParameter("movieId");
		String showtime = request.getParameter("showtime");
		String seats = request.getParameter("seats");
		String userId = request.getParameter("userId");
		
		ShowTime show = new ShowTime();
		String[] seat = seats.split(",");
		for (int i=0;i<seat.length;i++) {
			String[] row_col = seat[i].split("_");
			
			String row = row_col[0].replaceAll("[\\pP\\p{Punct}]","").trim();
			int col = Integer.parseInt(row_col[1].replaceAll("[\\pP\\p{Punct}]",""));
			
			show.changeSeatsStatus(movieId, showtime, row, col, userId,"N");
		}
		
		request.getRequestDispatcher("select_seats.jsp?id="+movieId+"&showtime="+showtime).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
