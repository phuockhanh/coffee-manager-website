package com.casestudy.model;

public class Product {
    private int id;
    private int idPdSmall;
    private String name;
    private double price;
    private double priceKg;
    private String url,title,content;
    public Product(){

    }

    public Product(int id, int idPdSmall, String name, double price, double priceKg, String url) {
        this.id = id;
        this.idPdSmall = idPdSmall;
        this.name = name;
        this.price = price;
        this.priceKg = priceKg;
        this.url = url;
    }

    public Product(int id, int idPdSmall, String name, double price, double priceKg, String url, String title, String content) {
        this.id = id;
        this.idPdSmall = idPdSmall;
        this.name = name;
        this.price = price;
        this.priceKg = priceKg;
        this.url = url;
        this.title = title;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPdSmall() {
        return idPdSmall;
    }

    public void setIdPdSmall(int idPdSmall) {
        this.idPdSmall = idPdSmall;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getPriceKg() {
        return priceKg;
    }

    public void setPriceKg(double priceKg) {
        this.priceKg = priceKg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", idPdSmall=" + idPdSmall +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", priceKg=" + priceKg +
                ", url='" + url + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
