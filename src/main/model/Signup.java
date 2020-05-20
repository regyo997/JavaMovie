package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Signup {
	private ResultSet result_USERID = null;
	private ResultSet result_EMAIL=null;
	private String sql_update = "USE JAVA_THEATER;INSERT INTO TBLUSER (USER_ID,PASSWORD,NAME,ADDRESS,PHONE,EMAIL,BIRTHDAY) VALUES (?,?,?,?,?,?,?);";
	private String msg = null;
	private String sql_check_USERID = "USE JAVA_THEATER;SELECT * FROM TBLUSER WHERE USER_ID=?;";
	private String sql_check_EMAIL = "USE JAVA_THEATER;SELECT * FROM TBLUSER WHERE EMAIL=?;";

	public String signup(String id, String pw, String name, String address, String phone, String email,
			String birthday) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql_update);
			
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setString(4, address);
			ps.setString(5, phone);
			ps.setString(6, email);
			ps.setString(7, birthday);

			PreparedStatement ps2 = conn.prepareStatement(sql_check_USERID);
			ps2.setString(1, id);
			result_USERID = ps2.executeQuery();
			
			PreparedStatement ps3=conn.prepareStatement(sql_check_EMAIL);
			ps3.setString(1, email);
			result_EMAIL = ps3.executeQuery();
			
			
			if (!result_USERID.next()&&!result_EMAIL.next()) {
				ps.executeUpdate();
				msg = "success";
			} else if(result_USERID.next()&&result_EMAIL.next()){
				msg = "both";
			} else if(result_USERID.next()&&!result_EMAIL.next()) {
				msg = "USERID";
			} else if(!result_USERID.next()&&result_EMAIL.next()) {
				msg = "EMAIL";
			}
			conn.close();
		} catch (SQLException e) {
			System.out.print(e);
		}

		return msg;
	}

}
