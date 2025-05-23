package com.example.Online_Book_Store.service;

import com.example.Online_Book_Store.model.Book;
import com.example.Online_Book_Store.model.Stationary;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.*;
import java.nio.file.*;
import java.util.*;

@Service  // Marks this class as a Spring service component for business logic handling
public class StationaryService {

    private static final String FILE_PATH = "data/stationary.txt";  // Path to the file storing stationary item data

    // Linked list node to store Stationary data
    private static class Node {
        Stationary data;
        Node next;

        Node(Stationary data) {
            this.data = data;
        }
    }

    private Node head;  // Head of the linked list

    @PostConstruct
    public void init() throws IOException {
        // Load stationary data from file into the linked list during service initialization
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));  // Read file line by line

        for (String line : lines) {
            String[] p = line.split(",");  // Split CSV line into fields
            Stationary s = new Stationary(
                    p[0].trim(),                      // ID
                    p[1].trim(),                      // Item name
                    Integer.parseInt(p[2].trim()),    // Quantity
                    Double.parseDouble(p[3].trim()),  // Price
                    p[4].trim()                       // Image path
            );
            append(s);  // Append item to the linked list
        }
    }

    // Generate next unique ID for a new stationary item
    public synchronized String getNextId() {
        if (head == null) return "1";

        Node curr = head;
        while (curr.next != null) curr = curr.next;  // Traverse to the last node
        return String.valueOf(Integer.parseInt(curr.data.getId()) + 1);  // Increment last ID
    }

    // Add a new stationary item to the list and persist it to the file
    public synchronized void addStationary(Stationary s) throws IOException {
        append(s);  // Add to linked list

        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();  // Ensure the directory structure exists

        try (BufferedWriter w = new BufferedWriter(new FileWriter(file, true))) {
            w.write(csv(s));  // Write item as CSV
            w.newLine();
        }
    }

    // Retrieve all stationary items sorted by price (ascending)
    public synchronized List<Stationary> getSortedByPrice() {
        List<Stationary> stationary = getAll();  // Load all items
        quickSortByPrice(stationary, 0, stationary.size() - 1);  // Sort using quick sort
        return stationary;
    }

    // Read all stationary items from file and return as a list
    public synchronized List<Stationary> getAll() {
        List<Stationary> list = new ArrayList<>();
        try {
            List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));

            for (String line : lines) {
                String[] p = line.split(",");
                Stationary s = new Stationary(
                        p[0].trim(),
                        p[1].trim(),
                        Integer.parseInt(p[2].trim()),
                        Double.parseDouble(p[3].trim()),
                        p[4].trim()
                );
                list.add(s);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Retrieve a stationary item by its ID
    public synchronized Stationary getById(String id) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(id)) return curr.data;  // Found match
            curr = curr.next;
        }
        return null;  // Not found
    }

    // Update an existing stationary item and overwrite the file with new list
    public synchronized void updateStationary(Stationary s) throws IOException {
        Node curr = head;

        // Find the node with the same ID
        while (curr != null && !curr.data.getId().equals(s.getId())) {
            curr = curr.next;
        }

        if (curr == null) return;  // Item not found

        // Update fields
        curr.data.setItemName(s.getItemName());
        curr.data.setQuantity(s.getQuantity());
        curr.data.setPrice(s.getPrice());
        curr.data.setImagePath(s.getImagePath());

        overwrite();  // Save entire list to file
    }

    // Delete a stationary item by its ID and update the file
    public synchronized boolean deleteById(String id) throws IOException {
        if (head == null) return false;

        // Special case: deleting head node
        if (head.data.getId().equals(id)) {
            head = head.next;
        } else {
            Node prev = head, curr = head.next;

            // Traverse to find the node to delete
            while (curr != null && !curr.data.getId().equals(id)) {
                prev = curr;
                curr = curr.next;
            }

            if (curr == null) return false;  // Item not found
            prev.next = curr.next;  // Unlink node
        }

        overwrite();  // Save updated list to file
        return true;
    }

    // ---- Helpers ----

    // Append a stationary item to the end of the linked list
    private void append(Stationary s) {
        Node node = new Node(s);
        if (head == null) head = node;
        else {
            Node curr = head;
            while (curr.next != null) curr = curr.next;
            curr.next = node;
        }
    }

    // Overwrite the stationary file with current linked list data
    private void overwrite() throws IOException {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();  // Ensure directories exist

        try (BufferedWriter w = new BufferedWriter(new FileWriter(file, false))) {
            Node curr = head;
            while (curr != null) {
                w.write(csv(curr.data));  // Write item in CSV format
                w.newLine();
                curr = curr.next;
            }
        }
    }

    // Convert a Stationary object to a CSV string
    private String csv(Stationary s) {
        return String.join(",",
                s.getId(),
                s.getItemName(),
                String.valueOf(s.getQuantity()),
                String.valueOf(s.getPrice()),
                s.getImagePath()
        );
    }

    // Sort stationary items by price using Quick Sort algorithm
    public void quickSortByPrice(List<Stationary> items, int low, int high) {
        if (low < high) {
            int pi = partition(items, low, high);  // Partitioning index
            quickSortByPrice(items, low, pi - 1);   // Sort left partition
            quickSortByPrice(items, pi + 1, high);  // Sort right partition
        }
    }

    // Partition function for quick sort (by price)
    private int partition(List<Stationary> items, int low, int high) {
        double pivot = items.get(high).getPrice();  // Choose pivot
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (items.get(j).getPrice() <= pivot) {
                i++;
                Collections.swap(items, i, j);  // Swap elements if smaller than pivot
            }
        }

        Collections.swap(items, i + 1, high);  // Move pivot to correct location
        return i + 1;
    }
}
