package com.example.Online_Book_Store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home"; // maps to WEB-INF/views/home.jsp
    }

    @GetMapping("/login")
    public String login() {
        return "login"; // refers to login.jsp
    }

    @GetMapping("/register")
    public String register() {
        return "register"; // refers to register.jsp
    }

    @GetMapping("/admin")
    public String showAdminPage() {
        return "admin"; // Make sure you have admin.jsp in /WEB-INF/views/
    }
}


