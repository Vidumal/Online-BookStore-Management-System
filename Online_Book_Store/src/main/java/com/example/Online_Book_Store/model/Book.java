public class Book {
    private String id;
    private String name;
    private String author;
    private int quantity;
    private double price;
    private String category;
    private String imagePath; // Path like "data/images/book1.jpg"

    public Book() {
    }

    public Book(String id, String name, String author,
                int quantity, double price, String category, String imagePath) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.quantity = quantity;
        this.price = price;
        this.category = category;
        this.imagePath = imagePath;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }
}