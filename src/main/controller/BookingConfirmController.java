package main.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

/**
 * Servlet implementation class BookingConfirmController
 */
@WebServlet("/bookingConfirm")
public class BookingConfirmController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
//		System.out.println((String)request.getParameter("seats"));
//		String[] seats = request.getParameterValues("seats");
//		System.out.println(seats);
//		for(int i=0; i<seats.length; i++) {
			
//		}
//		System.out.println((String)request.getParameter("types"));
//		System.out.println((String)request.getParameter("id"));
		
		JSONArray JsonArray = new JSONArray((String)request.getParameter("seats"));
		for(int i=0;i<JsonArray.toList().size();i++) {
//			HashMap<String,String> map = (HashMap<String,String>)JsonArray.toList().get(i);
//			String row = "";
//			int col = 0;
//			for(String seat:map.keySet()) {
//				row=map.get(seat).substring(0, 2);
//				col=map.get(seat).substring(0, 2);
//				 System.out.println(map.get(seat));
//			}
			System.out.println(JsonArray.toList().get(i));
		}
//		System.out.println(JsonArray.toList());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
