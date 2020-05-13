package main.model;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import main.tbl_view.MovieView;

public class MovieAdd {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public void setMovieInfo(MovieView view) {
		String sql = "USE JAVA_THEATER; "
					+ "INSERT INTO TBLMOVIE(MOVIE_ID,NAME,RATING,MOVIE_INFO,RELEASE_DATE,RUNTIME,DIRECTED_BY,CAST) "
					+ "VALUES(?,?,?,?,?,?,?,?);";
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
//			Date parsed = format.parse(view.getReleaseDate());
//			java.sql.Date date = new java.sql.Date(parsed.getTime());
			
			pstmt.setString(1, view.getMovieId());
			pstmt.setString(2, view.getMovieName());
			pstmt.setString(3, view.getMovieRating());
			pstmt.setString(4, view.getMovieInfo());
			pstmt.setString(5, view.getReleaseDate());
			pstmt.setString(6, view.getRuntime());
			pstmt.setString(7, view.getDirectedBy());
			pstmt.setString(8, view.getCast());
			
			if(pstmt != null) {
				pstmt.executeUpdate();
				System.out.println("Update success!");
			}
			
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			System.out.println(e);
			
		}
		
	}

}
