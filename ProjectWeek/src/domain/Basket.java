package domain;

import dto.Item;

import java.math.BigDecimal;
import java.text.BreakIterator;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Basket {

	public List<Item> itemList = new ArrayList<Item>();

    /**
     * Calculates the  basket total price
     *
     * Sets the scale of the total price to 2 decimal places and rounds the total price to HALF_UP
     *
     * @see BigDecimal
     * @see java.math.RoundingMode
     *
     * @return a formatted total price of basket
     */
	
	public BigDecimal getTotalBasketPrice() {
		
        BigDecimal basketPrice = new BigDecimal(0);
        for (Item item : itemList) {
        	System.out.println(item.getPrice());
            basketPrice = basketPrice.add(item.getPrice());
            System.out.println(basketPrice);
        }
		 return basketPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
	}


    public List<Item> getItems() {
        return itemList;
    }

    public void setItems(List<Item> items) {
        this.itemList = items;
    }
    
    public void addItem(Item item){

    	itemList.add(item);
    	
    }
 
    
    public String displayBasket() {
    	String basketList = "";
        for (Item item : itemList) {
            basketList += "<tr><td>" + item.getId() + "</td><td>" + item.getDescription() + "</td><td>" + item.getItemWeight() + "</td><td>£" + item.getPrice() + "</td></tr>";
        } //returns a list of all the items within the basket for display in a table
		 return basketList;
	}
}
