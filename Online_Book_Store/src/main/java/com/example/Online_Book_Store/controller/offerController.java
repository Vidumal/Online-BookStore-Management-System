package com.example.Online_Book_Store.controller;

import com.example.Online_Book_Store.constants.Constant;
import com.example.Online_Book_Store.model.Offer;
import com.example.Online_Book_Store.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping("/offer")
public class OfferController {

    private static final String IMAGE_DIR = Constant.IMAGE_DIR;

    @Autowired
    private OfferService offerService;

    // Display all offers
    @GetMapping("/list")
    public String listOffers(Model model) throws IOException {
        offerService.loadOffers();
        offerService.sortOffers(); // Sort offers after loading
        model.addAttribute("offers", offerService.getAllOffers());
        return "offer-list"; // JSP page to display all offers
    }
    @GetMapping
    public String Offers(Model model) throws IOException {
        offerService.loadOffers();
        offerService.sortOffers(); // Sort offers after loading
        model.addAttribute("offers", offerService.getAllOffers());
        return "offers"; // JSP page to display all offers
    }

    // Show the Add Offer form
    @GetMapping("/add")
    public String showAddOfferForm(Model model) {
        //creating objects
        Offer offer = new Offer(0, "", 0.0f, "", ""); // Add category and imagePath fields
        offer.setId(offerService.getNextId()); // Ensure the offer gets a valid ID
        model.addAttribute("offer", offer);
        return "add-offer"; // JSP page to add offer
    }
    // Add an offer
    @PostMapping("/add")
    public String addOffer(@ModelAttribute Offer offer,
                           @RequestParam("image") MultipartFile image, // Handle image upload
                           Model model) throws IOException {
        try {
            if (!image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                // Ensure the directory exists
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Create a new file name based on the offer's ID
                String newFileName = offer.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);

                // Copy the uploaded file to the server
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Set the image path that will be used in the application
                offer.setImagePath("/images/" + newFileName);
            }

            // Save the offer with the image path
            offerService.addOffer(offer);
            return "redirect:/offer/list";
        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image");
            return "add-offer"; // Return to the form in case of error
        }
    }

    // Show the Update Offer form
    @GetMapping("/update/{id}")
    public String showUpdateOfferForm(@PathVariable Integer id, Model model) throws IOException {
        offerService.loadOffers(); // Ensure offers are loaded
        Offer offer = offerService.getAllOffers().stream()
                .filter(o -> o.getId() == id)
                .findFirst()
                .orElse(null);

        if (offer == null) {
            // If offer is not found, return an error message or redirect
            System.out.println("Offer not found for ID: " + id);
            return "offer-not-found"; // You can create an error page if needed
        }

        model.addAttribute("offer", offer);
        return "update-offer"; // JSP page to update offer
    }

    // Update an offer
    @PostMapping("/update")
    public String updateOffer(@ModelAttribute Offer offer,
                              @RequestParam("image") MultipartFile image, // Handle image upload
                              Model model) throws IOException {
        try {
            String imagePath = offer.getImagePath(); // Keep existing image path

            if (image != null && !image.isEmpty()) {
                String fileName = StringUtils.cleanPath(image.getOriginalFilename());
                Path uploadPath = Paths.get(IMAGE_DIR);

                // Ensure the directory exists
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }

                // Create a new file name based on the offer's ID
                String newFileName = offer.getId() + "_" + fileName;
                Path filePath = uploadPath.resolve(newFileName);

                // Overwrite the existing image file with the new image
                Files.copy(image.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

                // Update the image path in the offer
                imagePath = "/images/" + newFileName;
            }

            offer.setImagePath(imagePath);
            offerService.updateOffer(offer);

            return "redirect:/offer/list";
        } catch (IOException e) {
            model.addAttribute("error", "Error uploading image: " + e.getMessage());
            return "update-offer"; // Return to the form in case of error
        }
    }
    
    // Delete an offer
    @PostMapping("/delete/{id}")
    public String deleteOffer(@PathVariable int id) throws IOException {
        offerService.deleteOffer(id);
        return "redirect:/offer/list";
    }
}

