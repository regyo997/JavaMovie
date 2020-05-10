package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import main.model.Movie;
import main.model.ShowTimeQuery;
import main.tbl_view.MovieShowTimeView;
import main.tbl_view.MovieView;



@WebServlet("/showtimeQuery")
public class ShowTimeQueryController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Movie movie = new Movie();
		ArrayList<MovieView> movieViews = movie.getMovieViews();
		
		String date = request.getParameter("date");
		ShowTimeQuery query = new ShowTimeQuery();
		LinkedHashMap<String,ArrayList<String>> id_showtime = query.getShowTIme(date);
		
		ArrayList<MovieShowTimeView> movieShowTimeViews = new ArrayList<MovieShowTimeView>();
		MovieShowTimeView movieShowTimeView = null;
		String movieId = "";
		for(MovieView view:movieViews) {
			movieId = view.getMovieId();
			if(id_showtime.containsKey(movieId)) {
				movieShowTimeView = new MovieShowTimeView();
				movieShowTimeView.setMovieId(movieId);
				movieShowTimeView.setMovieName(view.getMovieName());
				movieShowTimeView.setReleaseDate(view.getReleaseDate());
				movieShowTimeView.setRuntime(view.getRuntime());
				movieShowTimeView.setMovieRating(view.getMovieRating());
				movieShowTimeView.setTimes(id_showtime.get(movieId));
				
				movieShowTimeViews.add(movieShowTimeView);
			}
		}
		LinkedHashMap<String,ArrayList<MovieShowTimeView>> map = new LinkedHashMap<String,ArrayList<MovieShowTimeView>>();
		map.put("key", movieShowTimeViews);
		
		
		JSONObject responseJSONObject = new JSONObject(map);
		PrintWriter out = response.getWriter();
        out.println(responseJSONObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
