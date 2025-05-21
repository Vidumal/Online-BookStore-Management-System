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


}
