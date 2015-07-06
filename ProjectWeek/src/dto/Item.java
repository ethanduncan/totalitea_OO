package dto;

import java.math.BigDecimal;

public class Item {

    private Long id;
	private String description;
	private BigDecimal price;
	private double itemWeight;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public double getItemWeight() {
        return itemWeight;
    }

    public void setItemWeight(double itemWeight) {
        this.itemWeight = itemWeight;
    }


}

