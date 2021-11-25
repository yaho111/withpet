package com.project.withpet.controller;

import com.project.withpet.model.Basket;
import com.project.withpet.service.BasketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("basket/*")
public class BasketController {

    @Autowired
    private BasketService basketService;

    // 01, 01-1 장바구니 리스트 및 값 정리
    @RequestMapping("/basketList")
    public String basketList(HttpSession session, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String id = (String) session.getAttribute("id"); //session에 저장된 userId
        List<Basket> list = basketService.basketList(id); //장바구니 정보
        int sumMoney = basketService.sumMoney(id); //장바구니 전체 금액 호출
        int fee = 2500;
        map.put("list", list);				// 장바구니 정보를 map에 저장
        map.put("count", list.size());		// 장바구니 상품의 유무
        map.put("sumMoney", sumMoney);		// 장바구니 전체 금액
        map.put("fee", fee); 				// 배송금액
        map.put("allSum", sumMoney+fee);	// 주문 상품 전체 금액
        model.addAttribute("map", map);			// map 변수 저장
        return "basket/basketList";
    }

    // 01-2, 01-3 장바구니에 상품 추가

    @RequestMapping("/basketInsert")
    public String insert(@ModelAttribute Basket basket, HttpSession session) {
        String id = (String) session.getAttribute("id");
        basket.setId(id);
        // 장바구니 상품 검사
        int count = basketService.countBasket(basket.getPro_no(),id);
        if(count == 0){
            // 없으면 insert
        basketService.insert(basket);
        }

        return "redirect:/basket/basketList";
        }
    }

