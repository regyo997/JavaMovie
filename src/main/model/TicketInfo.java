package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TicketInfo {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public void setTicketInfo(String movieId, String showtime, String hall, String row, int no, String type, String userId, String transactionNo) {
		String sql="USE JAVA_THEATER;"
				+ "INSERT INTO TBLTICKET_INFO(MOVIE_ID,SHOWTIME,HALL,ROW,NO,TICKET_TYPE,SALES_ID,USER_ID,TRANSACTION_NO) "
				+ "VALUES(?,?,?,?,?,?,0,?,?);";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, movieId);
			pstmt.setString(2, showtime);
			pstmt.setString(3, hall);
			pstmt.setString(4, row);
			pstmt.setInt(5, no);
			pstmt.setString(6, type);
			pstmt.setString(7, userId);
			pstmt.setString(8, transactionNo);
			
			if(pstmt.executeUpdate() != 0) {
				System.out.println("TBLTICKET_INFO insert success!");
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
