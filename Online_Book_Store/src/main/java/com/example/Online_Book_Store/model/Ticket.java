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


    // Getters and setters
    public String getSubject() {

        return subject;
    }

    public void setSubject(String subject) {

        this.subject = subject;
    }



    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }



    public String getUserEmail() {
        return userEmail;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }



    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }


    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}

