package com.example.Online_Book_Store.model;


public class User {
    private int userId;
    private String username;
    private String password;
    private String email;
    private int age;
    private String role;
    private String gender;

    public User() {}

    public User(String username, String password, String email, int age, String role, String gender) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.age = age;
        this.role = role;
        this.gender = gender;
    }

    public User(int userId, String username, String password, String email, int age, String role, String gender) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.age = age;
        this.role = role;
        this.gender = gender;
    }

    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }


    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
}
