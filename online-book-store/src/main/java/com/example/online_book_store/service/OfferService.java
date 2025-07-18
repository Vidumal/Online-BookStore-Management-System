package com.example.online_book_store.service;

import com.example.online_book_store.model.Offer;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service
public class OfferService {

    // Head node of the custom linked list holding offers
    private Node head;
    Offer offer = new Offer();
    // Auto-increment ID tracker for assigning new offer IDs
    private int nextId = 1;

    // Flag to ensure offers are only loaded from file once
    private boolean offersLoaded = false;

    /**
     * Inner class representing a node in a singly linked list.
     * Each node holds an Offer object and a reference to the next node.
     */
    private class Node {
        Offer offer;
        Node next;

        public Node(Offer offer) {
            this.offer = offer;
            this.next = null;
        }
    }

    /**
     * Load offers from the "data/offers.txt" file.
     * This method will only load once per service lifecycle.
     */
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

    /**
     * Check if an offer already exists by comparing ID or description.
     */
    private boolean offerExists(Offer offer) {
        Node current = head;
        while (current != null) {
            if (current.offer.getId() == offer.getId() ||
                    current.offer.getDescription().equals(offer.getDescription())) {
                return true;
            }
            current = current.next;
        }
        return false;
    }

    /**
     * Persist all offers from the linked list to the file "data/offers.txt".
     */
    public void saveOffers() throws IOException {
        File file = new File("data/offers.txt");
        file.getParentFile().mkdirs(); // Ensure parent directories exist

        BufferedWriter writer = new BufferedWriter(new FileWriter(file));
        Node current = head;

        if (current == null) {
            System.out.println("saveOffers: No offers to save.");
        } else {
            System.out.println("saveOffers: Saving offers to file...");
        }

        // Write each offer as a CSV line
        while (current != null) {
            Offer offer = current.offer;
            writer.write(offer.getId() + "," + offer.getDescription() + "," +
                    offer.getSave() + "," + offer.getCategory() + "," + offer.getImagePath());
            writer.newLine();
            current = current.next;
        }

        writer.close();
        System.out.println("saveOffers: Offers saved successfully.");
    }

    /**
     * Insert offer into linked list without saving to file (used during initial load).
     */
    private void addOfferFromFile(Offer offer) {
        Node newNode = new Node(offer);
        if (head == null) {
            head = newNode;
        } else {
            Node current = head;
            while (current.next != null) current = current.next;
            current.next = newNode;
        }
    }

    /**
     * Retrieve all offers from the linked list as a list of Offer objects.
     */
    public List<Offer> getAllOffers() {
        List<Offer> offersList = new ArrayList<>();
        Node current = head;
        while (current != null) {
            offersList.add(current.offer);
            current = current.next;
        }
        return offersList;
    }

    /**
     * Update an existing offer by ID. Save changes to the file.
     */
    public void updateOffer(Offer offer) throws IOException {
        Node current = head;
        boolean found = false;

        while (current != null) {
            if (current.offer.getId() == offer.getId()) {
                // Update existing offer fields
                current.offer.setDescription(offer.getDescription());
                current.offer.setSave(offer.getSave());
                current.offer.setCategory(offer.getCategory());
                current.offer.setImagePath(offer.getImagePath());
                found = true;
                break;
            }
            current = current.next;
        }

        if (found) {
            saveOffers();
            System.out.println("Offer with ID " + offer.getId() + " updated and saved.");
        } else {
            System.out.println("Offer with ID " + offer.getId() + " not found.");
        }
    }

    /**
     * Delete an offer from the list by ID and save the updated list to file.
     */
    public void deleteOffer(int id) throws IOException {
        if (head == null) return;

        // If head needs to be removed
        if (head.offer.getId() == id) {
            head = head.next;
        } else {
            Node current = head;
            while (current.next != null) {
                if (current.next.offer.getId() == id) {
                    current.next = current.next.next;
                    break;
                }
                current = current.next;
            }
        }

        saveOffers();
        System.out.println("deleteOffer: Offer deleted and saved.");
    }

    /**
     * Sorts the offers in descending order based on the 'save' value using QuickSort.
     */
    public void sortOffers() {
        List<Offer> offerList = getAllOffers();
        quickSort(offerList, 0, offerList.size() - 1);
        rebuildLinkedList(offerList); // Rebuild the linked list from sorted list
    }

    /**
     * Helper method to implement QuickSort on a list of Offer objects.
     */
    private void quickSort(List<Offer> offers, int low, int high) {
        if (low < high) {
            int pi = partition(offers, low, high); // Partition index
            quickSort(offers, low, pi - 1);        // Sort left half
            quickSort(offers, pi + 1, high);       // Sort right half
        }
    }

    /**
     * Partition method for QuickSort: rearranges elements around pivot.
     */
    private int partition(List<Offer> offers, int low, int high) {
        float pivot = offers.get(high).getSave(); // Last element as pivot
        int i = low - 1;

        for (int j = low; j < high; j++) {
            if (offers.get(j).getSave() >= pivot) {
                i++;
                Collections.swap(offers, i, j);
            }
        }

        Collections.swap(offers, i + 1, high);
        return i + 1;
    }

    /**
     * Reconstructs the linked list from a sorted list of Offer objects.
     */
    private void rebuildLinkedList(List<Offer> sortedOffers) {
        head = null;

        for (Offer offer : sortedOffers) {
            Node newNode = new Node(offer);
            if (head == null) {
                head = newNode;
            } else {
                Node current = head;
                while (current.next != null) current = current.next;
                current.next = newNode;
            }
        }
    }

    /**
     * Getter for the next auto-increment ID.
     */
    public int getNextId() {
        return nextId;
    }
}
