package com.shop.repository;

import com.shop.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@Repository
public class ProductRepository {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ProductRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final RowMapper<Product> productRowMapper = new RowMapper<>() {
        @Override
        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setId(rs.getLong("product_id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getBigDecimal("price"));
            product.setDescription(rs.getString("description"));
            return product;
        }
    };

    public List<Product> findAll() {
        String sql = "SELECT product_id, name, price, description FROM product WHERE is_active = 1 ORDER BY product_id";
        return jdbcTemplate.query(sql, productRowMapper);
    }

    public Optional<Product> findById(Long id) {
        String sql = "SELECT product_id, name, price, description FROM product WHERE product_id = ?";
        List<Product> results = jdbcTemplate.query(sql, productRowMapper, id);
        return results.stream().findFirst();
    }
}

