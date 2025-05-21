package com.example.Online_Book_Store.service;
import com.example.Online_Book_Store.model.Ticket;


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

}
