package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class ShowTimeQuery {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER; "
			+ "SELECT MOVIE_ID,SHOWTIME,COUNT(*) FROM TBLSHOWTIMES WHERE DATEDIFF(dd,SHOWTIME,?)=0 GROUP BY MOVIE_ID,SHOWTIME ORDER BY MOVIE_ID,SHOWTIME;";
	private LinkedHashMap<String,ArrayList<String>> id_showtime = new LinkedHashMap<String,ArrayList<String>>();
	private ArrayList<String> showtimes = null;

	public LinkedHashMap<String,ArrayList<String>> getShowTIme(String date) {
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			result = pstmt.executeQuery();
			
			String movieId = "";
			String showtime = "";
			
			while(result.next()) {
				movieId = result.getString(1);
				showtime = result.getTime(2).toString().substring(0, 5);
				
				if(!id_showtime.containsKey(movieId)) {
					showtimes = new ArrayList<String>();
					showtimes.add(showtime);
					id_showtime.put(movieId, showtimes);
				}else {
					id_showtime.get(movieId).add(showtime);
				}
			}
			
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return id_showtime;
	}
}
