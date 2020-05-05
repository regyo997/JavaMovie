package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class Movie {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER; SELECT * FROM TBLMOVIE;";
	private HashMap<String,String> movieId_name = new HashMap<String,String>();
	
	public HashMap<String,String> getMovieName(){
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				movieId_name.put(result.getString(1), result.getString(2));
			}
			
			conn.close();
		}catch(SQLException e) {}
		
		return movieId_name;
	}

}
