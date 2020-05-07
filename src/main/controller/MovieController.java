package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.Movie;
import main.tbl_view.MovieView;

@WebServlet("/movieInfo")
public class MovieController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Movie movie = new Movie();
		for(MovieView view:movie.getMovieViews()) {
			if(view.getMovieId().equals(request.getParameter("id"))) {
				request.setAttribute("movieInfo", view);
			}
		}
		request.getRequestDispatcher("MovieInfo.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
