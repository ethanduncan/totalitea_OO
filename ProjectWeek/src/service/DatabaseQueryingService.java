package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseQueryingService extends DatabaseConnectorService{
	
	DatabaseConnectorService dbc = new DatabaseConnectorService();
	
	private Statement stat;
	private Connection con = dbc.openConnection("totalitea", "root", "teatime");
	private ResultSet res;
	
	public DatabaseQueryingService() {
		//Zero-args constructor
	}	

	public ResultSet queryDatabase(String query) {
		
		try {
			stat = con.createStatement();
			this.res = stat.executeQuery(query);
		} catch (SQLException e) {
			e.getMessage();
		}
		
		return this.res;
		
	}
	
	
	
}