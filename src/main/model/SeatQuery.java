package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import main.tbl_view.ShowTimeSeatView;

public class SeatQuery {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet result = null;
	
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

}
