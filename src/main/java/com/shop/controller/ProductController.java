package com.shop.controller;

import com.shop.model.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProductController {

    private final com.shop.repository.ProductRepository productRepository;

    @org.springframework.beans.factory.annotation.Autowired
    public ProductController(com.shop.repository.ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping("/products")
    public String listProducts(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "product_list";
    }

    @GetMapping("/product/detail")
    public String getProduct(@org.springframework.web.bind.annotation.RequestParam("id") Long id, Model model) {
        Product product = productRepository.findById(id).orElse(null);
        model.addAttribute("product", product);
        return "product_detail";
    }

    @GetMapping("/")
    public String home() {
        return "redirect:/products";
    }
}
