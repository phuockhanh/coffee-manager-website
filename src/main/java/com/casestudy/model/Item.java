package com.casestudy.model;

import java.io.Serializable;

public class Item implements Serializable {
    private int id;
    private Product product;
    private int amount;
    private double price;

    public Item(){

    }
    public Item(int id, Product product, int amount, double price) {
        super();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", product=" + product +
                ", amount=" + amount +
                ", price=" + price +
                '}';
    }
}
