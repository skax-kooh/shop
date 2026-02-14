package com.shop.controller;

import com.shop.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ProductController {

    @GetMapping("/products")
    public String listProducts(Model model) {
        // Mock data
        List<Product> products = new ArrayList<>();
        products.add(new Product(1L, "MacBook Pro", new BigDecimal("2500000"), "Apple M2 Chip, 16GB RAM"));
        products.add(new Product(2L, "Galaxy S24", new BigDecimal("1200000"), "AI Phone, 512GB"));
        products.add(new Product(3L, "Keyboard", new BigDecimal("150000"), "Mechanical Keyboard"));

        model.addAttribute("products", products);
        return "product_list";
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/products";
    }
}
