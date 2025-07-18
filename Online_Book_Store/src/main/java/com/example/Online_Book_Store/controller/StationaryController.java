package com.example.Online_Book_Store.controller;

import com.example.Online_Book_Store.constants.Constant;
import com.example.Online_Book_Store.model.Book;
import com.example.Online_Book_Store.model.Stationary;
import com.example.Online_Book_Store.service.StationaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.*;
import java.util.List;

@Controller
@RequestMapping("/stationary")
public class StationaryController {

    private static final String IMAGE_DIR = Constant.IMAGE_DIR;

    @Autowired
    private StationaryService stationaryService;

    @GetMapping("/add")
    public String showAddForm(Model model) throws IOException {
        Stationary stationary = new Stationary();
        stationary.setId(stationaryService.getNextId());
        model.addAttribute("stationary", stationary);
        return "add-stationary";
    }

    @GetMapping("/stationaryList")
    public String showStationary(Model model) throws IOException {
        List<Stationary> stationary = stationaryService.getSortedByPrice();
        model.addAttribute("stationary", stationary);
        return "stationaryList";
    }

    @PostMapping("/add")
    public String addStationary(@ModelAttribute Stationary stationary,
                                @RequestParam("image") MultipartFile image,
                                Model model) {
        try {
            if (!image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String newFileName = stationary.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                stationary.setImagePath("/images/" + newFileName);
            }

            stationaryService.addStationary(stationary);
            return "redirect:/stationary/admin";
        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image");
            return "add-stationary";
        }
    }

    @GetMapping("/admin")
    public String listStationary(Model model) {
        List<Stationary> stationary = stationaryService.getSortedByPrice();
        model.addAttribute("stationary", stationary);
        return "admin-stationary";
    }

    @PostMapping("/delete/{id}")
    public String deleteStationary(@PathVariable String id) throws IOException {
        stationaryService.deleteById(id);
        return "redirect:/stationary/admin";
    }

    @GetMapping("/update/{id}")
    public String showUpdateForm(@PathVariable String id, Model model) {
        Stationary stationary = stationaryService.getById(id);
        model.addAttribute("stationary", stationary);
        return "update-stationary";
    }

    @PostMapping("/update")
    public String updateStationary(@ModelAttribute Stationary stationary,
                                   @RequestParam("image") MultipartFile image,
                                   Model model) {
        try {
            String imagePath = stationary.getImagePath();

            if (image != null && !image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                String newFileName = stationary.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                imagePath = "/images/" + newFileName;
            }

            stationary.setImagePath(imagePath);
            stationaryService.updateStationary(stationary);

            return "redirect:/stationary/admin";

        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image: " + e.getMessage());
            return "update-stationary";
        }
    }

    @PostMapping("/buy")
    @ResponseBody
    public String buyBook(@RequestBody StationaryController.PurchaseRequest purchase) throws IOException {
        Stationary stationary = stationaryService.getById(purchase.getId());
        if (stationary != null && stationary.getQuantity() >= purchase.getQuantity()) {
            stationary.setQuantity(stationary.getQuantity() - purchase.getQuantity());
            stationaryService.updateStationary(stationary);
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
