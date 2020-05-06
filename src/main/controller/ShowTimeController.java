package main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.Movie;
import main.model.ShowTime;
import main.tbl_view.MovieView;


@WebServlet("/showTime")
public class ShowTimeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取得場次
		ShowTime show = new ShowTime();
		request.setAttribute("showtime", show.getShowTimeData());
		
		//取得電影名稱
		Movie movie = new Movie();
		ArrayList<MovieView> views = movie.getMovieViews();
		HashMap<String,ArrayList<String>> movieInfo = new HashMap<String,ArrayList<String>>();
		ArrayList<String> info = null;
		
		for(MovieView view:views) {
			info = new ArrayList<String>();
			info.add(view.getMovieName());
			info.add(view.getReleaseDate());
			info.add(view.getRuntime());
			info.add(view.getMovieRating());
			movieInfo.put(view.getMovieId(), info);
		}
		request.setAttribute("movieInfo", movieInfo);
		
		request.getRequestDispatcher("ShowTime.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
