package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import main.model.Movie;
import main.model.ShowTime;
import main.model.TicketType;
import main.tbl_view.MovieView;
import main.tbl_view.ShowTimeSeatView;

@WebServlet("/seatQuery")
public class SeatQueryController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String showtime = request.getParameter("showtime");
		
		// 取得座位
		ShowTime seat = new ShowTime();
		ArrayList<ShowTimeSeatView> seatViews = seat.getSeatStatus(id, showtime);
		
		// 取得電影資訊
		ArrayList<MovieView> movieViews = new ArrayList<MovieView>();
		movieViews.add(new Movie().getMovieById(id));
		
		// 取得票種
		TicketType type = new TicketType();
        
        JSONObject responseJSONObject = new JSONObject();
		responseJSONObject.put("seatViews", seatViews);
		responseJSONObject.put("movieViews", movieViews);
		responseJSONObject.put("ticketType",type.getTicketType());
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
        out.println(responseJSONObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
