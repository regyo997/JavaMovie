package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import main.model.BookingRecord;
import main.tbl_view.TicketInfoTimeView;

/**
 * Servlet implementation class BookingRecordController
 */
@WebServlet("/bookingRecord")
public class BookingRecordController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		String userId = request.getParameter("userId");
		String transactionNo = request.getParameter("transactionNo");
		
		BookingRecord record = new BookingRecord();
		LinkedHashMap<String,ArrayList<TicketInfoTimeView>> ticketInfoMap = null;
		PrintWriter out = response.getWriter();
		
		if(userId != null) {
			ticketInfoMap = record.getRecordByUserId(userId);
		}else if(transactionNo != null) {
			ticketInfoMap = record.getRecordByTransactionNo(transactionNo);
		}else {
			out.print("no data.");
		}
		
		JSONObject responseJSONObject = new JSONObject(ticketInfoMap);
        out.println(responseJSONObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
