package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseQueryingService;

public class SearchBean implements Serializable {
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();

	private String id = "";
	private String category = "";
	private String description = "";
	private String itemWeight = "";
	private String price = "";
	private String quantityInStock = "";
	private String items = "";
	private String average = "";

	public String getItems(String searchText, String searchType){
		
		try{
			ResultSet res = null;
			String query = "";
			if (searchType.equals("category")){
				
				query = String.valueOf("Select * from item where category like \'%" + searchText + "%\'");
				res = dqs.queryDatabase(query);
				
			} //queries category column for anything matching the search text
			else if (searchType.equals("name")){
				
				query = String.valueOf("Select * from item where description like \'%" + searchText + "%\'");
				res = dqs.queryDatabase(query);
				
			}
			if (!res.next()){
				
				return "No results found, please search again.";
				
			}
			while(res.next()){
				
				id = res.getString("id");
				category = res.getString("category");
				description = res.getString("description");
				itemWeight = res.getString("itemWeight");
				price = res.getString("price");
				quantityInStock = res.getString("quantityInStock");
				average = res.getString("average_ratings");
				
				items += "<tr>"
							+ "<form action = 'BasketController' method = 'get'><td>" + description + "</td>"
								+ "<td>" + category + "</td><td>£" + price + "</td><td>" + quantityInStock 
										+ "<input type = 'hidden' name = 'basketID' value = '" + id + "'>"
										+ "<input type = 'hidden' name = 'basketWeight' value = '" + itemWeight + "'>"
										+ "<input type = 'hidden' name = 'basketDescription' value = '" + description + "'>"
										+ "<input type = 'hidden' name = 'basketPrice' value = '" + price + "'>"
								+ "</td>"
								+ "<td>"
								+ "<button class='btn btn-success' type ='submit' style='width: 60px; height: 60px; margin-left: 20px;'><i class='fa fa-cart-plus fa-2x'></i></button>"
							+ "</td>"
						+ "</form>"
								+ "<form action='ControllingServlet' method='GET'>"
									+ "<td>"
										+ "<input type='hidden' name='starId' value='" + id + "'>"
										+ "<input type='hidden' name='page' value='8'>"
										+ "<select class='form-control' name='star'>"
											+ "<option class='disabled'>Choose a star rating</option>"
											+ "<option>1</option>"
											+ "<option>2</option>"
											+ "<option>3</option>"
											+ "<option>4</option>"
											+ "<option>5</option>"
										+ "</select>"
										+ "<button class='btn btn-default' type='submit'>Rate</button>"
									+ "</td>"
									+ "<td>" + average + "</td>" 
								+ "</form>"
						+ "</tr>";
							


				//Concatenates the item variable with a string that returns the values of every item that matches the search query, formatted to display within a table
				//The first part of the string contains a form that allows the user to press a button and add the item to their cart. 
				//The second part contains a form which allows the user to choose a rating from 1-5 for the item and submit that value to be saved onto the database
			}
			
			return items; //returns the item string
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
	
		return "Error";//if searches did not work returns error text
}
}

