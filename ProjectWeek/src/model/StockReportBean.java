package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseAlterationService;
import service.DatabaseQueryingService;

public class StockReportBean implements Serializable{
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();
	DatabaseAlterationService das = new DatabaseAlterationService();

	private String id = "";
	private String category = "";
	private String description = "";
	private String quantityInStock = "";
	private String items = "";

	public String getItems(){
		
		
		try{
			String query = "Select * from item";
			ResultSet res = dqs.queryDatabase(query);
			
			while(res.next()){
				
				id = res.getString("id");
				category = res.getString("category");
				description = res.getString("description"); //sets the variables of this class to the values returned by the query.
				quantityInStock = res.getString("quantityInStock");
				int StockInt =Integer.parseInt(quantityInStock);
				
				if(StockInt > 5){
					items += "<form action = 'ControllingServlet' method = 'get'><tr><td>" + id + "</td><td>" + category + "</td><td>" + description + "</td><td>" + quantityInStock 
						  + "</td><td><input name = 'updateTotal' type = 'text'><input type = 'hidden' name = 'page' value = '7'><input type = 'hidden' name = 'updateID' value = '" + id + "'></td><td><button type = 'submit' class='btn btn-success'>Update</button></td><td>" + "Stock Ok</td></tr></form>";
					//concatenates the item string with a list of all the details about the items on the database with all variables set to display within a row of a table. The string also contains a html form designed to process an input amount in order to update the stock totals.
				} else { 
					items += "<form action = 'ControllingServlet' method = 'get'><tr><td>" + id + "</td><td>" + category + "</td><td>" + description + "</td><td>" + quantityInStock 
						  + "</td><td><input name = 'updateTotal' type = 'text'><input type = 'hidden' name = 'page' value = '7'><input type = 'hidden' name = 'updateID' value = '" + id + "'></td><td><button type = 'submit' class='btn btn-danger'>Update</button></td><td>" + "Re-order</td></tr></form>";	
				} //this second string functions in exactly the same way as the first, the only difference being that if the amount of stock of an item is less than 5 the table will show to re-order the item and the button will change colour
				
			}
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());} //catches exceptions
		return items;
	}
	
	public void updateItemTotal(String updateID, String updateTotal) {
		
		das.updateDatabase("item", "quantityInStock", updateTotal, "id", updateID);
		
	}
}

