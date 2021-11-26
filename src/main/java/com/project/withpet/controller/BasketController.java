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
public class BasketController {

    @Autowired
    private BasketService basketService;

    // 01, 01-1 장바구니 리스트 및 값 정리
    @RequestMapping("/basketList")
    public String basketList(HttpSession session, Model model) {
        Map<String, Object> map = new HashMap<String, Object>();
        String id = (String) session.getAttribute("id"); //session에 저장된 userId
        List<Basket> list = basketService.basketList(id); //장바구니 정보
        int totalOrderPrice = basketService.sumMoney(id); //장바구니 전체 금액 호출
        int shippingFee = 2500;
        model.addAttribute("list", list);				// 장바구니 정보를 map에 저장
        model.addAttribute("count", list.size());		// 장바구니 상품의 유무
        model.addAttribute("totalOrderPrice", totalOrderPrice);		// 장바구니 전체 금액
        model.addAttribute("shippingFee", shippingFee); 				// 배송금액
        model.addAttribute("allSum", totalOrderPrice+shippingFee);	// 주문 상품 전체 금액
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

        return "redirect:/basketList";
        }
    }

