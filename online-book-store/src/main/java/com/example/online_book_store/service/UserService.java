package com.example.online_book_store.service;

import com.example.online_book_store.model.User;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    // Path to the file where user data is stored
    private static final String FILE_PATH = "data/users.txt";
    User user = new User();

    /**
     * Adds a new user to the system.
     * Checks for duplicate email before assigning an ID and appending user data to file.
     */
    public void addUser(User user) throws IOException {
        if (isEmailDuplicate(user.getEmail())) {
            throw new IllegalArgumentException("Email already exists.");
        }

        int nextId = getNextUserId();

        // Append the new user data to the file
        BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true));
        writer.write(nextId + "," +
                user.getUsername() + "," +
                user.getPassword() + "," +
                user.getEmail() + "," +
                user.getAge() + "," +
                user.getRole() + "," +
                user.getGender());
        writer.newLine();
        writer.close();
    }

    /**
     * Checks if the provided email already exists in the user file.
     * Used to prevent duplicate user registration.
     */
    private boolean isEmailDuplicate(String email) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] userFields = line.split(",");
            if (userFields.length >= 4) {
                String existingEmail = userFields[3];
                if (existingEmail.equals(email)) {
                    reader.close();
                    return true;
                }
            }
        }
        reader.close();
        return false;
    }

    /**
     * Retrieves all users from the file and returns them as a list.
     * Parses each line into a User object.
     */
    public List<User> getAllUsers() throws IOException {
        List<User> users = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length == 7) {
                int userId = Integer.parseInt(parts[0]);
                String username = parts[1];
                String password = parts[2];
                String email = parts[3];
                int age = Integer.parseInt(parts[4]);
                String role = parts[5];
                String gender = parts[6];
                users.add(new User(userId, username, password, email, age, role, gender));
            } else {
                System.out.println("Skipping invalid user line: " + line);
            }
        }
        reader.close();
        return users;
    }

    /**
     * Updates an existing user’s data by rewriting the entire file.
     * Matches users by userId and updates the matching record.
     */
    public void updateUser(int userId, User updatedUser) throws IOException {
        List<User> users = getAllUsers();
        BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH));
        for (User user : users) {
            if (user.getUserId() == userId) {
                // Update user fields with new values
                user.setUsername(updatedUser.getUsername());
                user.setEmail(updatedUser.getEmail());
                user.setPassword(updatedUser.getPassword());
                user.setRole(updatedUser.getRole());
                user.setGender(updatedUser.getGender());
                user.setAge(updatedUser.getAge());
            }
            // Write (updated or unchanged) user data back to file
            writer.write(user.getUserId() + "," +
                    user.getUsername() + "," +
                    user.getPassword() + "," +
                    user.getEmail() + "," +
                    user.getAge() + "," +
                    user.getRole() + "," +
                    user.getGender());
            writer.newLine();
        }
        writer.close();
    }

    /**
     * Deletes a user from the system based on userId.
     * Rewrites the file excluding the specified user.
     */
    public void deleteUser(int userId) throws IOException {
        List<User> users = getAllUsers();
        BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH));
        for (User user : users) {
            if (user.getUserId() != userId) {
                writer.write(user.getUserId() + "," +
                        user.getUsername() + "," +
                        user.getPassword() + "," +
                        user.getEmail() + "," +
                        user.getAge() + "," +
                        user.getRole() + "," +
                        (user.getGender() != null ? user.getGender() : ""));
                writer.newLine();
            }
        }
        writer.close();
    }

    /**
     * Calculates the next available user ID by finding the maximum current ID.
     * Ensures unique incremental IDs for each new user.
     */
    private int getNextUserId() throws IOException {
        int maxId = 0;
        BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH));
        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length >= 1) {
                try {
                    int id = Integer.parseInt(parts[0]);
                    if (id > maxId) {
                        maxId = id;
                    }
                } catch (NumberFormatException ignored) {}
            }
        }
        reader.close();
        return maxId + 1;
    }

    /**
     * Validates login credentials by matching email and password.
     * Returns the matching User object or null if authentication fails.
     */
    public User validateLogin(String email, String password) throws IOException {
        List<User> users = getAllUsers();
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    /**
     * Checks if a username is already taken.
     * Used for validating new user registration.
     */
    public boolean isUsernameTaken(String username) throws IOException {
        List<User> users = getAllUsers();
        for (User user : users) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Checks if an email is already taken.
     * Similar to isEmailDuplicate but case-insensitive.
     */
    public boolean isEmailTaken(String email) throws IOException {
        List<User> users = getAllUsers();
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return true;
            }
        }
        return false;
    }
}
