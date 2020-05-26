package main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import main.model.Movie;
import main.model.ShowTime;
import main.tbl_view.BookingConfirmView;

/**
 * Servlet implementation class BookingConfirmController
 */
@WebServlet("/bookingConfirm")
public class BookingConfirmController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ShowTime show = new ShowTime();
		BookingConfirmView confirmView = new BookingConfirmView();
		HashMap<String,Integer> seats = new HashMap<String,Integer>();
		HashMap<String,String> types = new HashMap<String,String>();
		
		String movieId = request.getParameter("id");
		String movieName = new Movie().getMovieById(movieId).getMovieName();
		String movieRating = request.getParameter("rating");
		String showtime = request.getParameter("showtime");
		String hall = request.getParameter("hall");
		String userId = request.getParameter("userId");
		
		JSONArray seats_JsonArray = new JSONArray(request.getParameter("seats"));
		JSONObject obj;
		String row="";
		int col=0;
		
		for(int i=0; i<seats_JsonArray.length(); i++) {
			obj = seats_JsonArray.getJSONObject(i);
			row = obj.getString("row");
			col = obj.getInt("col");
			
			show.reserveSeats(movieId, showtime, row, col, userId, "Y");
			seats.put(row, col);
		}
		
		JSONArray types_JsonArray = new JSONArray(request.getParameter("types"));
		for(int i=0; i<types_JsonArray.length(); i++) {
			obj = types_JsonArray.getJSONObject(i);
			types.put(obj.getString("type"), obj.getString("price").concat("_"+obj.getInt("count")));
			System.out.println(obj.getString("price").concat("_"+obj.getInt("count")));
		}
		
		confirmView.setMovieId(movieId);
		confirmView.setMovieName(movieName);
		confirmView.setMovieRating(movieRating);
		confirmView.setShowtime(showtime);
		confirmView.setHall(hall);
		confirmView.setSeats(seats);
		confirmView.setTypes(types);
		confirmView.setUserId(userId);
		
		request.setAttribute("confirmView", confirmView);
		request.getRequestDispatcher("booking_confirm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
