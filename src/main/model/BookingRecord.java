package main.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import main.tbl_view.TicketInfoTimeView;

public class BookingRecord {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet result = null;
	
	public LinkedHashMap<String,ArrayList<TicketInfoTimeView>> getRecord(String sql, String str){
		LinkedHashMap<String,ArrayList<TicketInfoTimeView>> ticketInfoMap = new LinkedHashMap<String,ArrayList<TicketInfoTimeView>>();
		ArrayList<TicketInfoTimeView> ticketInfoViews = null;
		String transactionNo="";
		String showtime="";
		String transactionTime = "";
		long timestamp = 0;
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		try {
			conn = ConnectionManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, str);
			result = pstmt.executeQuery();
			
			while(result.next()) {
				TicketInfoTimeView view = new TicketInfoTimeView();
				transactionNo = result.getString(11);
				timestamp = result.getTimestamp(4).getTime();
				showtime = formatDate.format(new Date(timestamp));
				timestamp = result.getTimestamp(12).getTime();
				transactionTime = formatDate.format(new Date(timestamp));
				
				view.setTicketNo(result.getInt(1));
				view.setMovieId(result.getString(2));
				view.setMovieName(result.getString(3));
				view.setShowtime(showtime);
				view.setHall(result.getString(5));
				view.setRow(result.getString(6));
				view.setCol(result.getInt(7));
				view.setUserId(result.getString(8));
				view.setType(result.getString(9));
				view.setPrice(result.getInt(10));
				view.setTransactionNo(result.getString(11));
				view.setTransactionTime(transactionTime);
				
				if(ticketInfoMap.containsKey(transactionNo)) {
					ticketInfoMap.get(transactionNo).add(view);
				}else {
					ticketInfoViews = new ArrayList<TicketInfoTimeView>();
					ticketInfoViews.add(view);
					ticketInfoMap.put(transactionNo, ticketInfoViews);
				}
			}
			
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return ticketInfoMap;
	}
	
	public LinkedHashMap<String,ArrayList<TicketInfoTimeView>> getRecordByUserId(String userId){
		String sql = "USE JAVA_THEATER; SELECT * FROM TICKETINFO_TIME_VIEW WHERE USER_ID=? "
				+ "ORDER BY TRANSACTION_TIME;";
		
		return getRecord(sql, userId);
	}
	
	public LinkedHashMap<String,ArrayList<TicketInfoTimeView>> getRecordByTransactionNo(String transactionNo){
		String sql = "USE JAVA_THEATER; SELECT * FROM TICKETINFO_TIME_VIEW WHERE TRANSACTION_NO=? "
				+ "ORDER BY TRANSACTION_TIME;";
		
		return getRecord(sql, transactionNo);
	}
}
