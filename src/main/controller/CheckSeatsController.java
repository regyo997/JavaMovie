package main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import main.model.ShowTime;

/**
 * Servlet implementation class BookingConfirmController
 */
@WebServlet("/checkSeats")
public class CheckSeatsController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String movieId = (String)request.getParameter("id");
		String showtime = (String)request.getParameter("showtime");
		String occupied="";
		
		ShowTime show = new ShowTime();
		HashMap<String,String> map = new HashMap<String,String>();
		String seats = request.getParameter("seats");
		String[] pairs = seats.split(",");
		
		for (int i=0;i<pairs.length;i++) {
			String pair = pairs[i];
			String[] keyValue = pair.split("_");
			String row = keyValue[0].replaceAll("[\\pP\\p{Punct}]","");
			int col = Integer.parseInt(keyValue[1].replaceAll("[\\pP\\p{Punct}]",""));
			
			occupied=show.checkSeats(movieId, showtime, row, col);
			if(occupied.equals("Y")) {
				break;
			}else {
				continue;
			}
		}
		
		JSONObject responseJSONObject = new JSONObject();
		responseJSONObject.put("occupied", occupied);
		
		PrintWriter out = response.getWriter();
        out.println(responseJSONObject);
		
//		JSONArray JsonArray = new JSONArray((String)request.getParameter("seats"));
//		List<Object> list = JsonArray.toList();
//		ShowTime show = new ShowTime();
//		for(int i=0;i<list.size();i++) {
//			HashMap<String,String> map = (HashMap<String,String>)list.get(i);
//			occupied=show.checkSeats(movieId, showtime, map.get("row"), Integer.parseInt(map.get("col")));
//			if(occupied.equals("Y")) {
//				break;
//			}else {
//				continue;
//			}
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
