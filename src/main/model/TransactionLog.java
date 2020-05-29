package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TransactionLog {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	private PreparedStatement pstmt = null;
	
	public String getLastTransactionNo() {
		String serialNo = "";
		String sql = "USE JAVA_THEATER; "
				+ "SELECT TOP 1 TRANSACTION_NO FROM TBLTRANSACTION_LOG ORDER BY TRANSACTION_TIME DESC;";
		
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				serialNo = result.getString(1);
			}
			
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return serialNo;
	}

	public String setLog(String no) {
		String sql="USE JAVA_THEATER;"
				+ "INSERT INTO TBLTRANSACTION_LOG(TRANSACTION_NO,TRANSACTION_TIME) VALUES(?,GETDATE());";
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			if(pstmt.executeUpdate() != 0) {
				System.out.println("TBLTRANSACTION_LOG insert success!");
				return no;
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return "false";
	}
}
