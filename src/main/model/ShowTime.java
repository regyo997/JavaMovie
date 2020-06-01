package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedHashMap;

import main.tbl_view.ShowTimeSeatView;

public class ShowTime {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet result = null;
	
	public LinkedHashMap<String,ArrayList<String>> getShowTime_All() {
		LinkedHashMap<String,ArrayList<String>> movieId_time = new LinkedHashMap<String,ArrayList<String>>();
		ArrayList<String> showtimes = null;
		
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
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return movieId_time;
	}
	
	public LinkedHashMap<String,ArrayList<String>> getShowTime_Date(String date) {
		String sql = "USE JAVA_THEATER; "
					+ "SELECT MOVIE_ID,SHOWTIME,COUNT(*) FROM TBLSHOWTIMES WHERE DATEDIFF(dd,SHOWTIME,?)=0 GROUP BY MOVIE_ID,SHOWTIME ORDER BY MOVIE_ID,SHOWTIME;";
		LinkedHashMap<String,ArrayList<String>> id_showtime = new LinkedHashMap<String,ArrayList<String>>();
		ArrayList<String> showtimes = null;
		
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

	public ArrayList<ShowTimeSeatView> getSeatStatus(String id,String showtime){
		ArrayList<ShowTimeSeatView> seatViews = new ArrayList<ShowTimeSeatView>();
		ShowTimeSeatView view = null;
		String sql = "USE JAVA_THEATER; "
				+ "SELECT * FROM TBLSHOWTIMES WHERE MOVIE_ID=? AND SHOWTIME=?;";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, showtime);
			result = pstmt.executeQuery();
			
			while(result.next()) {
				view = new ShowTimeSeatView();
				view.setMovieId(id);
				view.setShowtime(showtime);
				view.setHall(result.getString(3));
				view.setRow(result.getString(4).trim());
				view.setNo(result.getInt(5));
				view.setOccupied(result.getString(6));
				
				seatViews.add(view);
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return seatViews;
	}

	public String checkSeats(String movieId, String showtime, String row, int col) {
		String occupied = "";
		String sql="USE JAVA_THEATER; SELECT OCCUPIED FROM TBLSHOWTIMES "
				+ "WHERE MOVIE_ID=? AND SHOWTIME=? AND ROW=? AND NO=? ;";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			pstmt.setString(2, showtime);
			pstmt.setString(3, row);
			pstmt.setInt(4, col);
			
			result = pstmt.executeQuery();
			while(result.next()) {
				occupied = result.getString(1);
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return occupied;
	}

	public void changeSeatsStatus(String movieId, String showtime, String row, int col, String occupied) {
		String sql="USE JAVA_THEATER; "
				+ "UPDATE TBLSHOWTIMES SET OCCUPIED=? "
				+ "WHERE MOVIE_ID=? AND SHOWTIME=? AND ROW=? AND NO=? ;";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, occupied);
			pstmt.setString(2, movieId);
			pstmt.setString(3, showtime);
			pstmt.setString(4, row);
			pstmt.setInt(5, col);
			
			if(pstmt.executeUpdate() != 0) {
				System.out.println("reserve success!");
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
}
