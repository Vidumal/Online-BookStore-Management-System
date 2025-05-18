package com.example.Online_Book_Store.model;

public class Stationary {
    private String id;
    private String itemName;
    private int quantity;
    private double price;
    private String imagePath;

    public Stationary() {}

    public Stationary(String id, String itemName, int quantity, double price, String imagePath) {
        this.id = id;
        this.itemName = itemName;
        this.quantity = quantity;
        this.price = price;
        this.imagePath = imagePath;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}

