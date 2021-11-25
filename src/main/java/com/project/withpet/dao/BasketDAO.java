package com.project.withpet.dao;

import com.project.withpet.model.Basket;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BasketDAO {

    @Autowired
    private SqlSession sqlSession;

    //01 장바구니 리스트
    public List<Basket> basketList(String id) {
        return sqlSession.selectList("basket.basketList");
    }

    //01-1 장바구니 금액 불러오기
    public int sumMoney(String id) {
        sqlSession.selectOne("basket.sumMoney", id);
        return sqlSession.selectOne("basket.sumMoney", id);
    }

    //01-2 장바구니에 상품 추가
    public void insert(Basket basket){
        sqlSession.insert("basket.basketInsert", basket);
    }

    //01-3 장바구니 상품 확인
    public int countBasket(int pro_no, String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pro_no", pro_no);
        map.put("id", id);
        return sqlSession.selectOne("basket.countBasket",map);
    }
}
