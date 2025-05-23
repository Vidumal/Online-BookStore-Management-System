package com.example.Online_Book_Store.controller;

import com.example.Online_Book_Store.constants.Constant;
import com.example.Online_Book_Store.model.Offer;
import com.example.Online_Book_Store.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

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
}
