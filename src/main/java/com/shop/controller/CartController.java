package com.shop.controller;

import com.shop.model.Cart;
import com.shop.model.Product;
import com.shop.repository.ProductRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final ProductRepository productRepository;

    @Autowired
    public CartController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @GetMapping
    public String viewCart(HttpSession session, Model model) {
        Cart cart = getCartFromSession(session);
        model.addAttribute("cart", cart);
        return "cart";
    }

    @PostMapping("/add")
    public String addToCart(@RequestParam("id") Long productId,
            @RequestParam(value = "quantity", defaultValue = "1") int quantity,
            HttpSession session) {
        Product product = productRepository.findById(productId).orElse(null);
        if (product != null) {
            Cart cart = getCartFromSession(session);
            cart.addItem(product, quantity);
        }
        return "redirect:/cart";
    }

    @PostMapping("/update")
    public String updateCart(@RequestParam("id") Long productId,
            @RequestParam("quantity") int quantity,
            HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.updateQuantity(productId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove")
    public String removeFromCart(@RequestParam("id") Long productId,
            HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.removeItem(productId);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart(HttpSession session) {
        Cart cart = getCartFromSession(session);
        cart.clear();
        return "redirect:/cart";
    }

    private Cart getCartFromSession(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }
}
