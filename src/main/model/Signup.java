package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Signup {
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER;INSERT INTO TBLUSER (USER_ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,BIRTHDAY) VALUES (?,?,?,?,?,?,?);";
	private String msg = "";
	private String sql2 = "USE JAVA_THEATER;SELECT * FROM TBLUSER WHERE USER_ID=?;";

	public String signup(String id, String pw, String name, String address, String phone, String email,
			String birthday) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, address);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setString(7, birthday);

			ps2.setString(1, id);

			result = ps2.executeQuery();

			if (!result.next()) {
				ps.executeUpdate();
				msg = "Signup Success.";
			} else {
				msg = "USER_ID has been use.";
			}
		} catch (SQLException e) {
			System.out.print(e);
		}

		return msg;
	}

}
