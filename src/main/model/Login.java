package main.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Login {
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER;SELECT USER_ID,PASSWORD FROM TBLUSER WHERE USER_ID=? AND PASSWORD=?;";
	private String msg="";
	
	public String signin(String USER_ID,String PASSWORD) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, USER_ID);
			ps.setString(2, PASSWORD);
			result = ps.executeQuery();
			
			if(result.next())
				msg="登入成功";
			else
				msg="帳號或密碼錯誤";
				
			
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return msg;
	}
}
