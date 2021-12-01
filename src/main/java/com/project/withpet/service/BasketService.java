package com.project.withpet.service;

import com.project.withpet.dao.BasketDAO;
import com.project.withpet.model.Basket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BasketService {

    @Autowired
    private BasketDAO basketDao;


    // 01. 장바구니 목록
    public List<Basket> basketList(String id) {
        return basketDao.basketList(id);
    }
    
    // 01-1 . 장바구니 금액 불러오기
    public int sumMoney(String id) {
        return basketDao.sumMoney(id);
    }

    // 01-2. 장바구니에 상품 추가
    public void insert(Basket basket){
        basketDao.insert(basket);
    }

    // 01-3 장바구니 상품 확인
    public int countBasket(int pro_no, String id){
        return basketDao.countBasket(pro_no, id);
    }

    // 01-4 장바구니 상품 수량 변경
    public void updateBasket(Basket basket) {
        basketDao.updateBasket(basket);
    }

    // 02 장바구니 수정
    public void modifyBasket(Basket basket) {
        basketDao.modifyBasket(basket);
    }

    // 03 장바구니 상품 삭제
    public void delete(Basket basket) {
        basketDao.delete(basket);
    }

}