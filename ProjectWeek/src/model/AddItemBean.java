package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import service.DatabaseQueryingService;

public class AddItemBean implements Serializable {
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();

	public void adding(String category, String description, String itemWeight, String price, String quantity) {

		String iditem = "";
		
		try {
			String query = "select max(id) as highest from item;"; //selects the highest value in the id column on the item table and returns it in a column named highest
			ResultSet res1 = dqs.queryDatabase(query);
			
			if (res1.next()) {
				
				int temporary = res1.getInt("highest") + 1; //gets the highest value returned from the above query and increments it by 1 to give a unique id value
				iditem += temporary;
				
			}
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/totalitea", "root", "teatime"); // connects
																					// to
																					// local
																					// server
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into item (id, category, description, itemWeight, price, quantityInStock) values ('"
							+ iditem
							+ "', '"
							+ category
							+ "', '"
							+ description
							+ "', '"
							+ itemWeight
							+ "', '"
							+ price
							+ "', '"
							+ quantity
							+ "')"
								); //creates a new item with the given values

		} catch (SQLException exception) {
			System.out.println(exception.getMessage());
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} // catches exceptions
		
	}
}