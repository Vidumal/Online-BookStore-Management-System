package com.example.Online_Book_Store.service;

import com.example.Online_Book_Store.model.Payment;
import org.springframework.stereotype.Service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

@Service
public class PaymentService {

    // Path to the text file where payment records will be saved
    private static final String PAYMENT_FILE = "data/payment.txt";

    /**
     * Saves a payment record to the text file.
     * Each payment will be stored with details such as payment ID, name, card number, CVV, address, and amount.
     *
     * @param payment the Payment object containing payment details to be saved
     * @return true if payment details were successfully saved, false otherwise
     */
    public boolean savePayment(Payment payment) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(PAYMENT_FILE, true))) {
            // Append payment details to the file
            writer.write("Payment ID: " + payment.getPaymentId() + "\n");
            writer.write("Name: " + payment.getName() + "\n");
            writer.write("Card Number: " + payment.getCardNumber() + "\n");
            writer.write("CVV: " + payment.getCvv() + "\n");
            writer.write("Address: " + payment.getAddress() + "\n");
            writer.write("Amount: " + payment.getAmount() + "\n");
            writer.write("------\n"); // Separator for better readability between payments
            return true; // Successfully saved
        } catch (IOException e) {
            e.printStackTrace(); // Print stack trace for debugging in case of an error
            return false; // Indicate failure to save payment
        }
    }
}
