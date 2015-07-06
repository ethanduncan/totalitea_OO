package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Customer;

public class ACPLoginBean implements Serializable {

	
	public boolean LOGIN(String aLogin, String aPass){
		
		boolean returnMe = false;

		System.out.println("Gets to here");
		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
															"root", "teatime");
			Statement stat = con.createStatement();
			ResultSet res = stat.executeQuery("Select * from admin where username = '" 
					+ aLogin + "' and password = '" + aPass +"'");
			
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
		catch (ClassNotFoundException e){ e.printStackTrace(); }
		
		return returnMe;
	}
		
	
}