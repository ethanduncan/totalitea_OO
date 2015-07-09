package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseAlterationService extends DatabaseConnectorService {
	

	private Statement stat;
	private Connection con = openConnection("totalitea", "root", "teatime");
	
	public DatabaseAlterationService() {
		//Zero-args constructor
	}
	
	public boolean updateDatabase(String table, String column,Object columnValue, String value, String newValue) {
		
		int res;
		boolean status = false;													//default to fail
		
		try {
			
			this.stat = this.con.createStatement();
			res = this.stat.executeUpdate("UPDATE "+table+" SET "+value+"="+newValue+" WHERE "+column+"="+columnValue);
			
			if(res==1){
				status = true;
			}
			return status;
		} catch (SQLException e) {
			e.getMessage();
		}
		
		return status;
	}
	
	

}
