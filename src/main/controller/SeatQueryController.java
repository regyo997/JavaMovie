package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import main.model.SeatQuery;
import main.tbl_view.ShowTimeSeatView;

@WebServlet("/seatQuery")
public class SeatQueryController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		String id = request.getParameter("id");
//		String showtime = request.getParameter("showtime");
		
		SeatQuery seat = new SeatQuery();
//		ArrayList<ShowTimeSeatView> seatViews = seat.getSeatStatus(id, showtime);
		ArrayList<ShowTimeSeatView> seatViews = seat.getSeatStatus("USA02", "2020-05-16 13:40");
		
		HashMap<String,ArrayList<ShowTimeSeatView>> map = new HashMap<String,ArrayList<ShowTimeSeatView>>();
		map.put("key", seatViews);
		
		request.setAttribute("hall", seatViews.get(0).getHall());
		
		JSONObject responseJSONObject = new JSONObject(map);
		PrintWriter out = response.getWriter();
        out.println(responseJSONObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
