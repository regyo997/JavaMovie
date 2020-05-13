package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import main.tbl_view.MovieView;

public class Movie {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	
	public ArrayList<MovieView> getMovieViews(){
		String sql = "USE JAVA_THEATER; SELECT * FROM TBLMOVIE;";
		ArrayList<MovieView> movieViews = new ArrayList<MovieView>();
		MovieView movieView = null;
		
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				movieView = new MovieView();
				movieView.setMovieId(result.getString(1));
				movieView.setMovieName(result.getString(2));
				movieView.setMovieRating(result.getString(3));
				movieView.setMovieInfo(result.getString(4));
				movieView.setReleaseDate(result.getString(5));
				movieView.setRuntime(result.getString(6));
				movieView.setDirectedBy(result.getString(7));
				movieView.setCast(result.getString(8));
				movieViews.add(movieView);
			}
			
			conn.close();
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return movieViews;
	}
	
	public ArrayList<String> getMovieIds(){
		String sql = "USE JAVA_THEATER; SELECT MOVIE_ID FROM TBLMOVIE;";
		ArrayList<String> movieIds = new ArrayList<String>();
		
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				movieIds.add(result.getString(1));
			}
			
			conn.close();
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return movieIds;
	}
	

}
