package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Login {
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER;SELECT * FROM TBLUSER WHERE USER_ID=? AND PASSWORD=?;";
	private String name=null;
	
	public String signin(String USER_ID,String PASSWORD) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, USER_ID);
			ps.setString(2, PASSWORD);
			result = ps.executeQuery();

			if(result.next())
				name=result.getString(3);				
			
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return name;
	}
}
