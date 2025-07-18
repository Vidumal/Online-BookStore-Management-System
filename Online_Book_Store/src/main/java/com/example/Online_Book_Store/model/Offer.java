package com.example.online_book_store.model;

public class Offer {
    private Integer id;
    private String description;
    private float save;
    private String category;     // NEW
    private String imagePath;    // NEW

    public Offer(){};

    public Offer(Integer id, String description, float save, String category, String imagePath) {
        this.id = id;
        this.description = description;
        this.save = save;
        this.category = category;
        this.imagePath = imagePath;
    }


    // Getters and Setters
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public float getSave() { return save; }
    public void setSave(float save) { this.save = save; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    @Override
    public String toString() {
        return "ID: " + id + ", Description: " + description + ", Save: " + save +
                ", Category: " + category + ", ImagePath: " + imagePath;
    }
}
