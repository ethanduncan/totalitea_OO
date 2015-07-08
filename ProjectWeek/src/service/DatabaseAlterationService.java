package service;

import java.sql.Connection;
import java.sql.Statement;

public class DatabaseAlterationService extends DatabaseConnectorService {
	
	DatabaseConnectorService dbc = new DatabaseConnectorService();
	
	private Statement stat;
	private Connection con = dbc.openConnection("totalitea", "root", "teatime");
	
	public DatabaseAlterationService() {
		//Zero-args constructor
	}
	
	public boolean updateDatabase(String table, String column, String value) {
		
		boolean status = false;													//default to fail
		
		
		
		return status;
	}
	
	

}
