package com.example.Online_Book_Store.controller;

import com.example.Online_Book_Store.model.Ticket;
import com.example.Online_Book_Store.service.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/ticket")
public class TicketController {

    @Autowired
    private TicketService svc;

    @GetMapping("/add")
    public String showAdd(Model m) throws IOException {
        Ticket t = new Ticket();
        t.setId(svc.getNextId());
        t.setStatus("pending");
        m.addAttribute("ticket", t);
        return "add-ticket";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute Ticket t, Model m) throws IOException {
        svc.addTicket(t);
        m.addAttribute("successMessage", "Support ticket submitted!");
        Ticket fresh = new Ticket();
        fresh.setId(svc.getNextId());
        fresh.setStatus("pending");
        m.addAttribute("ticket", fresh);
        return "add-ticket";
    }

    @GetMapping("/admin")
    public String list(Model m) {
        m.addAttribute("tickets", svc.getAll());
        return "admin-ticket";
    }

    @GetMapping("/update/{id}")
    public String showUpdate(@PathVariable String id, Model m) {
        m.addAttribute("ticket", svc.getById(id));
        return "update-ticket";
    }

    // Changed from @PostMapping to @PutMapping and added @PathVariable for ID
    @PutMapping("/update/{id}")
    public String update(@PathVariable String id, @ModelAttribute Ticket t) throws IOException {
        // Ensure that the ticket ID in the path variable is the same as the ticket object ID
        t.setId(id);  // Set the ID to ensure we're updating the correct ticket
        svc.updateTicket(t);
        return "redirect:/ticket/admin";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable String id) throws IOException {
        svc.deleteById(id);
        return "redirect:/ticket/admin";
    }
}
