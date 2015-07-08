package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectorService {
	
	private Connection con;

	public DatabaseConnectorService() {
		
	}
	
	public Connection openConnection(String db, String user, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");							//Gets the drivers for the MySQL connection
			this.con = DriverManager.getConnection(
					db, user, pass											//Opens the connection to the 
			);																//given database
		} catch (SQLException e) {
			e.getMessage();
		} catch (ClassNotFoundException e) {
			e.getMessage();
		}
		
		return this.con;
	}
	
	public void closeConnection() {
		try {
			this.con.close();
		} catch (SQLException e) {
			e.getMessage();
		}
	}
	
	public Connection getConnection() {
		return this.con;
	}
	
}
