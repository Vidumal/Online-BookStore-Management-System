package com.example.online_book_store.service;

import com.example.online_book_store.model.Ticket;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.*;
import java.nio.file.*;
import java.util.*;

@Service
public class TicketService {
    // File path where ticket data is stored
    private static final String FILE_PATH = "data/ticket.txt";

    // Inner class to represent a node in the linked list
    private static class Node {
        Ticket data;
        Node next;

        Node(Ticket data) {
            this.data = data;
        }
    }

    // Head of the linked list containing all tickets
    private Node head;

    // Initializes the service by loading ticket data from file after bean creation
    @PostConstruct
    public void init() throws IOException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        // Read each line from the ticket file and parse it into Ticket objects
        List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));
        for (String line : lines) {
            String[] p = line.split(",");

            // Validate line format before creating Ticket object
            if (p.length >= 5) {
                Ticket t = new Ticket(
                        p[0].trim(),
                        p[1].trim(),
                        p[2].trim(),
                        p[3].trim(),
                        p[4].trim()
                );
                append(t);
            } else {
                // Log invalid lines for debugging purposes
                System.err.println("Skipping invalid line: " + line);
            }
        }
    }

    // Generates the next available numeric ID for a new ticket
    public synchronized String getNextId() {
        int nextId = 1;
        Node curr = head;

        // Traverse the linked list to find the highest existing ID
        while (curr != null) {
            int currentId = Integer.parseInt(curr.data.getId());
            nextId = Math.max(nextId, currentId + 1);
            curr = curr.next;
        }

        return String.valueOf(nextId);
    }

    // Adds a new ticket with a unique ID and persists it to the file
    public synchronized void addTicket(Ticket t) throws IOException {
        String nextId = getNextId();
        t.setId(nextId);
        append(t);

        // Ensure the data directory exists before writing
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        // Append the new ticket data to the file
        try (BufferedWriter w = new BufferedWriter(new FileWriter(file, true))) {
            w.write(csv(t));
            w.newLine();
        }
    }

    // Retrieves all tickets from the in-memory linked list
    public synchronized List<Ticket> getAll() {
        List<Ticket> list = new ArrayList<>();
        Node curr = head;
        while (curr != null) {
            list.add(curr.data);
            curr = curr.next;
        }
        return list;
    }

    // Retrieves a specific ticket by its ID
    public synchronized Ticket getById(String id) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(id)) return curr.data;
            curr = curr.next;
        }
        return null; // Return null if not found
    }

    // Updates the fields of an existing ticket and overwrites the file
    public synchronized void updateTicket(Ticket t) throws IOException {
        Node curr = head;
        while (curr != null && !curr.data.getId().equals(t.getId())) {
            curr = curr.next;
        }
        if (curr == null) return; // No matching ticket found

        // Update ticket fields
        curr.data.setUserEmail(t.getUserEmail());
        curr.data.setSubject(t.getSubject());
        curr.data.setMessage(t.getMessage());
        curr.data.setStatus(t.getStatus());

        // Persist changes to file
        overwrite();
    }

    // Deletes a ticket by ID and persists the updated list to file
    public synchronized boolean deleteById(String id) throws IOException {
        if (head == null) return false;

        if (head.data.getId().equals(id)) {
            // Deleting the head node
            head = head.next;
        } else {
            Node prev = head, curr = head.next;
            while (curr != null && !curr.data.getId().equals(id)) {
                prev = curr;
                curr = curr.next;
            }
            if (curr == null) return false; // Ticket not found
            prev.next = curr.next; // Remove node from list
        }

        // Persist updated list to file
        overwrite();
        return true;
    }

    // ======================== Helper Methods ========================

    // Adds a ticket node to the end of the linked list
    private void append(Ticket t) {
        Node node = new Node(t);
        if (head == null) head = node;
        else {
            Node curr = head;
            while (curr.next != null) curr = curr.next;
            curr.next = node;
        }
    }

    // Overwrites the ticket file with the current in-memory list
    private void overwrite() throws IOException {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        // Write all tickets back to the file
        try (BufferedWriter w = new BufferedWriter(new FileWriter(file, false))) {
            for (Ticket t : getAll()) {
                w.write(csv(t));
                w.newLine();
            }
        }
    }

    // Converts a ticket object into a CSV-formatted string
    private String csv(Ticket t) {
        return String.join(",",
                t.getId(),
                t.getUserEmail(),
                t.getSubject().replace(",", " "),  // Replace commas to avoid CSV issues
                t.getMessage().replace(",", " "),
                t.getStatus()
        );
    }
}
