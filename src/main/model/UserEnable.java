package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class UserEnable {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private String sql = "USE JAVA_THEATER; UPDATE TBLUSER SET STATE='1' WHERE USER_ID=?;";
	public void enable(String USER_ID){
		try {
			conn = ConnectionManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,USER_ID);
			ps.executeUpdate();
			conn.close();
		}catch(SQLException e) {
			
		}
		
	}
}
