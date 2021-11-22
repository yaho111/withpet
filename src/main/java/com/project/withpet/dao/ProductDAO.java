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

    // 02 -1 상세페이지 조회수 증가
    public void updatepro_readcnt(int pro_no) {
        // TODO Auto-generated method stub
        sqlSession.update("hit", pro_no);
    }

    // 02  상세페이지 정보
    public Product getProductDetail(int pro_no) {
        // TODO Auto-generated method stub
        return sqlSession.selectOne("pro_content", pro_no);
    }

    // 03. 글쓰기
    public int productInsert(Product product) {
        return sqlSession.insert("product.productWrite", product);
    }



}
