package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PasswordReset {
	private String sqlUpdate = "USE JAVA_THEATER;UPDATE TBLUSER SET PASSWORD=? WHERE EMAIL=?;";
	private String msg = "";


	public String reset(String pw,String email) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sqlUpdate);
			ps.setString(1, pw);
			ps.setString(2, email);

			ps.executeUpdate();
			
			msg="success";
			
		} catch (SQLException e) {
			System.out.print(e);
		}

		return msg;
	}
}
