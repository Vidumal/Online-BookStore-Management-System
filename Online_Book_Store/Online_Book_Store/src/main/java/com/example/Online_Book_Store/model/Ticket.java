package com.example.Online_Book_Store.model;

public class Ticket {
    private String id;
    private String userEmail;
    private String message;
    private String status; // "pending", "resolved"
    private String subject;

    public Ticket() {}

    public Ticket(String id, String userEmail, String subject, String message, String status) {
        this.id = id;
        this.userEmail = userEmail;
        this.subject = subject;
        this.message = message;
        this.status = status;
}
