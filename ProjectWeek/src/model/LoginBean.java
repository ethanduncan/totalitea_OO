package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseQueryingService;
import dto.Customer;

public class LoginBean implements Serializable {
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();

	/*
	 * 
	 * This is the bean responsible for logging registered users to the website.
	 * 
	 * The bean interacts with the totalitea database and queries if the input username and password
	 * match with a record. It also checks if a user is a gold member and creates a customer object with
	 * the users details. This customer object is stored in the session and the customer object methods
	 * used to get the users details.
	 * 
	 * 
	 */
	
	
	//
	// This method is the basic log in method. It queries the database and if a match is found returns
	// true.
	//
	public boolean checkUsernameAndPassword(String username, String password){
		
		boolean returnMe = false;

		try{
			
			String query = "Select * from customer where username = '" + username + "' and password = '" + password +"'";
			ResultSet res = dqs.queryDatabase(query);
			
			if(res.next()){
				
				returnMe = true;
				
			}else{
				
				returnMe = false;
				
			}
			
			return returnMe;
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		
		return returnMe;
	}
	
		
	//
	// Creates a customer object and stores the users information.
	//
	public Customer createCustomerOnLogin(String username, String password){
		
		try{
			
			String query = "Select * from customer where username = '" + username + "' and password = '" + password +"'";
			ResultSet res = dqs.queryDatabase(query);
			
			if(res.next()){
				
				Customer customer = new Customer();
				
				customer.setUsername(username);
				
				String id = res.getString("id");
				Long idL = Long.parseLong(id, 10); 
				customer.setId(idL);
				
				String emailAddress = res.getString("emailAddress");
				customer.setEmailAddress(emailAddress);
				
				String firstName = res.getString("firstName");
				customer.setFirstName(firstName);
				
				String lastName  = res.getString("lastName");
				customer.setLastName(lastName);
				
				Boolean isGoldMember  = res.getBoolean("goldMember");
				customer.setGoldMember(isGoldMember);
				
				String addressLine1  = res.getString("addressLine1");
				customer.setAddressLine1(addressLine1);
				
				String addressLine2 = res.getString("addressLine2");
				customer.setAddressLine2(addressLine2);
				
				String addressLine3  = res.getString("addressLine3");
				customer.setAddressLine3(addressLine3);
				
				return customer;
			}
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		
		return null;
		
	}
	
}
