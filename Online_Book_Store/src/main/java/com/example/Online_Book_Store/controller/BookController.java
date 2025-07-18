package com.example.online_book_store.controller;

import com.example.online_book_store.constants.Constant;
import com.example.online_book_store.model.Book;
import com.example.online_book_store.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.nio.file.*;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    private static final String IMAGE_DIR = Constant.IMAGE_DIR;

    @Autowired
    private BookService bookService;

    @GetMapping("/add")
    public String showAddForm(Model model) throws IOException {
        Book book = new Book();
        book.setId(bookService.getNextId());
        model.addAttribute("book", book);
        return "add-book";
    }

    @GetMapping("/booksList")
    public String showBooks(Model model) throws IOException {
        List<Book> books = bookService.getBooksSortedByPrice();
        model.addAttribute("books", books);
        return "bookList";
    }


    @PostMapping("/add")
    public String addBook(@ModelAttribute Book book,
                          @RequestParam("image") MultipartFile image,
                          Model model) {
        try {
            if (!image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String newFileName = book.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                book.setImagePath("/images/" + newFileName);
            }

            bookService.addBook(book);
            return "redirect:/books/admin";
        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image");
            return "add-book";
        }
    }


    @GetMapping("/admin")
    public String listBooks(Model model) {
        List<Book> books = bookService.getBooksSortedByPrice();
        model.addAttribute("books", books);
        return "admin-book-list";
    }

    @PostMapping("/delete/{id}")
    public String deleteBook(@PathVariable String id) throws IOException {
        bookService.deleteBook(id);
        return "redirect:/books/admin";
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable String id, Model model) {
        Book book = bookService.getBookById(id);
        model.addAttribute("book", book);
        return "update-book";
    }

    @PostMapping("/update")
    public String updateBook(@ModelAttribute Book book,
                             @RequestParam("image") MultipartFile image,
                             Model model) {
        try {
            // Keep the existing image path unless a new image is uploaded
            String imagePath = book.getImagePath();

            if (image != null && !image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String newFileName = book.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);

                // Overwrite existing image file
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Set the relative path used in web access
                imagePath = "/images/" + newFileName;
            }

            book.setImagePath(imagePath);
            bookService.updateBook(book);

            return "redirect:/books/admin";

        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image: " + e.getMessage());
            return "update-book";
        }
    }

    @PostMapping("/buy")
    @ResponseBody
    public String buyBook(@RequestBody PurchaseRequest purchase) throws IOException {
        Book book = bookService.getBookById(purchase.getId());
        if (book != null && book.getQuantity() >= purchase.getQuantity()) {
            book.setQuantity(book.getQuantity() - purchase.getQuantity());
            bookService.updateBook(book);
            return "OK";
        }
        return "ERROR";
    }

    // Inner class or move to a new file if needed
    public static class PurchaseRequest {
        private String id;
        private int quantity;

        // Getters and setters
        public String getId() { return id; }
        public void setId(String id) { this.id = id; }
        public int getQuantity() { return quantity; }
        public void setQuantity(int quantity) { this.quantity = quantity; }
    }


}
