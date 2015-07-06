package model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import domain.Basket;

public class BasketBean implements Serializable{
	/*
	 * 
	 * BasketBean that displays whats in the Cart and displays what the total
	 * cost is.
	 * 
	 */
	Basket basket;
	
	public String displayCart(HttpServletRequest req){
		
		HttpSession session = req.getSession(true);
		basket = (Basket) session.getAttribute("cart");
		basket.displayBasket();
		
		return basket.displayBasket();
	}
	
	public BigDecimal displayTotal(){
		
		return basket.getTotalBasketPrice();
		
	}
}
