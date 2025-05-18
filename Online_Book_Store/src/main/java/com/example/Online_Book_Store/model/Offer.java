package com.example.Online_Book_Store.model;

public class Offer {
    private Integer id;
    private String description;
    private float save;
    private String category;
    private String imagePath;

    public Offer(){
    }

    public Offer(Integer id, String description, float save, String category, String imagePath) {
        this.id = id;
        this.description = description;
        this.save = save;
        this.category = category;
        this.imagePath = imagePath;
    }
}
