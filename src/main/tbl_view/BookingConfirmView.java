package main.tbl_view;

import java.util.ArrayList;
import java.util.HashMap;

public class BookingConfirmView {
	private String movieId;
	private String movieName;
	private String movieRating;
	private String showtime;
	private String hall;
	private ArrayList<String> seats;
	private HashMap<String,String> types;
	private String userId;
	
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieRating() {
		return movieRating;
	}
	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getHall() {
		return hall;
	}
	public void setHall(String hall) {
		this.hall = hall;
	}
	public ArrayList<String> getSeats() {
		return seats;
	}
	public void setSeats(ArrayList<String> seats) {
		this.seats = seats;
	}
	public HashMap<String, String> getTypes() {
		return types;
	}
	public void setTypes(HashMap<String, String> types) {
		this.types = types;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
