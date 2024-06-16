package com.exercise.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;


@RestController
public class MainController {
    
    @GetMapping("/hello")
    public String displayDefaultMessage() {
        return "Hello world!";
    }
    
}
