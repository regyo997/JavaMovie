package main.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import main.tbl_view.NewsView;

public class News {
	private Connection conn=null;
	private Statement stmt=null;
	private ResultSet result=null;
	
	public ArrayList<NewsView> getNewsViews(){
		String sql="USE JAVA_THEATER;SELECT * FROM TBLNEWS;";
		ArrayList<NewsView> newviews=new ArrayList<NewsView>();
		NewsView newview=null;
		LocalDate today=LocalDate.now();
		
		try {
			conn=ConnectionManager.getConnection();
			stmt=conn.createStatement();
			result=stmt.executeQuery(sql);
			
			while(result.next()) {
				newview=new NewsView();
				newview.setTitle(result.getString(1));
				newview.setContent(result.getString(2));
				newview.setStart_date(result.getString(3));
				newview.setEnd_date(result.getString(4));
				newviews.add(newview);
			}
			
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return newviews;
	}
}
