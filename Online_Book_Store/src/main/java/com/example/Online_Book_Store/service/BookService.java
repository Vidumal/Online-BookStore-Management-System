package com.example.online_book_store.service;

import com.example.online_book_store.model.Book;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.*;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BookService {

    // File path to persist book data
    private static final String FILE_PATH = "data/books.txt";

    // Inner class representing a node in a singly linked list
    private static class Node {
        Book data;
        Node next;

        Node(Book data) {
            this.data = data;
        }
    }

    // Head node of the in-memory linked list
    private Node head;

    /**
     * Called after bean construction to initialize the in-memory list from file.
     * Reads all books from the file and appends them to the list.
     */
    @PostConstruct
    public void init() throws IOException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return;

        List<String> lines = Files.readAllLines(Paths.get(FILE_PATH));
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length < 7) continue; // Skip invalid lines

            // Create a Book object from file data
            Book b = new Book(
                    parts[0].trim(),
                    parts[1].trim(),
                    parts[2].trim(),
                    Integer.parseInt(parts[3].trim()),
                    Double.parseDouble(parts[4].trim()),
                    parts[5].trim(),
                    parts[6].trim()
            );
            appendToList(b);
        }
    }

    /**
     * Returns the next available book ID as a string.
     * It finds the highest current ID and increments it.
     */
    public synchronized String getNextId() {
        if (head == null) {
            return "1";
        }
        Node curr = head;
        while (curr.next != null) {
            curr = curr.next;
        }
        int next = Integer.parseInt(curr.data.getId()) + 1;
        return String.valueOf(next);
    }

    /**
     * Adds a new book to the in-memory list and persists it to the file.
     */
    public synchronized void addBook(Book book) throws IOException {
        appendToList(book);

        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs(); // Ensure directory exists

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, true))) {
            writer.write(formatAsCsv(book));
            writer.newLine();
        }
    }

    /**
     * Retrieves a book by its ID from the in-memory list.
     */
    public synchronized Book getBookById(String id) {
        Node curr = head;
        while (curr != null) {
            if (curr.data.getId().equals(id)) {
                return curr.data;
            }
            curr = curr.next;
        }
        return null;
    }

    /**
     * Updates an existing book's information and rewrites the entire file.
     */
    public synchronized void updateBook(Book updated) throws IOException {
        Node curr = head;
        while (curr != null && !curr.data.getId().equals(updated.getId())) {
            curr = curr.next;
        }

        if (curr == null) {
            throw new IllegalArgumentException("No book found with ID: " + updated.getId());
        }

        // Update the book's fields
        curr.data.setName(updated.getName());
        curr.data.setAuthor(updated.getAuthor());
        curr.data.setQuantity(updated.getQuantity());
        curr.data.setPrice(updated.getPrice());
        curr.data.setCategory(updated.getCategory());
        curr.data.setImagePath(updated.getImagePath());

        // Overwrite the file with updated data
        overwriteFile();
    }

    /**
     * Deletes a book by its ID and rewrites the file without that book.
     */
    public synchronized boolean deleteBook(String id) throws IOException {
        if (head == null) return false;

        // Handle deletion if the book is at the head
        if (head.data.getId().equals(id)) {
            head = head.next;
        } else {
            Node prev = head, curr = head.next;
            while (curr != null && !curr.data.getId().equals(id)) {
                prev = curr;
                curr = curr.next;
            }
            if (curr == null) return false;

            // Remove the node from the list
            prev.next = curr.next;
        }

        overwriteFile();
        return true;
    }

    /**
     * Returns all books in the system as a list.
     */
    public synchronized List<Book> getAllBooks() {
        List<Book> list = new ArrayList<>();
        Node curr = head;
        while (curr != null) {
            list.add(curr.data);
            curr = curr.next;
        }
        return list;
    }

    /**
     * Appends a book to the end of the linked list.
     */
    private void appendToList(Book book) {
        Node newNode = new Node(book);
        if (head == null) {
            head = newNode;
        } else {
            Node curr = head;
            while (curr.next != null) {
                curr = curr.next;
            }
            curr.next = newNode;
        }
    }

    /**
     * Rewrites the entire book list to the file for consistency.
     */
    private void overwriteFile() throws IOException {
        File file = new File(FILE_PATH);
        file.getParentFile().mkdirs();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file, false))) {
            for (Book b : getAllBooks()) {
                writer.write(formatAsCsv(b));
                writer.newLine();
            }
        }
    }

    /**
     * Converts a Book object into a CSV-formatted string.
     */
    private String formatAsCsv(Book book) {
        return String.join(",",
                book.getId(),
                book.getName(),
                book.getAuthor(),
                String.valueOf(book.getQuantity()),
                String.valueOf(book.getPrice()),
                book.getCategory(),
                book.getImagePath()
        );
    }

    /**
     * Returns a list of all books sorted by their price in ascending order.
     */
    public synchronized List<Book> getBooksSortedByPrice() {
        List<Book> books = getAllBooks();
        quickSortBooksByPrice(books, 0, books.size() - 1);
        return books;
    }

    /**
     * Quick sort implementation to sort books by price.
     */
    public void quickSortBooksByPrice(List<Book> books, int low, int high) {
        if (low < high) {
            int pi = partition(books, low, high);
            quickSortBooksByPrice(books, low, pi - 1);
            quickSortBooksByPrice(books, pi + 1, high);
        }
    }

    /**
     * Partition method used by quick sort to place pivot at correct position.
     */
    private int partition(List<Book> books, int low, int high) {
        double pivot = books.get(high).getPrice();
        int i = low - 1;
        for (int j = low; j < high; j++) {
            if (books.get(j).getPrice() <= pivot) {
                i++;
                Collections.swap(books, i, j);
            }
        }
        Collections.swap(books, i + 1, high);
        return i + 1;
    }
}
