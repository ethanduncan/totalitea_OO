package model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;

import service.DatabaseConnectorService;
import service.DatabaseQueryingService;
import service.OrderService;
import domain.Basket;
import dto.Customer;
import dto.Item;

public class OrderBean implements Serializable{
	/*
	 * 
	 * This is the OrderBean. It is used to create orders and add them to the database.
	 * It also prints the order and shipping costs to a string and prints it to a file.
	 * 
	 */
	String orderId = "";
	
	//
	// This method prints the order to a string.
	//
	public String orderToString(HttpServletRequest req){
		
		String order = "";
		
		Customer customer = (Customer)req.getSession().getAttribute("customer");
		
		Basket basket = (Basket)req.getSession().getAttribute("cart");
		
		
		if (orderId != null) {
			order = basket.displayBasket() 
				+ "<h1> Order for: " + customer.toString() + "</br>" + "</h1>";
		} else {
			 order = " ";
		}
		
		
		return order;
	}
	//
	// This method adds the order to the order table in the database.
	//
	public String addOrderToDatabase(HttpServletRequest req){

		try{
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
															"root", "teatime");
			Statement stat = con.createStatement();
			ResultSet res1 = stat.executeQuery("select max(id)  as 'maxvalue' from `order`");
			if(res1.next()) {
				
				 //sets the orderID but getting the maxvalue from the table and adding one.
				int orderIdtemp = res1.getInt("maxvalue") + 1;
				orderId += orderIdtemp;
				
			}
			
			String deliveryInstructions = (String) req.getSession().getAttribute("deliveryInstructions");
		
			int res = stat.executeUpdate("insert into `order` value ("+orderId+", '"+ getCustomerID(req) +"', '"+getShippingCost(req)+"', "
					+ "'"+ deliveryInstructions +"')");
			
			return "Order placed successfully";
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		catch (ClassNotFoundException e){ e.printStackTrace(); }
		
		return "Error";
	}
	//
	// Gets the customer ID and returns it as a string.
	//
	public String getCustomerID(HttpServletRequest req){
		
		Customer customer = (Customer)req.getSession().getAttribute("customer");
		
		return customer.getId().toString();
			
	}
	//
	// Gets the shipping cost and returns as a big decimal.
	//
	public BigDecimal getShippingCost(HttpServletRequest req){
		
		OrderService shipping = new OrderService();
		Basket basket = (Basket) req.getSession().getAttribute("cart");
		Customer customer = (Customer) req.getSession().getAttribute("customer");
		
		return shipping.calculatePostagePriceOfOrder(basket,customer);
		
	}
	//
	// This method writes the order to a .txt file.
	//
	public void writeOrder(){
		
		String query;
		
		DatabaseQueryingService dqs = new DatabaseQueryingService();
		ResultSet res;
		
		dqs.openConnection("jdbc:mysql://localhost:3306/totalitea", "root", "teatime");
		
		try {
			
			query = String.valueOf("select * from `order` where id = '" + orderId + "';");
			
			res = dqs.queryDatabase(query);
			
			String text = "";
			if(res.next()) {
				
				text += "Order ID : " + res.getString("id") 
						+ " Customer ID : " + res.getString("customerId") 
						+ " Shipping cost : " + res.getString("shippingCost") 
						+ " Delivery Instructions : " + res.getString("specialDeliveryInstructions") + "\n";
				
			}
			PrintWriter out;
			try {
				out = new PrintWriter(new BufferedWriter(new FileWriter("C:/lib/OrderDetails.txt", true)));
				out.println(text);
				out.close();		res.close();
			} catch (IOException e) {System.out.println(e.getMessage());}
		} catch (SQLException e){ System.out.println(e.getMessage());}
		
		dqs.closeConnection();		
		
	}
	//
	// Decrements the stock in the database by finding the current quantity and 
	//
	public void decrementStock(HttpServletRequest req){
		
		Basket basket = (Basket) req.getSession().getAttribute("cart");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/totalitea",
															"root", "teatime");
			Statement stat = con.createStatement();
			int quantity;
			
			
			for(Item item : basket.itemList){
				
				long itemID = item.getId();
				ResultSet res = stat.executeQuery("select quantityInStock from `item` where id="+itemID);
				if(res.next()){
					quantity = res.getInt("quantityInStock") - 1;
					stat.executeUpdate("UPDATE `item` SET quantityInStock="+quantity+" WHERE id="+item.getId().toString());
				}
			}
		}
		catch(ClassNotFoundException e){ e.printStackTrace(); }
		catch (SQLException exception){ System.out.println(exception.getMessage());}
	}
}
