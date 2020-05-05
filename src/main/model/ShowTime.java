package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

public class ShowTime {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER; SELECT DISTINCT MOVIE_ID,SHOWTIME FROM TBLSHOWTIMES ORDER BY MOVIE_ID,SHOWTIME;";
	private LinkedHashMap<String,ArrayList<String>> movieId_time = new LinkedHashMap<String,ArrayList<String>>();
	private ArrayList<String> showtimes = null;
	
	public LinkedHashMap<String,ArrayList<String>> getShowTimeData() {
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			long timestamp = 0;
			SimpleDateFormat formatTime = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String movieId = "";
			String showtime = "";
			
			while(result.next()) {
				movieId = result.getString(1);
				timestamp = result.getTimestamp(2).getTime();
				showtime = formatTime.format(new Date(timestamp));
				
				if(movieId_time.containsKey(movieId)) {
					movieId_time.get(movieId).add(showtime);
				}else {
					showtimes = new ArrayList<String>();
					showtimes.add(showtime);
					movieId_time.put(movieId, showtimes);
				}
			}
			
			conn.close();
		}catch(SQLException e) {}
		
		return movieId_time;
	}

}
