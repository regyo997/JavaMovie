package main.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.model.MovieAdd;
import main.tbl_view.MovieView;


@WebServlet("/movieAdd")
public class MovieAddController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		MovieView view = new MovieView();
		view.setMovieId(request.getParameter("id"));
		view.setMovieName(request.getParameter("name"));
		view.setMovieRating(request.getParameter("rating"));
		view.setReleaseDate(request.getParameter("release_date"));
		view.setRuntime(request.getParameter("runtime"));
		view.setDirectedBy(request.getParameter("directed_by"));
		view.setCast(request.getParameter("cast"));
		view.setMovieInfo(request.getParameter("info"));
		
		MovieAdd movieAdd = new MovieAdd();
		movieAdd.setMovieInfo(view);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
