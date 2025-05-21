package com.example.Online_Book_Store.service;

import com.example.Online_Book_Store.model.Offer;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service
public class OfferService {

    //LINKED LIST
    private Node head;
    Offer offer = new Offer();
    // Auto-increment ID tracker for assigning new offer IDs
    private int nextId = 1;

    // Flag to ensure offers are only loaded from file once
    private boolean offersLoaded = false;

    private class Node {
        Offer offer;
        Node next;

        public Node(Offer offer) {
            this.offer = offer;
            this.next = null;
        }
    }

    public void loadOffers() throws IOException {
        if (offersLoaded) return;

        File file = new File("data/offers.txt");

        if (!file.exists()) {
            System.out.println("No offers file found. Skipping load.");
            return;
        }
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;

        while ((line = reader.readLine()) != null) {
            String[] offerDetails = line.split(",");

            // Ensure all necessary fields are present
            if (offerDetails.length >= 5) {
                int id = Integer.parseInt(offerDetails[0]);
                String description = offerDetails[1];
                float save = Float.parseFloat(offerDetails[2]);
                String category = offerDetails[3];
                String imagePath = offerDetails[4];

                // Create and insert offer into the list
                Offer offer = new Offer(id, description, save, category, imagePath);
                addOfferFromFile(offer);

                // Ensure ID increment is always ahead of loaded offers
                nextId = Math.max(nextId, id + 1);
            }
        }

        reader.close();
        offersLoaded = true;
        System.out.println("Offers loaded successfully.");
    }

    /**
     * Add a new offer (from UI or user input) to the linked list and save to file.
     */
    public void addOffer(Offer offer) throws IOException {
        // Assign ID if not provided
        if (offer.getId() == null || offer.getId() == 0) {
            offer.setId(nextId++);
        }

        // Check for existing offer by ID or description
        if (offerExists(offer)) {
            System.out.println("Offer with ID or description already exists.");
            return;
        }
        // Create a new node and append it to the end of the list
        Node newNode = new Node(offer);
        if (head == null) {
            head = newNode;
        } else {
            Node current = head;
            while (current.next != null) current = current.next;
            current.next = newNode;
        }

        saveOffers(); // Persist updated list to file
    }
}
