package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@Tag(name = "Hello API", description = "API de ejemplo para el laboratorio")
public class HelloController {

    @Operation(summary = "Mensaje de saludo", description = "Retorna un mensaje de saludo simple")
    @GetMapping("/hello")
    public String hello() {
        return "Hola desde Spring Boot!";
    }
}
