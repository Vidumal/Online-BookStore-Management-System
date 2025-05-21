package com.example.Online_Book_Store.controller;

import com.example.Online_Book_Store.constants.Constant;
import com.example.Online_Book_Store.model.Book;
import com.example.Online_Book_Store.service.BookService;
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
}
