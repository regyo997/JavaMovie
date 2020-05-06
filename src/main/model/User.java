package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import main.tbl_view.UserView;

public class User {
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER; SELECT * FROM TBLUSER;";
	private ArrayList<UserView> userViews = new ArrayList<UserView>();
	private UserView userView = null;
	
	public ArrayList<UserView> getUserViews(){
		try {
			conn = ConnectionManager.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			
			while(result.next()) {
				userView = new UserView();
				userView.setUserId(result.getString(1));
				userView.setPassword(result.getString(2));
				userView.setName(result.getString(3));
				userView.setAddress(result.getString(4));
				userView.setPhone(result.getString(5));
				userView.setEmail(result.getString(6));
				userView.setBirthday(result.getDate(7));
				userViews.add(userView);
			}
			
			conn.close();
		}catch(SQLException e) {}
		
		return userViews;
	}

}
