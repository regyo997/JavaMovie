package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class TicketType {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	
	public HashMap<String,Integer> getTicketType(){
		String sql = "USE JAVA_THEATER; SELECT * FROM TBLTICKET;";
		HashMap<String,Integer> ticketType_price = new HashMap<String,Integer>();
		
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				ticketType_price.put(result.getString(1), result.getInt(2));
			}
			
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return ticketType_price;
	}

}
