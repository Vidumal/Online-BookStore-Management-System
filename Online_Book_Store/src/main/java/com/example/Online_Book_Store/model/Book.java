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
}