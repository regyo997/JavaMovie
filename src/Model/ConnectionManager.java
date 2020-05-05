package Model;
import java.sql.*;

public class ConnectionManager {
	private static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url = "jdbc:sqlserver://localhost;user=sa;password=1234";
	private static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url);
			
		}catch(ClassNotFoundException e) {
			System.out.println("Driver not found.");
			
		}catch(SQLException ex) {
			System.out.println("Failed to create the database connection.");
		}
		
		return conn;
	}
}
