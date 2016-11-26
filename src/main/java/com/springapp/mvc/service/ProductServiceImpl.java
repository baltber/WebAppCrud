package com.springapp.mvc.service;

import com.springapp.mvc.dab.StockDb;
import com.springapp.mvc.model.Product;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by ser12 on 25.11.16.
 */
@Service
public class ProductServiceImpl implements ProductService {



    private StockDb stockDb;
    public void setStockDb(StockDb stockDb) {
        this.stockDb = stockDb;
    }


    @Override
    @Transactional
    public void addProduct(Product product) {
        this.stockDb.addProduct(product);

    }

    @Override
    @Transactional
    public void updateProduct(Product product) {
        this.stockDb.updateProduct(product);
    }

    @Override
    @Transactional
    public void removeProduct(int id) {
        this.stockDb.removeProduct(id);
    }

    @Override
    @Transactional
    public Product getProductById(int id) {
        return this.stockDb.getProductById(id);
    }

    @Override
    @Transactional
    public List<Product> listProducts() {
        return this.stockDb.listProducts();
    }
}
