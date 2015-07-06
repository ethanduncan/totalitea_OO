package service;

import java.math.BigDecimal;

import domain.Basket;
import dto.Customer;
import dto.Item;

public class OrderService {

    /**
     * Calculates the post price
     *
     *
     * Calculates the postage price of the order based upon total Item weight, total Item price and gold member status of
     * the customer creating the order
     *
     * @see BigDecimal
     * @param basket the Basket containing the order items
     * @param customer    Customer customer who has made the order
     * @return   BigDecimal postageCost returns the overall postage cost of the basket.
     * 
     */

    public BigDecimal calculatePostagePriceOfOrder(Basket basket, Customer customer) {

        BigDecimal postageCost = new BigDecimal(0.00);

        double totalWeightOfItems = calculateTotalWeightOfItemsInBasket(basket);
        System.out.println("Weight = " + totalWeightOfItems);
        BigDecimal totalPriceOfItemsInBasket = basket.getTotalBasketPrice();


		if (totalWeightOfItems < 0) {
			throw new ArithmeticException();
		}

		if (totalWeightOfItems < 5) {
			postageCost = new BigDecimal(1.00);
		} else if (totalWeightOfItems >= 5 && totalWeightOfItems <= 10) {
			postageCost = new BigDecimal(10.00);
		} else if (totalWeightOfItems > 10) {
			postageCost = new BigDecimal(15.00);
		}

		if (totalPriceOfItemsInBasket.doubleValue() > 100) {
			postageCost = new BigDecimal(0.00);
		}

		if (customer.isGoldMember() == true) {
			postageCost = new BigDecimal(0.00);
		}
		
		
		return postageCost;
	}

    private double calculateTotalWeightOfItemsInBasket(Basket basket) {
    		double totalWeight = 0;
    		for (Item item : basket.getItems()) {
    			totalWeight = totalWeight + item.getItemWeight();
    		}
    		return totalWeight;
    	}
}

