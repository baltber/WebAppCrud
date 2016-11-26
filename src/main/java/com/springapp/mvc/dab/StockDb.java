package com.springapp.mvc.dab;

import com.springapp.mvc.model.Product;

import java.util.List;

/**
 * Created by ser12 on 25.11.16.
 */
public interface StockDb {
    public void addProduct (Product product);
    public void updateProduct (Product product);
    public void removeProduct (int id);
    public Product getProductById(int id);
    public List<Product> listProducts();
}
