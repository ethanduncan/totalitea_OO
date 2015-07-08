package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SearchBean implements Serializable {

	private String id = "";
	private String category = "";
	private String description = "";
	private String itemWeight = "";
	private String price = "";
	private String quantityInStock = "";
	private String items = "";
	private String average = "";

	public String getItems(String searchText, String searchType){
		
		if (searchType.equals("category")) { //if the search type passed in equals category it runs this try/catch
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
															"root", "teatime"); //connects to local server
			Statement stat = con.createStatement();
			ResultSet res = stat.executeQuery("Select * from item where category like \'%" + searchText + "%\'"); //queries category column for anything matching the search text
			
			while(res.next()){
				
				id = res.getString("id");
				category = res.getString("category");
				description = res.getString("description");
				itemWeight = res.getString("itemWeight");
				price = res.getString("price");
				quantityInStock = res.getString("quantityInStock");
				average = res.getString("average_rating");
				
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
		catch (ClassNotFoundException e){ e.printStackTrace(); } //catches exceptions
	}
	else if (searchType.equals("name")) { //if the search type passed in equals name then it runs this try/catch
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
															"root", "teatime"); //connects to the local server
			Statement stat = con.createStatement();
			ResultSet res = stat.executeQuery("Select * from item where description like \'%" + searchText + "%\'"); //queries the description column from the table for text matching the searchText
			
			while(res.next()){
				
				id = res.getString("id");
				category = res.getString("category");
				description = res.getString("description");//sets the variables as the results returned from the query (also overwrites previous values)
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
						+ "<button class='btn btn-success' type ='submit' style='width: 60px; height: 60px; margin-left: 20px;'><i class='fa fa-cart-plus'></i></button>"
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

				//This is the same as the string above the only difference being that this is for a category query.
			}
			
			return items; //returns the item string
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		catch (ClassNotFoundException e){ e.printStackTrace(); } //catches exceptions
	}
		return "Error";//if searches did not work returns error text
}
}
