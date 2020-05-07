package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import main.tbl_view.UserView;


public class UserQuery {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet result = null;
	private String sql = "USE JAVA_THEATER; SELECT * FROM TBLUSER WHERE USER_ID=?;";
	private UserView userview=new UserView();
	public UserView getUserDatas(String USER_ID){
		try {
			conn = ConnectionManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1,USER_ID);
			result = ps.executeQuery();
			
			while(result.next()) {
				
				userview.setUserId(result.getString(1));
				userview.setPassword(result.getString(2));
				userview.setName(result.getString(3));
				userview.setAddress(result.getString(4));
				userview.setPhone(result.getString(5));
				userview.setEmail(result.getString(6));
				userview.setBirthday(result.getDate(7));
			}
			
			conn.close();
		}catch(SQLException e) {}
		
		return userview;
	}
}
