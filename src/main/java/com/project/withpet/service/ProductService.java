package com.project.withpet.service;


import com.project.withpet.dao.ProductDAO;
import com.project.withpet.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;


    // 01. 상품목록

    public List<Product> getProductList(int page) {
        return productDAO.getProductList(page);
    }

    // 01 -1. 리스트 데이터 카운트
    public int getCount() {
        return productDAO.getCount();
    }

    // 02 -1 상세페이지 조회수 증가
    public void updatepro_readcnt(int pro_no) {
        productDAO.updatepro_readcnt(pro_no);
    }

    // 02 -1 상세페이지 정보
    public Product getProductDetail(int pro_no) {
        return productDAO.getProductDetail(pro_no);
    }

    // 03 글쓰기
    public int productInsert(Product product) {
        return productDAO.productInsert(product);
    }

    public int productUpdate(Product product) {
        return productDAO.productUpdate(product);
    }


}

