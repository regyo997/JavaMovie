package main.tbl_view;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class MovieShowTimeView {
	private String movieId;
	private String movieName;
	private String movieRating;
	private String releaseDate;
	private String runtime;
	private String showdate;
	private ArrayList<String> times;
	private LinkedHashMap<String,ArrayList<String>> showtimes;
	
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
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getShowdate() {
		return showdate;
	}
	public void setShowdate(String showdate) {
		this.showdate = showdate;
	}
	public ArrayList<String> getTimes() {
		return times;
	}
	public void setTimes(ArrayList<String> times) {
		this.times = times;
	}
	public LinkedHashMap<String, ArrayList<String>> getShowtimes() {
		return showtimes;
	}
	public void setShowtimes(LinkedHashMap<String, ArrayList<String>> showtimes) {
		this.showtimes = showtimes;
	}
	
}
