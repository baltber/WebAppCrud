package com.springapp.mvc.service;

import com.springapp.mvc.model.Product;

import java.util.List;

/**
 * Created by ser12 on 25.11.16.
 */
public interface ProductService {
    public void addProduct (Product product);
    public void updateProduct (Product product);
    public void removeProduct (int id);
    public Product getProductById(int id);
    public List<Product> listProducts();
}
