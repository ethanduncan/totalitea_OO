package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseQueryingService;
import dto.Customer;

public class ACPLoginBean implements Serializable {
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();
	
	public boolean LOGIN(String aLogin, String aPass){
		
		boolean returnMe = false;

		System.out.println("Gets to here");
		try{
			
			String query = "Select * from admin where username = '" + aLogin + "' and password = '" + aPass +"'";
			ResultSet res = dqs.queryDatabase(query);
			
			if(res.next()){
				
				returnMe = true;
				System.out.println("true");
				
			}else{
				
				returnMe = false;
				System.out.println("false");

				
			}
			
			return returnMe;
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		
		return returnMe;
	}
		
	
}