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

    private final com.shop.repository.ProductRepository productRepository;

    public ProductController(com.shop.repository.ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        model.addAttribute("products", productRepository.findAll());
        return "product_list";
    }

    @GetMapping("/product")
    public String getProduct(@org.springframework.web.bind.annotation.RequestParam("id") Long id, Model model) {
        com.shop.model.Product product = productRepository.findById(id);
        if (product == null) {
            return "redirect:/products";
        }
        model.addAttribute("product", product);
        return "product_detail";
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/products";
    }
}
