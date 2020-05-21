package main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.Movie;
import main.model.ShowTime;
import main.tbl_view.MovieShowTimeView;
import main.tbl_view.MovieView;


@WebServlet("/showTime")
public class ShowTimeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取得場次
		ShowTime show = new ShowTime();
		LinkedHashMap<String,ArrayList<String>> movieId_time = show.getShowTimeData();
		
		//取得電影名稱
		Movie movie = new Movie();
		ArrayList<MovieView> movieViews = movie.getMovieViews();
		
		MovieShowTimeView movie_showtime = null;
		ArrayList<MovieShowTimeView> movieShowtimeViews = new ArrayList<MovieShowTimeView>();
		String movieId = "", date = "", time="";
		
		for(MovieView view:movieViews) {
			movieId = view.getMovieId();
			
			movie_showtime = new MovieShowTimeView();
			movie_showtime.setMovieId(movieId);
			movie_showtime.setMovieName(view.getMovieName());
			movie_showtime.setReleaseDate(view.getReleaseDate());
			movie_showtime.setRuntime(view.getRuntime());
			movie_showtime.setMovieRating(view.getMovieRating());
			
			LinkedHashMap<String,ArrayList<String>> date_time = new LinkedHashMap<String,ArrayList<String>>();
			for(String s:movieId_time.get(movieId)) {
				date = s.substring(0, 15);
				time = s.substring(15, 20);
				if(date_time.containsKey(date)) {
					date_time.get(date).add(time);
				}else {
					ArrayList<String> times = new ArrayList<String>();
					times.add(time);
					date_time.put(date, times);
				}
			}
			movie_showtime.setShowtimes(date_time);
			movieShowtimeViews.add(movie_showtime);
		}
		request.setAttribute("movieShowtimeViews", movieShowtimeViews);
		request.getRequestDispatcher("showtime.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
