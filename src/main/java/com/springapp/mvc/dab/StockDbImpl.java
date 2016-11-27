package com.springapp.mvc.dab;


import com.springapp.mvc.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by ser12 on 25.11.16.
 */
@Repository
public class StockDbImpl implements StockDb {
    private static final Logger logger = org.slf4j.LoggerFactory.getLogger(StockDbImpl.class);


    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(product);
        logger.info("This product was successfully added. Information: " + product);
    }

    @Override
    public void updateProduct(Product product) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(product);
        logger.info("This product was successfully changed. Information: " + product);
    }

    @Override
    public void removeProduct(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));

        if(product!=null){
            session.delete(product);
            logger.info("The product was deleted successfully. Information: " + product);
        }
    }

    @Override
    public Product getProductById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Product product = (Product) session.load(Product.class, new Integer(id));
        logger.info("Product loaded. Information: " + product);
        return product;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> listProducts() {
        Session session = this.sessionFactory.getCurrentSession();
        List <Product> productList = session.createQuery("from Product").list();

        for(Product product: productList){
            logger.info("Product list: " + product);
        }
        return productList;
    }
}
