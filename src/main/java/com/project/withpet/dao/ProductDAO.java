package com.project.withpet.dao;

import com.project.withpet.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAO {

   @Autowired
    private SqlSession sqlSession;

    // 01. 상품목록
    public List<Product> listProduct() {
        return sqlSession.selectList("product.listProduct");
    }

}
