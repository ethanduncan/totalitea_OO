package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import service.DatabaseQueryingService;

public class CustomerCountBean {
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();
	int count;
	
	public int Customers(){
		
try{
			
			ResultSet res = dqs.queryDatabase("SELECT id COUNT  FROM customer");
			
			   {
				    count = res.getInt("COUNT");
				    return count;
			   }
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		return count;
		
	}
}
		
