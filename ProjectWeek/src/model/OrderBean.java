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

import service.DatabaseAlterationService;
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
	
	DatabaseQueryingService dqs = new DatabaseQueryingService();
	
	DatabaseAlterationService das = new DatabaseAlterationService();
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
		
		ResultSet res;
		dqs.openConnection("jdbc:mysql://localhost:3306/totalitea", "root", "teatime");
		try{
			
			String query = String.valueOf("select max(id)  as 'maxvalue' from `order`");
			res = dqs.queryDatabase(query);
			if(res.next()) {
				
				 //sets the orderID but getting the maxvalue from the table and adding one.
				int orderIdtemp = res.getInt("maxvalue") + 1;
				orderId += orderIdtemp;
				
			}
			
			String deliveryInstructions = (String) req.getSession().getAttribute("deliveryInstructions");
		
//			int res1 = stat.executeUpdate("insert into `order` value ("+orderId+", '"+ getCustomerID(req) +"', '"+getShippingCost(req)+"', "
//					+ "'"+ deliveryInstructions +"')");
			
			return "Order placed successfully";
			
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
		
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
		das.openConnection("jdbc:mysql://localhost:3306/totalitea", "root", "teatime");
		dqs.openConnection("jdbc:mysql://localhost:3306/totalitea", "root", "teatime");
		try{

			int quantity;
						
			for(Item item : basket.itemList){
				
				long itemID = item.getId();
				ResultSet res1 = dqs.queryDatabase("select quantityInStock from `item` where id="+itemID);
				if(res1.next()){
					quantity = res1.getInt("quantityInStock") - 1;
					
					das.updateDatabase("item", "quantityInStock", quantity, "id", item.getId().toString());
				}
			}
		}
		catch (SQLException exception){ System.out.println(exception.getMessage());}
	}
}
