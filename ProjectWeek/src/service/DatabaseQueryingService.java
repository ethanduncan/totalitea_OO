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
			this.stat = this.con.createStatement();
			this.res = this.stat.executeQuery(query);
		} catch (SQLException e) {
			e.getMessage();
		}
		
		return this.res;
		
	}
	
	@Override
	public void closeConnection() {
		try {
			this.stat.close();
			this.con.close();
			this.res.close();
		} catch (SQLException e) {
			e.getMessage();
		}
	}
	
	
}
