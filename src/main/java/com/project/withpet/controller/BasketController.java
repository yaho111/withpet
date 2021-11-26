package com.project.withpet.controller;

import com.project.withpet.model.Basket;
import com.project.withpet.service.BasketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BasketController {

    @Autowired
    private BasketService basketService;

    // 01 장바구니 리스트
    // 01-1 장바구니 금액 불러오기
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

    // 01-2 장바구니 상품 추가
    // 01-3 장바구니 상품 확인
    // 01-4 장바구니 상품 수량 변경

    @RequestMapping("/basketInsert")
    public String insert(@ModelAttribute Basket basket, HttpSession session) {
        String id = (String) session.getAttribute("id");
        basket.setId(id);
        // 장바구니 상품 검사
        int count = basketService.countBasket(basket.getPro_no(),id);
        if(count == 0){
            // 없으면 insert
            basketService.insert(basket);
        } else { // 있으면 업데이트
            basketService.updateBasket(basket);
        }
        return "redirect:/basketList";
        }

        // 02 장바구니 상품 수정
    @RequestMapping("/basketUpdate")
    public String update(@RequestParam int[] ea, @RequestParam int[] pro_no, HttpSession session) {
        // session의 id
        String id = (String) session.getAttribute("id");
        // 레코드의 갯수 만큰 반복문 실행
        for(int i=0; i<pro_no.length; i++){
            Basket basket = new Basket();
            basket.setId(id);
            basket.setEa(ea[i]);
            basket.setPro_no(pro_no[i]);
            basketService.modifyBasket(basket);
        }

        return "redirect:/basketList";
    }
    }

