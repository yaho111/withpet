package com.project.withpet.dao;

import com.project.withpet.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {

   @Autowired
    private SqlSession sqlSession;



        // 01. 상품목록
    public List<Product> getProductList(int page) {

        return sqlSession.selectList("product.productList", page);
    }

    // 01 -1. 리스트 데이터 카운트
    public int getCount() {
        return sqlSession.selectOne("countProduct");
    }




//    // 02. 상품상세
//    public Product detailProduct(int pro_no) {
//        return sqlSession.selectOne("product.detailProduct", pro_no);
//    }


}
