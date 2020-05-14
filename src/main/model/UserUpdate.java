package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import main.tbl_view.UserView;

public class UserUpdate {
	private String sqlUpdate = "USE JAVA_THEATER;UPDATE TBLUSER SET PASSWORD=?,ADDRESS=?,PHONE=?;";
	private String msg = "";


	public String update(String pw,String address,String phone ) {
		try {
			Connection conn = ConnectionManager.getConnection();
			PreparedStatement ps = conn.prepareStatement(sqlUpdate);
			ps.setString(1, pw);
			ps.setString(2, address);
			ps.setString(3, phone);

			ps.executeUpdate();
			
			msg="success";

		} catch (SQLException e) {
			System.out.print(e);
		}

		return msg;
	}

}
