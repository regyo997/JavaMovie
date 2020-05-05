package Model;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ShowTime show = new ShowTime();
		LinkedHashMap<String,ArrayList<String>> movieIdHashMap
				= show.getShowTimeData();
		for(String id:movieIdHashMap.keySet()) {
			System.out.println("MovieID: "+id);
			System.out.print("show time: ");
			for(String time:movieIdHashMap.get(id)) {
				System.out.print(time+" ");
			}
			System.out.println();
		}
		
	}

}
