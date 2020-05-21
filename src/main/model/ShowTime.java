package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;

public class ShowTime {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	
	private LinkedHashMap<String,ArrayList<String>> movieId_time = new LinkedHashMap<String,ArrayList<String>>();
	private ArrayList<String> showtimes = null;
	
	public LinkedHashMap<String,ArrayList<String>> getShowTimeData() {
		Calendar cal = Calendar.getInstance();
		int today = cal.get(Calendar.DAY_OF_WEEK);
		int days = 0;
		
		if(today == 6 || today == 7)
			days = (7-today)+6;
		else
			days = 6-today;
		// sql view
		String sql = "USE JAVA_THEATER; "
				+ "SELECT MOVIE_ID,SHOWTIME, COUNT(*) FROM TBLSHOWTIMES "
				+ "WHERE SHOWTIME BETWEEN CONVERT(DATE, GETDATE()) AND CONVERT(DATE, GETDATE()+ "+days+")  "
				+ "GROUP BY MOVIE_ID,SHOWTIME ORDER BY MOVIE_ID,SHOWTIME;";
		
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			long timestamp = 0;
			SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			SimpleDateFormat formatWeek = new SimpleDateFormat("E");
			String movieId = "";
			String showtime = "";
			String week = "";
			
			while(result.next()) {
				movieId = result.getString(1);
				timestamp = result.getTimestamp(2).getTime();
				week="("+formatWeek.format(new Date(timestamp))+")";
				showtime = formatDate.format(new Date(timestamp));
				showtime=showtime.substring(0,11).concat(week).concat(showtime.substring(11,16));
				
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
