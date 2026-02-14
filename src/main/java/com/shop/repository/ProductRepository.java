package com.shop.repository;

import com.shop.model.Product;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class ProductRepository {

    private final List<Product> products = new ArrayList<>();

    public ProductRepository() {
        products.add(new Product(1L, "MacBook Pro", new BigDecimal("2500000"), "Apple M2 Chip, 16GB RAM"));
        products.add(new Product(2L, "Galaxy S24", new BigDecimal("1200000"), "AI Phone, 512GB"));
        products.add(new Product(3L, "Keyboard", new BigDecimal("150000"), "Mechanical Keyboard"));
    }

    public List<Product> findAll() {
        return products;
    }

    public Optional<Product> findById(Long id) {
        return products.stream()
                .filter(product -> product.getId().equals(id))
                .findFirst();
    }
}
