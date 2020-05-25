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
		JSONArray JsonArray = new JSONArray(request.getParameter("seats"));
		JSONObject obj;
		for(int i=0; i<JsonArray.length(); i++) {
			obj = JsonArray.getJSONObject(i);
			occupied=show.checkSeats(movieId, showtime, obj.getString("row"), obj.getInt("col"));
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
        
//		String seats = request.getParameter("seats");
//		String[] pairs = seats.split(",");
//		
//		for (int i=0;i<pairs.length;i++) {
//			String pair = pairs[i];
//			String[] keyValue = pair.split("_");
//			String row = keyValue[0].replaceAll("[\\pP\\p{Punct}]","");
//			int col = Integer.parseInt(keyValue[1].replaceAll("[\\pP\\p{Punct}]",""));
//			
//			occupied=show.checkSeats(movieId, showtime, row, col);
//			if(occupied.equals("Y")) {
//				break;
//			}else {
//				continue;
//			}
//		}
//		
//		JSONObject responseJSONObject = new JSONObject();
//		responseJSONObject.put("occupied", occupied);
//		
//		PrintWriter out = response.getWriter();
//        out.println(responseJSONObject);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
