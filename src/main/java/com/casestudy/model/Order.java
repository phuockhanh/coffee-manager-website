package com.casestudy.model;

import java.util.List;

public class Order {
    private int id;
    private User user;
    private List<Item> items;

    public Order(){

    }
    public Order(int id, User user, List<Item> items) {
        this.id = id;
        this.user = user;
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
}
