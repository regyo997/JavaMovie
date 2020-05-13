package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ShowTimeAdd {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	public void setShowTimeSeat(String id, String showtime, String hall) {
		String sql = "USE JAVA_THEATER; "
					+ "INSERT INTO TBLSHOWTIMES(MOVIE_ID,SHOWTIME,HALL,ROW,NO,OCCUPIED) "
					+ "VALUES(?,?,?,?,?,?);";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			for(char c = 'A'; c <= 'J'; ++c) {
				for(int i=1; i<11; i++) {
					pstmt.setString(1, id);
					pstmt.setString(2, showtime);
					pstmt.setString(3, hall);
					pstmt.setString(4, String.valueOf(c));
					pstmt.setInt(5, i);
					pstmt.setString(6, "N");
					
					if(pstmt != null) {
						pstmt.executeUpdate();
					}
				}
			}
			
			System.out.println("Update success!");
			
			pstmt.close();
			conn.close();
		}catch(SQLException e) {
			System.out.println(e);
		}
	}
}
