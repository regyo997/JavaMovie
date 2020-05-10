package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserUpdate {
	private String sql = "USE JAVA_THEATER;UPDATE TBLUSER SET PASSWORD=?,ADDRESS=?,PHONE=?;";
	private String msg = "";


	public String update(String pw,String address,String phone ) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, address);
			ps.setString(3, phone);

			ps.executeUpdate();
			
			msg="User data update success.";

		} catch (SQLException e) {
			System.out.print(e);
		}

		return msg;
	}

}
