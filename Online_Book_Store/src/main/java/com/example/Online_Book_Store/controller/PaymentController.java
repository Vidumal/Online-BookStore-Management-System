package com.example.online_book_store.controller;

import com.example.online_book_store.model.Payment;
import com.example.online_book_store.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    // Handle payment form submission
    @PostMapping("/payment/submit")
    public String submitPayment(@RequestParam String name,
                                @RequestParam String cardNumber,
                                @RequestParam String cvv,
                                @RequestParam String address,
                                @RequestParam String amount,
                                Model model) {

        // Generate a unique payment ID using current timestamp
        String paymentId = "COM" + System.currentTimeMillis();

        // Create a new Payment object and set its fields
        Payment payment = new Payment();
        payment.setPaymentId(paymentId);
        payment.setName(name);
        payment.setCardNumber(cardNumber);
        payment.setCvv(cvv);
        payment.setAddress(address);
        payment.setAmount(amount);

        // Save payment using PaymentService
        boolean success = paymentService.savePayment(payment);

        // Redirect to home page if successful, otherwise reload the form with an error message
        if (success) {
            return "redirect:/";
        } else {
            model.addAttribute("message", "Failed to save payment.");
            return "payment-form";
        }
    }

    // Display the payment form with a given amount
    @GetMapping("/payment")
    public String showPaymentForm(@RequestParam("amount") String amount, Model model) {
        model.addAttribute("amount", amount); // Pass the amount to the payment form
        return "payment-form"; // Render the payment form view
    }

    @GetMapping("/offer-payment")
    public String showOfferPaymentForm() {
        return "offer-payment-form"; // Render the payment form view
    }
}
