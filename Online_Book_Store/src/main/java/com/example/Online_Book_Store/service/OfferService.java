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


    }
}
