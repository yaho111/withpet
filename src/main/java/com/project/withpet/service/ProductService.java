package com.project.withpet.service;


import com.project.withpet.dao.ProductDAO;
import com.project.withpet.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    // 01. 상품목록
    public List<Product> listProduct() {
        return productDAO.listProduct();
    }
}
